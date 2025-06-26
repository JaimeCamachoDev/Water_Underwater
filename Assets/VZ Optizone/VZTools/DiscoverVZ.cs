using System.Collections.Generic;
using UnityEngine;

/// <summary>
/// DiscoverVZ: Sistema de documentación visual para la escena.
/// </summary>
[AddComponentMenu("VirtualZone/DiscoverVZ")]
[DisallowMultipleComponent]
public class DiscoverVZ : MonoBehaviour
{
    public enum DiscoverCategory
    {
        VisualEffects, Audio, Gameplay, UI, Environment, Other
    }

    public string discoverName = "Discover";
    public DiscoverCategory category = DiscoverCategory.Other;
    public Texture2D image;
    [TextArea] public string description = "Description of the component.";
    public List<DiscoverSection> sections = new List<DiscoverSection>();
}

/// <summary>
/// Sección dentro de DiscoverVZ, que puede contener acciones.
/// </summary>
[System.Serializable]
public class DiscoverSection
{
    public string sectionName = "Section Name";
    public Texture2D image;
    [TextArea] public string sectionContent = "Section Content";
    public List<DiscoverAction> actions = new List<DiscoverAction>();
}

/// <summary>
/// Acción dentro de una sección, que permite navegar a un objeto.
/// </summary>
[System.Serializable]
public class DiscoverAction
{
    public string description = "Action Name";
    public GameObject target;
}
