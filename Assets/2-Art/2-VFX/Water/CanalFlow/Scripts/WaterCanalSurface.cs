using UnityEngine;

/// Per-renderer settings for the "SevenWonders/Water/Canal Flow" shader: flow direction of this plane
/// and the 0..1 fill that reveals the water along the flow. Hooks itself to a sibling
/// Interactable_WaterSegmentView so the advancing front follows the puzzle fill.
[ExecuteAlways]
[DisallowMultipleComponent]
[RequireComponent(typeof(Renderer))]
public class WaterCanalSurface : MonoBehaviour
{
    static readonly int FlowDirId = Shader.PropertyToID("_FlowDirOS");
    static readonly int FillId = Shader.PropertyToID("_Fill");

    [Tooltip("Flow direction in this object's local space (Unity Plane: X or Z axis).")]
    public Vector3 flowDirectionLocal = new Vector3(-1f, 0f, 0f);
    [Range(0f, 1f)] public float fill = 1f;
    [Tooltip("Follow the fill of an Interactable_WaterSegmentView on this GameObject.")]
    public bool followSegmentView = true;

    Renderer rend;
    MaterialPropertyBlock mpb;
    Interactable_WaterSegmentView view;

    void OnEnable()
    {
        rend = GetComponent<Renderer>();
        view = followSegmentView ? GetComponent<Interactable_WaterSegmentView>() : null;
        if (view != null && Application.isPlaying)
        {
            view.OnFillChanged.AddListener(SetFill);
            fill = view.Fill;
        }
        Apply();
    }

    void OnDisable()
    {
        if (view != null && Application.isPlaying)
            view.OnFillChanged.RemoveListener(SetFill);
    }

    void OnValidate() => Apply();

    public void SetFill(float value)
    {
        fill = Mathf.Clamp01(value);
        Apply();
    }

    void Apply()
    {
        if (rend == null) rend = GetComponent<Renderer>();
        if (rend == null) return;
        mpb ??= new MaterialPropertyBlock();
        rend.GetPropertyBlock(mpb);
        mpb.SetVector(FlowDirId, flowDirectionLocal.normalized);
        mpb.SetFloat(FillId, fill);
        rend.SetPropertyBlock(mpb);
    }
}
