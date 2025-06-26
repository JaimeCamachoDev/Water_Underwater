using UnityEngine;
using UnityEditor;

/// <summary>
/// Personaliza el Inspector de DiscoverVZ con una interfaz clara y profesional.
/// </summary>
[CustomEditor(typeof(DiscoverVZ))]
public class DiscoverVZEditor : Editor
{
    private bool isEditing = false;

    public override void OnInspectorGUI()
    {
        DiscoverVZ discover = (DiscoverVZ)target;

        // Botón de edición
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField(discover.category.ToString(), EditorStyles.miniLabel);
        GUILayout.FlexibleSpace();
        if (GUILayout.Button(isEditing ? "Save" : "Edit", GUILayout.Width(50)))
        {
            isEditing = !isEditing;
        }
        EditorGUILayout.EndHorizontal();

        if (isEditing)
        {
            // Modo Edición
            discover.discoverName = EditorGUILayout.TextField("Name", discover.discoverName);
            discover.category = (DiscoverVZ.DiscoverCategory)EditorGUILayout.EnumPopup("Category", discover.category);
            discover.image = (Texture2D)EditorGUILayout.ObjectField("Image", discover.image, typeof(Texture2D), false);
            discover.description = EditorGUILayout.TextArea(discover.description, GUILayout.Height(50));

            EditorGUILayout.Space();
            EditorGUILayout.LabelField("Sections", EditorStyles.boldLabel);
            for (int i = 0; i < discover.sections.Count; i++)
            {
                EditorGUILayout.BeginVertical("box");
                discover.sections[i].sectionName = EditorGUILayout.TextField("Section Name", discover.sections[i].sectionName);
                discover.sections[i].image = (Texture2D)EditorGUILayout.ObjectField("Image", discover.sections[i].image, typeof(Texture2D), false);
                discover.sections[i].sectionContent = EditorGUILayout.TextArea(discover.sections[i].sectionContent, GUILayout.Height(40));

                // Acciones dentro de la sección
                EditorGUILayout.LabelField("Actions", EditorStyles.boldLabel);
                for (int j = 0; j < discover.sections[i].actions.Count; j++)
                {
                    EditorGUILayout.BeginHorizontal();
                    discover.sections[i].actions[j].description = EditorGUILayout.TextField(discover.sections[i].actions[j].description);
                    discover.sections[i].actions[j].target = (GameObject)EditorGUILayout.ObjectField(discover.sections[i].actions[j].target, typeof(GameObject), true);
                    if (GUILayout.Button("-", GUILayout.Width(25)))
                    {
                        discover.sections[i].actions.RemoveAt(j);
                    }
                    EditorGUILayout.EndHorizontal();
                }
                if (GUILayout.Button("Add Action"))
                {
                    discover.sections[i].actions.Add(new DiscoverAction());
                }

                if (GUILayout.Button("Remove Section"))
                {
                    discover.sections.RemoveAt(i);
                }
                EditorGUILayout.EndVertical();
            }
            if (GUILayout.Button("Add Section"))
            {
                discover.sections.Add(new DiscoverSection());
            }

            if (GUI.changed)
            {
                EditorUtility.SetDirty(discover);
            }
        }
        else
        {
            // Modo Visor (solo lectura)
            EditorGUILayout.LabelField(discover.discoverName, new GUIStyle(EditorStyles.boldLabel) { fontSize = 16 });
            EditorGUILayout.LabelField(discover.description, EditorStyles.wordWrappedLabel);

            if (discover.image != null)
            {
                GUILayout.Label(discover.image, GUILayout.Height(100));
            }

            foreach (var section in discover.sections)
            {
                EditorGUILayout.BeginVertical("box");
                EditorGUILayout.LabelField(section.sectionName, EditorStyles.boldLabel);
                if (section.image != null)
                {
                    GUILayout.Label(section.image, GUILayout.Height(80));
                }
                EditorGUILayout.LabelField(section.sectionContent, EditorStyles.wordWrappedLabel);

                // Acciones dentro de la sección
                if (section.actions.Count > 0)
                {
                    EditorGUILayout.Space();
                    foreach (var action in section.actions)
                    {
                        EditorGUILayout.BeginHorizontal();
                        EditorGUILayout.LabelField(action.description, EditorStyles.label);
                        if (action.target != null && GUILayout.Button("Go To", GUILayout.Width(60)))
                        {
                            Selection.activeObject = action.target;
                            SceneView.lastActiveSceneView.FrameSelected();
                        }
                        EditorGUILayout.EndHorizontal();
                    }
                }

                EditorGUILayout.EndVertical();
            }
        }
    }
}
