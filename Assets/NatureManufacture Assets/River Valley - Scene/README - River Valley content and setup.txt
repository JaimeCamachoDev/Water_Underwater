
To run this scene/level you need our assets inside project:
- river auto material 2019 
- mountain environment - dynamic nature 

To run HD or URP versions please visit HD and URP Support Packs folder and import proper hd or urp support pack for your engine version.
Make note that mountain environment and river auto material 2019 should be in hd or urp versions before that operation.
Details you could find in their hd and urp support pack folders.

After you import this pack please:
- import unity post processing 2 if you want to use unity post process. It's in unity package manager. Window -> Package Manager -> Post Processing
- change quality level to ultra
- change color space at player settings to linear as we setup pack to linear rendering
- change render type at graphics settings to deferred. We use many reflection probes at scene and at forward they could be heavy. Ofc you can switch them off and use forward rendering aswell.
- if fps is avarage you could reduce LOD BIAS to 1.5 or 1 in most cases it will help alot for lower end devices.

