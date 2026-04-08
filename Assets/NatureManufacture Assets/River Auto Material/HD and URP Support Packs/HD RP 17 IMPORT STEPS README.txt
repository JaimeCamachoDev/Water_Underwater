BEFORE YOU START:
- you need Unity 6 or higher 
- you need HD SRP pipeline 17 if you use higher etc custom shaders could not work but seems they should. 
That's why we provide 17 version which seems to work with much higher versions aswell. 
For all higher RP versions please use 17 HD RP support pack.

Step 1
	- !!!! IMPORTANT !!!! Open "Project settings" ->"Gaphics"-> "Pipline Specific Settings" ->  "Diffusion Profile List"
	and drag and drop our SSS settings diffusion profiles for foliage and water into Diffusion profile list:
		  NM_SSSSettings_Water_RAM
	Without this foliage, water materials will not become affected by scattering and they will look wrong.

It's because we use translucency on water.  You could also do it by "fix" button at material

Make note that tesselation shaders doesn't support rtx at unity hd rp yet

If you notice in console error:
No more space in Reflection Probe Atlas. To solve this issue, increase the size of the Reflection Probe Atlas in the HDRP settings.
UnityEngine.GUIUtility:ProcessEvent (int,intptr,bool&)
Just change reflection atlas size at hd rp settings into 4kx8k. 