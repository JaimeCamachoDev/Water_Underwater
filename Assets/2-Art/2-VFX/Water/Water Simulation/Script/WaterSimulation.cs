using UnityEngine;

public class WaterSimulation : MonoBehaviour
{
    public GameObject GO;
    public float Tamaño_Punto;

    [SerializeField]
    CustomRenderTexture texture;

    [SerializeField]
    //int iterationPerFrame = 1;

    public float T = 0f;
    public float T_Ciclo = 0.1f;

    void Start()
    {
        texture.Initialize();
    }


    void Update()
    {
        T += Time.deltaTime;
        if (T >= T_Ciclo)
        {
            T = T % T_Ciclo;
            Ciclo();
        }
    }

    void Ciclo()
    {
        texture.ClearUpdateZones();
        UpdateZones();
        texture.Update(1);
    }

    void UpdateZones()
    {
        if (!GO) return;
        //bool leftClick = Input.GetMouseButton(0);
        //bool rightClick = Input.GetMouseButton(1);
        //if (!leftClick && !rightClick) return;

        RaycastHit hit;
        if (Physics.Raycast(GO.transform.position, GO.transform.TransformDirection(-Vector3.up), out hit, 5))
        {
            if (!hit.collider.CompareTag("Arena"))
            {
                Debug.DrawRay(GO.transform.position, GO.transform.TransformDirection(-Vector3.up) * hit.distance, Color.yellow);

                var defaultZone = new CustomRenderTextureUpdateZone();
                defaultZone.needSwap = true;
                defaultZone.passIndex = 0;
                defaultZone.rotation = 0f;
                defaultZone.updateZoneCenter = new Vector2(0.5f, 0.5f);
                defaultZone.updateZoneSize = new Vector2(1f, 1f);

                var clickZone = new CustomRenderTextureUpdateZone();
                clickZone.needSwap = true;
                clickZone.passIndex = 2;
                clickZone.rotation = 0f;
                clickZone.updateZoneCenter = new Vector2(hit.textureCoord.x, 1f - hit.textureCoord.y);
                clickZone.updateZoneSize = new Vector2(Tamaño_Punto, Tamaño_Punto);

                texture.SetUpdateZones(new CustomRenderTextureUpdateZone[] { defaultZone, clickZone });
            }
        }
    }
}