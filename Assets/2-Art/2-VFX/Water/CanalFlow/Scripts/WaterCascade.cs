using System.Collections.Generic;
using UnityEngine;

/// Procedural waterfall sheet for the "SevenWonders/Water/Cascade Flow" shader.
/// Pivot = centre of the lip. Water runs along local +Z over an inflow, leaves the lip and falls
/// ballistically (local -Y) for dropHeight metres, ending on an impact foam disc.
/// The mesh is rebuilt on enable (not saved in the scene), so edit the values and it updates live.
[ExecuteAlways]
[DisallowMultipleComponent]
[RequireComponent(typeof(MeshFilter), typeof(MeshRenderer))]
public class WaterCascade : MonoBehaviour
{
    [Header("Shape")]
    [Tooltip("Sheet width at the lip (m).")]
    public float width = 0.4f;
    [Tooltip("Width multiplier at the impact (falling water fans out).")]
    public float bottomWidthScale = 1.15f;
    [Tooltip("Flat run before the lip (m), starts inside the source channel.")]
    public float inflowLength = 0.12f;
    [Tooltip("Vertical drop from the lip to the receiving surface (m).")]
    public float dropHeight = 1f;
    [Tooltip("Horizontal speed when leaving the lip (m/s). Higher = jumps further from the wall.")]
    public float launchSpeed = 1f;
    [Tooltip("Gravity multiplier (lower = softer, more sliding arc).")]
    public float gravityScale = 1f;
    [Tooltip("Outward bow of the sheet centre (m), avoids a flat card look.")]
    public float sheetBulge = 0.02f;

    [Header("Impact foam")]
    [Tooltip("Radius of the foam disc at the impact (m). 0 disables it.")]
    public float impactFoamRadius = 0.28f;
    [Tooltip("Height of the foam disc above the receiving surface (m).")]
    public float impactFoamLift = 0.008f;
    [Tooltip("Speed of the foam drifting downstream from the impact (m/s).")]
    public float impactSpreadSpeed = 0.5f;

    [Tooltip("Optional child splash (e.g. particle system), kept on the impact point.")]
    public Transform splash;

    [Header("Tessellation")]
    [Tooltip("Approximate edge length along the flow (m).")]
    public float segmentLength = 0.05f;
    [Range(1, 16)] public int widthSegments = 6;
    [Range(8, 48)] public int impactSegments = 20;
    [Range(2, 8)] public int impactRings = 4;

    const float Gravity = 9.81f;

    Mesh mesh;
    bool dirty = true;

    /// Impact point (local space), centre of the sheet bottom.
    public Vector3 ImpactPointLocal
    {
        get
        {
            float tImpact = ImpactTime;
            return new Vector3(0f, -dropHeight, launchSpeed * tImpact);
        }
    }

    float G => Gravity * Mathf.Max(0.01f, gravityScale);
    float ImpactTime => Mathf.Sqrt(2f * Mathf.Max(0.01f, dropHeight) / G);

    void OnEnable()
    {
        dirty = true;
        Rebuild();
    }

    void OnValidate() => dirty = true;

    void Update()
    {
        if (dirty) Rebuild();
    }

    void OnDestroy()
    {
        if (mesh == null) return;
        if (Application.isPlaying) Destroy(mesh); else DestroyImmediate(mesh);
    }

    public void Rebuild()
    {
        dirty = false;
        if (mesh == null)
        {
            mesh = new Mesh { name = "WaterCascade (generated)", hideFlags = HideFlags.DontSave };
            mesh.MarkDynamic();
        }
        GetComponent<MeshFilter>().sharedMesh = mesh;

        var pos = new List<Vector3>();
        var uv0 = new List<Vector2>(); // across m, distance m
        var uv1 = new List<Vector2>(); // across 0..1, aeration
        var uv2 = new List<Vector2>(); // arrival time s, is impact disc
        var tris = new List<int>();

        float step = Mathf.Max(0.01f, segmentLength);
        float v0 = Mathf.Max(0.05f, launchSpeed);
        float g = G;
        float tImpact = ImpactTime;

        // --- Centre line: inflow (flat) then ballistic fall
        var centre = new List<Vector3>();
        var tangent = new List<Vector3>();
        var arrival = new List<float>();
        var fall01 = new List<float>();

        int inflowSteps = Mathf.Max(1, Mathf.CeilToInt(inflowLength / step));
        for (int i = 0; i < inflowSteps; i++)
        {
            float z = -inflowLength + inflowLength * i / inflowSteps;
            centre.Add(new Vector3(0f, 0f, z));
            tangent.Add(Vector3.forward);
            arrival.Add((z + inflowLength) / v0);
            fall01.Add(0f);
        }
        float inflowTime = inflowLength / v0;
        for (float t = 0f; ; )
        {
            bool last = t >= tImpact;
            if (last) t = tImpact;
            centre.Add(new Vector3(0f, -0.5f * g * t * t, v0 * t));
            tangent.Add(new Vector3(0f, -g * t, v0).normalized);
            arrival.Add(inflowTime + t);
            fall01.Add(t / tImpact);
            if (last) break;
            float speed = Mathf.Sqrt(v0 * v0 + g * t * g * t);
            t += step / speed;
        }

        // --- Sheet
        int cols = widthSegments + 1;
        float dist = 0f;
        for (int i = 0; i < centre.Count; i++)
        {
            if (i > 0) dist += Vector3.Distance(centre[i], centre[i - 1]);
            Vector3 T = tangent[i];
            Vector3 N = new Vector3(0f, T.z, -T.y); // cross(T, right): up on the inflow, outward while falling
            float f = fall01[i];
            float w = width * Mathf.Lerp(1f, bottomWidthScale, Mathf.Pow(f, 0.7f));
            for (int j = 0; j < cols; j++)
            {
                float a = (float)j / widthSegments; // 0..1 across
                float x = a * 2f - 1f;
                Vector3 p = centre[i] + Vector3.right * (x * 0.5f * w) + N * (sheetBulge * (1f - x * x));
                pos.Add(p);
                uv0.Add(new Vector2(x * 0.5f * w, dist));
                uv1.Add(new Vector2(a, f));
                uv2.Add(new Vector2(arrival[i], 0f));
            }
        }
        for (int i = 0; i < centre.Count - 1; i++)
        for (int j = 0; j < widthSegments; j++)
        {
            int v00 = i * cols + j, v10 = v00 + cols, v01 = v00 + 1, v11 = v10 + 1;
            tris.Add(v00); tris.Add(v10); tris.Add(v01);
            tris.Add(v01); tris.Add(v10); tris.Add(v11);
        }

        // --- Impact foam disc (seam at the back, hidden behind the falling sheet)
        if (impactFoamRadius > 0.001f)
        {
            int baseIndex = pos.Count;
            float R = impactFoamRadius;
            Vector3 c = ImpactPointLocal + new Vector3(0f, impactFoamLift, R * 0.15f);
            float distImpact = dist;
            float tArrive = inflowTime + tImpact;
            int segs = impactSegments + 1;
            for (int r = 0; r <= impactRings; r++)
            {
                float rn = (float)r / impactRings;
                float rad = rn * R;
                for (int s = 0; s < segs; s++)
                {
                    float ang = Mathf.Lerp(-Mathf.PI, Mathf.PI, (float)s / impactSegments);
                    Vector3 offset = new Vector3(Mathf.Sin(ang), 0f, Mathf.Cos(ang)) * rad;
                    pos.Add(c + offset);
                    uv0.Add(new Vector2(offset.x, distImpact + offset.z)); // same axes as the sheet: foam keeps flowing downstream
                    uv1.Add(new Vector2(0.5f + 0.5f * rn, Mathf.Lerp(1f, 0.35f, rn)));
                    uv2.Add(new Vector2(tArrive + offset.z / Mathf.Max(0.05f, impactSpreadSpeed), 1f));
                }
            }
            for (int r = 0; r < impactRings; r++)
            for (int s = 0; s < impactSegments; s++)
            {
                int v00 = baseIndex + r * segs + s, v10 = v00 + segs, v01 = v00 + 1, v11 = v10 + 1;
                tris.Add(v00); tris.Add(v10); tris.Add(v01);
                tris.Add(v01); tris.Add(v10); tris.Add(v11);
            }
        }

        mesh.Clear();
        mesh.SetVertices(pos);
        mesh.SetUVs(0, uv0);
        mesh.SetUVs(1, uv1);
        mesh.SetUVs(2, uv2);
        mesh.SetTriangles(tris, 0);
        mesh.RecalculateNormals();
        mesh.RecalculateTangents();
        mesh.RecalculateBounds();

        if (splash != null)
            splash.localPosition = ImpactPointLocal + Vector3.up * impactFoamLift;
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.matrix = transform.localToWorldMatrix;
        Gizmos.color = new Color(0.3f, 0.8f, 1f, 1f);
        Gizmos.DrawLine(new Vector3(-width * 0.5f, 0f, 0f), new Vector3(width * 0.5f, 0f, 0f));
        Vector3 impact = ImpactPointLocal;
        Gizmos.DrawWireSphere(impact, 0.03f);
        Gizmos.DrawLine(new Vector3(0f, 0f, -inflowLength), Vector3.zero);
    }
}
