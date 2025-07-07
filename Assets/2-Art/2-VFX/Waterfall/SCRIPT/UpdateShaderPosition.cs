using UnityEngine;

public class UpdateShaderPosition : MonoBehaviour
{
    public Material material; // Material con el Shader Graph
    public Transform targetObject; // Objeto a rastrear
    public Transform materialObject; // Objeto que tiene el material aplicado
    public float movementFactor = 10f; // Factor de reducción del movimiento

    private int positionID;
    private float scalefactor;

    void Start()
    {
        // Busca el ID de la propiedad en el shader
        positionID = Shader.PropertyToID("_Position");

        movementFactor =  10 * (targetObject.transform.localScale.x / materialObject.transform.localScale.x);

    }

    void Update()
    {
        if (material != null && targetObject != null && materialObject != null)
        {
            // Obtener la posición local del objeto target en relación con materialObject
            Vector3 localPos = materialObject.InverseTransformPoint(targetObject.position);

            // Obtener la escala del objeto con el material
            Vector3 objectScale = materialObject.lossyScale;

            // Ajustar la posición dividiendo por la escala y reduciendo la velocidad con movementFactor
            float adjustedX = (localPos.x / objectScale.x) / movementFactor;
            float adjustedY = (localPos.z / objectScale.z) / movementFactor; // Usamos Z en lugar de Y para UV.Y

            // Definir los límites de la conversión (ajústalos si es necesario)
            float uvMinX = 0.5f;  // Límite izquierdo en coordenadas locales
            float uvMaxX = -0.5f; // Límite derecho en coordenadas locales
            float uvMinY = 0.5f;  // Límite inferior en coordenadas locales
            float uvMaxY = -0.5f; // Límite superior en coordenadas locales

            // Convertir las coordenadas locales a UV correctamente
            float uvX = Mathf.InverseLerp(uvMinX, uvMaxX, adjustedX);
            float uvY = Mathf.InverseLerp(uvMinY, uvMaxY, adjustedY);

            // Pasar la posición UV al shader
            material.SetVector(positionID, new Vector2(uvX, uvY));
        }
    }
}
