using UnityEngine;
using UnityEditor;
using System.IO;

public class FolderVZCreator : MonoBehaviour
{
    [MenuItem("Assets/Create/Folder VZ", false, 10)]
    private static void CreateFolderVZ()
    {
        string folderPath = GetSelectedPathOrFallback();

        // Crear la carpeta principal con un nombre genérico
        string mainFolderName = "New Folder VZ";
        string uniqueFolderPath = AssetDatabase.GenerateUniqueAssetPath(Path.Combine(folderPath, mainFolderName));
        AssetDatabase.CreateFolder(folderPath, Path.GetFileName(uniqueFolderPath));
        AssetDatabase.Refresh();

        // Seleccionar la carpeta recién creada y permitir cambiar el nombre
        Object newFolder = AssetDatabase.LoadAssetAtPath<Object>(uniqueFolderPath);
        Selection.activeObject = newFolder;

        // Crear subcarpetas después de un pequeño retraso para asegurar que la carpeta principal esté creada y seleccionada
        EditorApplication.delayCall += () =>
        {
            // Permitir renombrar la carpeta
            RenameSelectedAsset();
            CreateSubfolders(uniqueFolderPath);
        };
    }

    private static void RenameSelectedAsset()
    {
        // Unity no permite iniciar el renombrado directamente desde código,
        // pero se puede iniciar la edición del nombre usando un pequeño truco
        EditorApplication.delayCall += () =>
        {
            if (Selection.activeObject != null)
            {
                EditorGUIUtility.PingObject(Selection.activeObject);
                Selection.activeObject = null; // Necesario para reiniciar la selección y activar el renombrado
                Selection.activeObject = AssetDatabase.LoadAssetAtPath<Object>(AssetDatabase.GetAssetPath(Selection.activeObject));
            }
        };
    }

    private static void CreateSubfolders(string parentFolderPath)
    {
        AssetDatabase.CreateFolder(parentFolderPath, "MESH");
        AssetDatabase.CreateFolder(parentFolderPath, "MATERIAL");
        AssetDatabase.CreateFolder(parentFolderPath, "PREFAB");
        AssetDatabase.CreateFolder(parentFolderPath, "ANIMATION");
        AssetDatabase.CreateFolder(parentFolderPath, "SHADER");
        AssetDatabase.CreateFolder(parentFolderPath, "VFX");
        AssetDatabase.CreateFolder(parentFolderPath, "SCRIPT");
        AssetDatabase.Refresh();
    }

    private static string GetSelectedPathOrFallback()
    {
        string path = "Assets";

        foreach (Object obj in Selection.GetFiltered(typeof(Object), SelectionMode.Assets))
        {
            path = AssetDatabase.GetAssetPath(obj);
            if (!string.IsNullOrEmpty(path) && File.Exists(path))
            {
                path = Path.GetDirectoryName(path);
                break;
            }
        }
        return path;
    }
}
