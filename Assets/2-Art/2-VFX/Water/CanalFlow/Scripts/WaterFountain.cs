using System.Collections.Generic;
using UnityEngine;

/// Procedural water for a tiered fountain (pivot on the fountain axis, Y up).
/// - Surfaces renderer ("Fountain Pool" shader): one water disc per basin; ripples open outwards from the
///   radius where the water lands, stronger while the basin is being filled.
/// - Curtains renderer ("Cascade Flow" shader): water running down the spout (film hugging its profile,
///   or arcing jets) and the overflow curtains over each basin lip.
/// - Spout bubble: optional particle system (e.g. the WaterBall effect) welling out of the mouth.
/// Turning on runs the physical sequence (spout -> top basin fills -> overflows -> next basin fills ...);
/// turning off thins every curtain into rivulets, cuts it in the same order and drains the basins.
/// Water fronts travel at the real speed through _FrontTime/_TailTime (MaterialPropertyBlock).
[ExecuteAlways]
[DisallowMultipleComponent]
public class WaterFountain : MonoBehaviour
{
    public enum SpoutMode { Film, Arcs }

    [System.Serializable]
    public class Basin
    {
        public string name = "Basin";
        [Tooltip("Local height of the dry basin floor.")]
        public float floorHeight;
        [Tooltip("Local height of the full water surface.")]
        public float waterHeight = 0.1f;
        [Tooltip("Water disc inner radius (column / pedestal).")]
        public float innerRadius = 0.1f;
        [Tooltip("Water disc outer radius (inner face of the basin wall).")]
        public float outerRadius = 0.5f;
        [Tooltip("Seconds to fill once water arrives.")]
        public float fillTime = 2.5f;
        [Tooltip("Seconds to drain once no more water arrives.")]
        public float drainTime = 3f;

        [Header("Overflow (falls into the next basin of the list)")]
        public bool overflow = true;
        [Tooltip("Radius of the outer edge of the lip the water spills over.")]
        public float lipRadius = 0.55f;
        [Tooltip("Local height of the lip top.")]
        public float lipHeight = 0.12f;
        [Tooltip("Horizontal speed leaving the lip (m/s).")]
        public float spillSpeed = 0.25f;
        [Tooltip("0 = continuous curtain, otherwise number of separate streams.")]
        public int streams;
        [Range(0f, 1f)] public float streamGap = 0.5f;
    }

    [Header("Basins (top to bottom)")]
    public Basin[] basins = new Basin[0];

    [Header("Spout (falls into basin 0)")]
    public SpoutMode spoutMode = SpoutMode.Film;
    [Tooltip("Film: (radius, height) points of the water running down the spout, top to bottom (just outside the stone).")]
    public Vector2[] spoutProfile = new Vector2[0];
    [Tooltip("Film: speed at the top of the spout (m/s).")]
    public float filmStartSpeed = 0.25f;
    [Range(0f, 1f)] public float filmFriction = 0.5f;
    public int filmStreams = 7;
    [Range(0f, 1f)] public float filmStreamGap = 0.3f;
    [Tooltip("Arcs: height of the nozzle.")]
    public float jetHeight = 1f;
    public float jetUpSpeed = 1f;
    public float jetOutSpeed = 0.35f;
    public float jetStartRadius = 0.01f;
    public int jetStreams = 8;
    [Range(0f, 1f)] public float jetStreamGap = 0.9f;

    [Header("Look")]
    public float segmentLength = 0.04f;
    [Range(16, 128)] public int angularSegments = 64;
    [Range(2, 24)] public int surfaceRings = 10;
    [Tooltip("Water height above the lip while overflowing (m).")]
    public float overflowThickness = 0.006f;
    [Tooltip("Must match _ThinTime of the curtain material: seconds a curtain thins before it is cut.")]
    public float thinTime = 1.2f;

    [Header("References")]
    public MeshFilter surfaces;
    public MeshFilter curtains;
    [Tooltip("Particles welling out of the mouth (e.g. the WaterBall effect).")]
    public ParticleSystem spoutBubble;
    [Tooltip("Arcs mode spray at the nozzle.")]
    public ParticleSystem jetSpray;
    [Tooltip("One per basin: splash ring where water lands in that basin.")]
    public ParticleSystem[] landingSplashes = new ParticleSystem[0];
    public int firstSplashBurst = 14;

    [Header("State")]
    [Tooltip("Running when the scene starts (otherwise call SetRunning(true), e.g. when the puzzle is solved).")]
    public bool startRunning;
    [Header("Editor preview")]
    [Tooltip("Scrub the sequence while editing: seconds since turning on (or off). -1 = running, full.")]
    public float previewTime = -1f;
    [Tooltip("Preview time counts from turning OFF a full fountain.")]
    public bool previewDraining;

    static readonly int FrontId = Shader.PropertyToID("_FrontTime");
    static readonly int TailId = Shader.PropertyToID("_TailTime");
    const float G = 9.81f;
    const float Far = 100000f;

    Mesh surfaceMesh, curtainMesh;
    MaterialPropertyBlock mpb;
    bool dirty = true;
    bool running;
    float onTime = -Far, offTime = -Far;
    float lastFront = -Far;

    // schedule (seconds since turned on)
    float[] sourceStart, arriveAt, landRadius;
    float[] levels, activities;
    bool surfacesDirty = true;

    public bool IsRunning => running;

    void OnEnable()
    {
        dirty = true;
        if (Application.isPlaying && startRunning) SetRunning(true);
        Rebuild();
    }

    void OnValidate() => dirty = true;

    void OnDestroy()
    {
        DestroyMesh(surfaceMesh);
        DestroyMesh(curtainMesh);
    }

    public void SetRunning(bool on)
    {
        if (on == running) return;
        running = on;
        if (on) onTime = Time.time; else offTime = Time.time;
    }

    [ContextMenu("Turn On")] void TurnOn() => SetRunning(true);
    [ContextMenu("Turn Off")] void TurnOff() => SetRunning(false);

    void Update()
    {
        if (dirty) Rebuild();

        // front: seconds of water released since turning on. tail: seconds since turning off.
        float front, tail;
        if (!Application.isPlaying)
        {
            if (previewTime < 0f) { front = Far; tail = -Far; }
            else if (previewDraining) { front = Far; tail = previewTime; }
            else { front = previewTime; tail = -Far; }
        }
        else if (running) { front = Time.time - onTime; tail = -Far; }
        else if (offTime > onTime) { front = offTime - onTime; tail = Time.time - offTime; }
        else { front = -1f; tail = -Far; } // never started: dry

        bool changed = surfacesDirty;
        for (int i = 0; i < basins.Length; i++)
        {
            var b = basins[i];
            float fill = Mathf.Clamp01((front - arriveAt[i]) / Mathf.Max(0.01f, b.fillTime));
            float inflow = front > arriveAt[i] ? 1f : 0f;
            float drain = 0f;
            if (tail > -Far * 0.5f)
            {
                // the source of this basin thins out, then the basin drains
                float stopAt = sourceStart[i];
                inflow *= 1f - Mathf.Clamp01((tail - stopAt) / Mathf.Max(0.01f, thinTime));
                drain = Mathf.Clamp01((tail - stopAt - thinTime) / Mathf.Max(0.01f, b.drainTime));
            }
            float levelFrac = EaseOut(fill) * (1f - SmoothStep(drain));
            float level = Mathf.Lerp(b.floorHeight, b.waterHeight, levelFrac);
            // churning while filling, steady flow when overflowing, calm when nothing arrives
            float activity = inflow * Mathf.Lerp(1f, 0.7f, fill);
            activity = Mathf.Round(activity * 50f) / 50f;
            if (float.IsNaN(levels[i]) || Mathf.Abs(level - levels[i]) > 0.0005f || activity != activities[i])
            { levels[i] = level; activities[i] = activity; changed = true; }

            if (Application.isPlaying && i < landingSplashes.Length && landingSplashes[i] != null)
            {
                var ps = landingSplashes[i];
                var p = ps.transform.localPosition;
                ps.transform.localPosition = new Vector3(p.x, Mathf.Max(level, b.floorHeight + 0.01f), p.z);
                SetEmitting(ps, inflow > 0.5f);
                if (lastFront < arriveAt[i] && front >= arriveAt[i] && tail < 0f) ps.Emit(firstSplashBurst);
            }
        }
        if (changed) BuildSurfaces();
        surfacesDirty = false;

        ApplyFlow(front, tail);
        if (Application.isPlaying)
        {
            bool spoutOn = front > 0f && tail < thinTime * 0.5f;
            if (spoutBubble != null) SetEmitting(spoutBubble, spoutOn);
            if (jetSpray != null) SetEmitting(jetSpray, spoutOn && spoutMode == SpoutMode.Arcs);
        }
        lastFront = front;
    }

    static float EaseOut(float x) => 1f - (1f - x) * (1f - x);
    static float SmoothStep(float x) => x * x * (3f - 2f * x);

    void ApplyFlow(float front, float tail)
    {
        if (curtains == null) return;
        mpb ??= new MaterialPropertyBlock();
        var r = curtains.GetComponent<Renderer>();
        r.GetPropertyBlock(mpb);
        mpb.SetFloat(FrontId, front);
        mpb.SetFloat(TailId, tail);
        r.SetPropertyBlock(mpb);
    }

    static void SetEmitting(ParticleSystem ps, bool on)
    {
        if (on && !ps.isEmitting) ps.Play(true);
        else if (!on && ps.isEmitting) ps.Stop(true, ParticleSystemStopBehavior.StopEmitting);
    }

    // ------------------------------------------------------------------ geometry

    public void Rebuild()
    {
        dirty = false;
        int n = basins.Length;
        sourceStart = new float[n];
        arriveAt = new float[n];
        landRadius = new float[n];
        levels = new float[n];
        activities = new float[n];
        for (int i = 0; i < n; i++) { levels[i] = float.NaN; activities[i] = -1f; }
        surfacesDirty = true;

        var c = new SheetBuffers();
        if (n > 0)
        {
            if (spoutMode == SpoutMode.Film && spoutProfile != null && spoutProfile.Length >= 2)
            {
                arriveAt[0] = AddProfileSheet(c, spoutProfile, basins[0].waterHeight, 0f);
                landRadius[0] = spoutProfile[spoutProfile.Length - 1].x;
            }
            else
            {
                float tLand = BallisticTime(jetHeight, jetUpSpeed, basins[0].waterHeight);
                landRadius[0] = jetStartRadius + jetOutSpeed * tLand;
                AddRingSheet(c, new Vector2(jetStartRadius, jetHeight), new Vector2(jetOutSpeed, jetUpSpeed),
                    basins[0].waterHeight, 0f, jetStreams, jetStreamGap, null);
                arriveAt[0] = tLand;
            }
        }

        for (int i = 0; i < n; i++)
        {
            var b = basins[i];
            if (!b.overflow || i + 1 >= n) continue;
            var next = basins[i + 1];
            float startT = arriveAt[i] + b.fillTime;
            Vector2 rimStart = new Vector2(b.outerRadius - 0.02f, b.waterHeight + 0.002f);
            Vector2 lip = new Vector2(b.lipRadius, b.lipHeight + overflowThickness);
            float tFall = BallisticTime(lip.y, 0f, next.waterHeight);
            landRadius[i + 1] = lip.x + b.spillSpeed * tFall;
            AddRingSheet(c, lip, new Vector2(b.spillSpeed, 0f), next.waterHeight, startT, b.streams, b.streamGap, rimStart);
            float rimRun = Vector2.Distance(rimStart, lip) / Mathf.Max(0.05f, b.spillSpeed);
            sourceStart[i + 1] = startT;
            arriveAt[i + 1] = startT + rimRun + tFall;
        }

        curtainMesh = Assign(curtains, curtainMesh, "WaterFountain Curtains", c, true);
        ConfigureParticles();
    }

    class SheetBuffers
    {
        public readonly List<Vector3> v = new List<Vector3>(), n = new List<Vector3>();
        public readonly List<Vector2> uv0 = new List<Vector2>(), uv1 = new List<Vector2>(), uv2 = new List<Vector2>(), uv3 = new List<Vector2>();
        public readonly List<int> tris = new List<int>();
    }

    void BuildSurfaces()
    {
        if (surfaces == null) return;
        var c = new SheetBuffers();
        for (int i = 0; i < basins.Length; i++)
        {
            var b = basins[i];
            float level = float.IsNaN(levels[i]) ? b.waterHeight : levels[i];
            if (level <= b.floorHeight + 0.003f) continue;
            float fillT = Mathf.InverseLerp(b.floorHeight, b.waterHeight, level);
            float outer = Mathf.Lerp(b.outerRadius - 0.03f, b.outerRadius, fillT) + 0.01f;
            float inner = Mathf.Max(0f, b.innerRadius - 0.01f);
            float land = landRadius[i] > 0f ? landRadius[i] : inner;
            AddAnnulus(c, inner, outer, level, land, Mathf.Max(0f, activities[i]));
        }
        surfaceMesh = Assign(surfaces, surfaceMesh, "WaterFountain Surfaces", c, false);
    }

    static float BallisticTime(float y0, float vy, float yEnd)
    {
        float a = 0.5f * G, cc = yEnd - y0;
        float disc = vy * vy - 4f * a * cc;
        return (vy + Mathf.Sqrt(Mathf.Max(0f, disc))) / (2f * a);
    }

    /// Water film running down an axisymmetric profile; returns the arrival time at its end.
    float AddProfileSheet(SheetBuffers c, Vector2[] profile, float endHeight, float timeOffset)
    {
        var prof = new List<Vector2>();
        float step = Mathf.Max(0.005f, segmentLength * 0.4f);
        for (int i = 0; i < profile.Length - 1; i++)
        {
            int k = Mathf.Max(1, Mathf.CeilToInt(Vector2.Distance(profile[i], profile[i + 1]) / step));
            for (int j = 0; j < k; j++) prof.Add(Vector2.Lerp(profile[i], profile[i + 1], (float)j / k));
        }
        var last = profile[profile.Length - 1];
        prof.Add(new Vector2(last.x, Mathf.Min(last.y, endHeight)));

        var arr = new List<float>(); var aer = new List<float>(); var tan = new List<Vector2>();
        float t = 0f, y0 = prof[0].y;
        for (int i = 0; i < prof.Count; i++)
        {
            if (i > 0)
            {
                float vA = FilmSpeed(y0 - prof[i - 1].y), vB = FilmSpeed(y0 - prof[i].y);
                t += Vector2.Distance(prof[i], prof[i - 1]) / Mathf.Max(0.05f, 0.5f * (vA + vB));
            }
            arr.Add(timeOffset + t);
            aer.Add(0.25f * Mathf.InverseLerp(y0, endHeight, prof[i].y));
            Vector2 d = i < prof.Count - 1 ? prof[i + 1] - prof[i] : prof[i] - prof[i - 1];
            tan.Add(d.normalized);
        }
        AddRevolution(c, prof, tan, arr, aer, filmStreams, filmStreamGap, timeOffset);
        return timeOffset + t;
    }

    float FilmSpeed(float drop) => Mathf.Sqrt(filmStartSpeed * filmStartSpeed + 2f * G * (1f - filmFriction) * Mathf.Max(0f, drop));

    /// Axisymmetric free-falling sheet; optional run-in segment from rimStart to start.
    void AddRingSheet(SheetBuffers c, Vector2 start, Vector2 velocity, float endHeight, float timeOffset, int streams, float streamGap, Vector2? rimStart)
    {
        var prof = new List<Vector2>(); var tan = new List<Vector2>(); var arr = new List<float>(); var aer = new List<float>();
        float step = Mathf.Max(0.01f, segmentLength);
        float tRun = 0f;
        if (rimStart.HasValue)
        {
            Vector2 a = rimStart.Value; float len = Vector2.Distance(a, start);
            int k = Mathf.Max(1, Mathf.CeilToInt(len / step));
            tRun = len / Mathf.Max(0.05f, velocity.x);
            for (int i = 0; i < k; i++)
            {
                float f = (float)i / k;
                prof.Add(Vector2.Lerp(a, start, f)); tan.Add((start - a).normalized); arr.Add(timeOffset + tRun * f); aer.Add(0f);
            }
        }
        float tEnd = BallisticTime(start.y, velocity.y, endHeight);
        for (float t = 0f; ;)
        {
            bool last = t >= tEnd; if (last) t = tEnd;
            prof.Add(new Vector2(start.x + velocity.x * t, start.y + velocity.y * t - 0.5f * G * t * t));
            tan.Add(new Vector2(velocity.x, velocity.y - G * t).normalized);
            arr.Add(timeOffset + tRun + t);
            aer.Add(t / tEnd);
            if (last) break;
            float speed = new Vector2(velocity.x, velocity.y - G * t).magnitude;
            t += step / Mathf.Max(0.1f, speed);
        }
        AddRevolution(c, prof, tan, arr, aer, streams, streamGap, timeOffset);
    }

    void AddRevolution(SheetBuffers c, List<Vector2> prof, List<Vector2> tan, List<float> arr, List<float> aer, int streams, float streamGap, float elemStart)
    {
        int seg = angularSegments, cols = seg + 1, baseIndex = c.v.Count;
        float maxR = 0f; foreach (var p in prof) maxR = Mathf.Max(maxR, p.x);
        float circumference = Mathf.Max(1f, Mathf.Round(2f * Mathf.PI * maxR)); // integer metres: seamless tiling
        float dist = 0f;
        for (int i = 0; i < prof.Count; i++)
        {
            if (i > 0) dist += Vector2.Distance(prof[i], prof[i - 1]);
            for (int j = 0; j < cols; j++)
            {
                float a01 = (float)j / seg, ang = a01 * 2f * Mathf.PI;
                var radial = new Vector3(Mathf.Sin(ang), 0f, Mathf.Cos(ang));
                c.v.Add(radial * prof[i].x + Vector3.up * prof[i].y);
                c.n.Add((radial * -tan[i].y + Vector3.up * tan[i].x).normalized);
                float across = 0.5f;
                if (streams > 0)
                {
                    // gaps between streams open while falling (streamGap = fraction of the circle left empty)
                    float s = Mathf.Abs(Mathf.Sin(streams * ang * 0.5f));
                    float gap = Mathf.SmoothStep(0f, 1f, Mathf.InverseLerp(1f - streamGap, 1f, s));
                    across = 0.5f + 0.5f * gap * Mathf.Clamp01(aer[i] * 3f + 0.2f);
                }
                c.uv0.Add(new Vector2(a01 * circumference, dist));
                c.uv1.Add(new Vector2(across, aer[i]));
                c.uv2.Add(new Vector2(arr[i], 0f));
                c.uv3.Add(new Vector2(elemStart, 0f));
            }
        }
        for (int i = 0; i < prof.Count - 1; i++)
        for (int j = 0; j < seg; j++)
        {
            int v00 = baseIndex + i * cols + j, v10 = v00 + cols, v01 = v00 + 1, v11 = v10 + 1;
            c.tris.Add(v00); c.tris.Add(v01); c.tris.Add(v10);
            c.tris.Add(v01); c.tris.Add(v11); c.tris.Add(v10);
        }
    }

    /// Flat water ring for the "Fountain Pool" shader: uv0 = (landing radius, activity), uv1 = (inner, outer).
    void AddAnnulus(SheetBuffers c, float r0, float r1, float y, float landing, float activity)
    {
        int seg = angularSegments, cols = seg + 1, baseIndex = c.v.Count;
        int rings = surfaceRings;
        for (int i = 0; i <= rings; i++)
        {
            float r = Mathf.Lerp(r0, r1, (float)i / rings);
            for (int j = 0; j < cols; j++)
            {
                float ang = (float)j / seg * 2f * Mathf.PI;
                c.v.Add(new Vector3(Mathf.Sin(ang) * r, y, Mathf.Cos(ang) * r));
                c.n.Add(Vector3.up);
                c.uv0.Add(new Vector2(landing, activity));
                c.uv1.Add(new Vector2(r0 + 0.01f, r1 - 0.01f));
            }
        }
        for (int i = 0; i < rings; i++)
        for (int j = 0; j < seg; j++)
        {
            int v00 = baseIndex + i * cols + j, v10 = v00 + cols, v01 = v00 + 1, v11 = v10 + 1;
            c.tris.Add(v00); c.tris.Add(v10); c.tris.Add(v01);
            c.tris.Add(v01); c.tris.Add(v10); c.tris.Add(v11);
        }
    }

    Mesh Assign(MeshFilter mf, Mesh mesh, string name, SheetBuffers c, bool tangents)
    {
        if (mf == null) return mesh;
        if (mesh == null) { mesh = new Mesh { name = name, hideFlags = HideFlags.DontSave }; mesh.MarkDynamic(); }
        mesh.Clear();
        mesh.indexFormat = c.v.Count > 65000 ? UnityEngine.Rendering.IndexFormat.UInt32 : UnityEngine.Rendering.IndexFormat.UInt16;
        mesh.SetVertices(c.v); mesh.SetNormals(c.n);
        mesh.SetUVs(0, c.uv0); mesh.SetUVs(1, c.uv1);
        if (c.uv2.Count == c.v.Count) mesh.SetUVs(2, c.uv2);
        if (c.uv3.Count == c.v.Count) mesh.SetUVs(3, c.uv3);
        mesh.subMeshCount = 1;
        mesh.SetTriangles(c.tris, 0, false);
        if (tangents && c.v.Count > 0) mesh.RecalculateTangents();
        mesh.RecalculateBounds();
        mf.sharedMesh = mesh;
        return mesh;
    }

    void ConfigureParticles()
    {
        float mouth = spoutMode == SpoutMode.Film && spoutProfile != null && spoutProfile.Length > 0 ? spoutProfile[0].y : jetHeight;
        if (jetSpray != null) jetSpray.transform.localPosition = new Vector3(0f, mouth, 0f);
        for (int i = 0; i < landingSplashes.Length && i < basins.Length; i++)
        {
            var ps = landingSplashes[i];
            if (ps == null || landRadius[i] <= 0f) continue;
            ps.transform.localPosition = new Vector3(0f, basins[i].waterHeight, 0f);
            var shape = ps.shape;
            shape.radius = landRadius[i];
            var em = ps.emission;
            em.rateOverTime = Mathf.Round(2f * Mathf.PI * landRadius[i] * 9f);
        }
    }

    void DestroyMesh(Mesh m)
    {
        if (m == null) return;
        if (Application.isPlaying) Destroy(m); else DestroyImmediate(m);
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.matrix = transform.localToWorldMatrix;
        Gizmos.color = new Color(0.3f, 0.8f, 1f);
        foreach (var b in basins)
        {
            DrawCircle(b.outerRadius, b.waterHeight);
            DrawCircle(b.innerRadius, b.waterHeight);
            if (b.overflow) DrawCircle(b.lipRadius, b.lipHeight);
        }
        if (spoutProfile != null)
            for (int i = 0; i < spoutProfile.Length - 1; i++)
                Gizmos.DrawLine(new Vector3(0f, spoutProfile[i].y, spoutProfile[i].x), new Vector3(0f, spoutProfile[i + 1].y, spoutProfile[i + 1].x));
    }

    static void DrawCircle(float r, float y)
    {
        Vector3 prev = new Vector3(0f, y, r);
        for (int i = 1; i <= 32; i++)
        {
            float a = i / 32f * 2f * Mathf.PI;
            var p = new Vector3(Mathf.Sin(a) * r, y, Mathf.Cos(a) * r);
            Gizmos.DrawLine(prev, p); prev = p;
        }
    }
}
