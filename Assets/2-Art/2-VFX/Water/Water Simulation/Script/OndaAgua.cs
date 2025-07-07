using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class OndaAgua : MonoBehaviour
{
    public Renderer Rend;
    public GameObject RefGO;
    public bool Activar;

    public float RadioEfectoInicial = 5;
    public float RadioEfectoFinal = 15;
    public float RadioEfectoActual;

    public float DensidadInicial = 0.7f;
    public float DensidadFinal = 0;
    public float DensidadActual;

    public float AmplitudInicial = 5;
    public float AmplitudFinal = 0;
    public float AmplitudActual;


    public float TiempoDuracion = 5;
    public float Tiempo = 0;
   

    private void FixedUpdate()
    {

        Rend.sharedMaterial.SetVector("_Punto_De_origen", -RefGO.transform.position/2);
        Rend.sharedMaterial.SetVector("_Punto_De_origen_1", -RefGO.transform.position);


        if (Activar == true && Tiempo < TiempoDuracion)
        {

            if (Activar == true && Tiempo == 0) //inicializa  los valores 
            {

                Rend.sharedMaterial.SetFloat("_Radio_De_Efecto", RadioEfectoInicial);

                Rend.sharedMaterial.SetFloat("_Densidad", DensidadInicial);

                Rend.sharedMaterial.SetFloat("_Amplitud", AmplitudInicial);
            }


            //interpola los parametros con un valor de 0 a 1

            RadioEfectoActual = Mathf.Lerp(RadioEfectoInicial, RadioEfectoFinal, Tiempo / TiempoDuracion);

            Rend.sharedMaterial.SetFloat("_Radio_De_Efecto", RadioEfectoActual);

            DensidadActual = Mathf.Lerp(DensidadInicial, DensidadFinal, Tiempo / TiempoDuracion);

            Rend.sharedMaterial.SetFloat("_Densidad", DensidadActual);

            AmplitudActual = Mathf.Lerp(AmplitudInicial, AmplitudFinal, Tiempo / TiempoDuracion);

            Rend.sharedMaterial.SetFloat("_Amplitud", AmplitudActual);

            Tiempo += Time.deltaTime;


            if (Tiempo >= TiempoDuracion)
            {

                Activar = false;
                Tiempo = 0;
            }

        }





    }
}
