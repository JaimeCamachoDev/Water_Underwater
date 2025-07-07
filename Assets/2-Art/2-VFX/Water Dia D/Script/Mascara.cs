/*
	SetRenderQueue.cs
 
	Establece el RenderQueue de los materiales de un objeto en Awake. Esto ser� una instancia
	los materiales, por lo que el script no interferir� con otros renderizadores que
	hacen referencia a los mismos materiales.
*/

using UnityEngine;

[AddComponentMenu("Rendering/SetRenderQueue")]

public class Mascara : MonoBehaviour
{

	[SerializeField]
	protected int[] m_queues = new int[] { 3000 };

	protected void Awake()
	{
		Material[] materials = GetComponent<Renderer>().materials;
		for (int i = 0; i < materials.Length && i < m_queues.Length; ++i)
		{
			materials[i].renderQueue = m_queues[i];
		}
	}
}