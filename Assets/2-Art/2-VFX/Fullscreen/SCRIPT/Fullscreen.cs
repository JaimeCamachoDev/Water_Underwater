using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

[ExecuteInEditMode]
public class Fullscreen : MonoBehaviour
{
    public Material fullscreenMaterial;

    public float OffsetX;
    public float OffsetY;
    public float Tiling;
    public float Effect;
    void Update()
    {
        if (fullscreenMaterial != null)
        {
            
            fullscreenMaterial.SetFloat("_OffsetX", OffsetX);
            fullscreenMaterial.SetFloat("_OffsetY", OffsetY);
            fullscreenMaterial.SetFloat("_Tiling", Tiling);
            fullscreenMaterial.SetFloat("_Effect", Effect);
        }
    }
}