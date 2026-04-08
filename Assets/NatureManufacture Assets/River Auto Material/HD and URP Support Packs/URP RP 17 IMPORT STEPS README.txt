BEFORE YOU START:
- you need Unity 6
- you need URP SRP pipline 17 if you use higher please import 17 support pack.
- wind setup is in wind prefab at each scene

Deferred at PC Renderer setting at initial unity 6 version we notice water doesnt show up at deferred and screen space ambient occlusion turned on at the same time. 
Looks like near/far clip planes are bugged at that engine version and it send wrong depth data. It's engine bug so just be patient until they fix it.

 !! To turn on distortion and proper render at water find please turn on:
Find File "PC_RPAsset" 
	- Turn on "Opaque Texture" this will fix water translucency and distortion if its turned off
	- Turn on "Depth Texture" this will fix water visibility at playmode if its turned off
	- Turn on HDR if its turned off
