-------------------------------------------------------------

#  BASIC IRRLICHT COMMAND REFERENCE
   Created 2026-09-04 15:02:15 
   Command Count: 556

-------------------------------------------------------------

# function iGetVersion() as CONST zstring ptr

    DEFINITION:	Wrapper Version.
	ARGUMENTS:	None.	
	RETURNS:	Version of the BasicIrrlicht.dll Wrapper. 

# function iGraphics(byval X as integer, byval Y as integer, byval Bits as integer, byval Fullscreen as boolean ) as Boolean

    DEFINITION:	Sets the 2D graphics mode. * NOT YET IMPLEMENTED!
	ARGUMENTS:	X and Y of screen size, color depth and TRUE or FALSE for fullscreen.	
	RETURNS:	TRUE or FALSE. 

# function iGraphics3D(byval X as integer, byval Y as integer, byval Bits as integer, byval Fullscreen as boolean, byval Resizable as boolean=FALSE ) as Boolean

    DEFINITION:	Sets the 3D graphics mode.
	ARGUMENTS:	X and Y of screen size, color depth, TRUE or FALSE for fullscreen and resizeable window.	
	RETURNS:	TRUE or FALSE. 

# function iRun() as integer

    DEFINITION:	Is the engine running.
				*REQUIRED AT THE BEGINNING OF YOUR MAIN LOOP!
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# sub iUpdateScene(byval clearBackBuffer as Boolean=TRUE,byval clearZBuffer as Boolean=TRUE)

    DEFINITION:	Updates sound engine listener, set cls color and buffer settings etc.
	ARGUMENTS:	Clear backbuffer and\or zbuffer.	
	RETURNS:	None. 

# sub iRenderScene()

    DEFINITION:	Updates movement\animation all scene entities and renders the scene to the back buffer.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# sub iRenderGUI()

    DEFINITION:	Renders all gui elements to the back buffer.
	ARGUMENTS:	None.	
	RETURNS:	None. 

# function iFlip() as Boolean

    DEFINITION:	Ends the scene and flips the back buffer.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# sub iUpdateEventReceiver()

    DEFINITION:	Force update event receiver.
	ARGUMENTS:	None.	
	RETURNS:	None. 

# sub iEndGraphics()

    DEFINITION:	Closes the graphics mode.
	ARGUMENTS:	None.	
	RETURNS:	None. 

# sub iVSync(byval apply as Boolean)

    DEFINITION:	Enables or disables vertical sync.
				*MUST BE USED BEFORE iGraphics3D OR WILL HAVE NO EFFECT!
	ARGUMENTS:	TRUE or FALSE.	
	RETURNS:	None. 

# sub iAntialias(byval level as UInteger)

    DEFINITION:	Sets Fullscreen Antialias level.
				*MUST BE USED BEFORE iGraphics3D OR WILL HAVE NO EFFECT!
	ARGUMENTS:	0 and 1 is disabled. If value is too high, smaller values will be tried automatically.	
	RETURNS:	None. 

# sub iFrameLimit(byval limit as uinteger)

    DEFINITION:	Set maximum engine FPS.
	ARGUMENTS:	Framelimit.	
	RETURNS:	None. 

# function iFPS() as integer

    DEFINITION:	Internal Irrlicht FPS counter.
	ARGUMENTS:	None.	
	RETURNS:	Engine FPS. 

# function iTrisRendered() as Integer

    DEFINITION:	Total primitives drawn during last iRenderScene().
	ARGUMENTS:	None.	
	RETURNS:	Count of primitives drawn. 

# sub iAppTitle( byval text as wstring ptr )

    DEFINITION:	Window title.
	ARGUMENTS:	Text to display.	
	RETURNS:	None. 

# function iMilliSecs() as Integer

    DEFINITION:	Internal Irrlicht timer.
	ARGUMENTS:	None.	
	RETURNS:	Milliseconds in time passed. 

# function iRunTime() as integer

    DEFINITION:	Internal Irrlicht runtime timer.
	ARGUMENTS:	None.	
	RETURNS:	Engine run time in Milliseconds. 

# sub iClearScene()

    DEFINITION:	Clears the scene of all entities and textures.
	ARGUMENTS:	None.	
	RETURNS:	None. 

# function iLoadScene(ByVal filename As zstring ptr) as Boolean

    DEFINITION:	Loads a saved Irrlicht scene file(.irr).
	ARGUMENTS:	Filename to load.	
	RETURNS:	TRUE or FALSE. 

# function iSaveScene(ByVal filename As zstring ptr) as Boolean

    DEFINITION:	Saves the current scene to an Irrlicht scene file(.irr).
	ARGUMENTS:	Filename to save.	
	RETURNS:	TRUE or FALSE. 

# sub iTransparentZWrite(byval enable as Boolean)

    DEFINITION:	Enable or Disable TransparentZWrite.
	ARGUMENTS:	TRUE or FALSE.	
	RETURNS:	None. 

# function iAddArchive( byval filename as Zstring ptr, byval ignore_case as boolean, byval ignore_paths as boolean, byval password as Zstring ptr) as iARCHIVE

    DEFINITION:	Add a compressed media archive file.
	ARGUMENTS:	Filename, case, ignore paths and password if exists.	
	RETURNS:	iARCHIVE pointer to archive if it exists. 

# sub iFreeArchive(byval archive as iARCHIVE)

    DEFINITION:	Releases the archive file.
	ARGUMENTS:	iARCHIVE file pointer.	
	RETURNS:	None. 

# sub iScreenShot(byval folder as Zstring ptr=@".")

    DEFINITION:	Saves a screenshot in the specified folder or current if none specified, with date and time.
	ARGUMENTS:	None.	
	RETURNS:	None. 

# sub iEngineSleep(byval Time_MS as UInteger)

    DEFINITION:	Force the Irrlicht Engine to sleep.
	ARGUMENTS:	Time to sleep in milliseconds.	
	RETURNS:	None. 

# function iSupportStencilBuffer() as Boolean

    DEFINITION:	Does the graphics card support Stencil Buffer.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# function iSupportMultiTexture() as Boolean

    DEFINITION:	Does the graphics card support Multi Texture.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# function iSupportHardwareTL() as Boolean

    DEFINITION:	Does the graphics card support Hardware TL.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# function iSupportGLSL() as Boolean

    DEFINITION:	Does the graphics card support GLSL.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# function iSupportARB() as Boolean

    DEFINITION:	Does the graphics card support ARB.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# function iProcessorSpeed() as uinteger

    DEFINITION:	Processor Speed in Mhz.
	ARGUMENTS:	None.	
	RETURNS:	Current processor speed. 

# function iTotalMemory() as uinteger

    DEFINITION:	System Memory.
	ARGUMENTS:	None.	
	RETURNS:	Total System Memory. 

# function iAvailableMemory() as uinteger

    DEFINITION:	System Memory.
	ARGUMENTS:	None.	
	RETURNS:	Available System Memory. 

# function iVideoModeCount() as integer

    DEFINITION:	Supported video modes.
	ARGUMENTS:	None.	
	RETURNS:	Count of supported video modes. 

# function iVideoModeDepth( byval ModeNumber as integer ) as integer

    DEFINITION:	Supported video mode depth.
	ARGUMENTS:	None.	
	RETURNS:	Supported video mode depth. 

# function iVideoModeResolutionWidth( byval ModeNumber as integer ) as integer

    DEFINITION:	Supported video mode resolution width.
	ARGUMENTS:	None.	
	RETURNS:	Supported video mode resolution width. 

# function iVideoModeResolutionHeight( byval ModeNumber as integer ) as integer

    DEFINITION:	Supported video mode resolution height.
	ARGUMENTS:	None.	
	RETURNS:	Supported video mode resolution height. 

# sub iSetLogLevel( byval level as ELOG_LEVEL = ELL_ERROR )

    DEFINITION:	Set logging level to console.
	ARGUMENTS:	Level = ELL_DEBUG, ELL_INFORMATION, ELL_WARNING, ELL_ERROR or ELL_NONE.	
	RETURNS:	None. 

# function iFullscreen() as boolean

    DEFINITION:	Check if set to Fullscreen.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# function iWindowActive() as boolean

    DEFINITION:	Check if window is active.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# function iWindowFocused() as boolean

    DEFINITION:	Check if window has focus.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# function iWindowMinimized() as boolean

    DEFINITION:	Check if window is minimized.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# sub iEntityDebug(byval entity as iENTITY, byval visible as uinteger = EDS_OFF)

    DEFINITION:	Enable debug view for specified entity.
	ARGUMENTS:	EDS_OFF, EDS_BBOX, EDS_NORMALS, EDS_SKELETON, EDS_MESH_WIRE_OVERLAY, EDS_HALF_TRANSPARENCY, EDS_BBOX_BUFFERS or EDS_FULL.	
	RETURNS:	TRUE or FALSE. 

# sub iDopplerEffect(byval doppler as Single=1.0,byval distance as Single=1.0)

    DEFINITION:	Set the doppler effect of the listener.
	ARGUMENTS:	doppler value and distance.	
	RETURNS:	None. 

# function iEmitSound(byval sound as iSOUND_SOURCE,byval parent as iENTITY=0,byval looped as boolean=false) as iSOUND

    DEFINITION:	Emits a the specified 3D sound from the specified entity.
	ARGUMENTS:	iSOUND_SOURCE, entity and wheather to play looped.	
	RETURNS:	iSOUND pointer. 

# function iLoadSound(byval file as ZString ptr) as iSOUND_SOURCE

    DEFINITION:	Loads a sound file.
	ARGUMENTS:	Filename of sound file.	
	RETURNS:	iSOUND_SOURCE pointer. 

# sub iFreeSound(byval sound as iSOUND_SOURCE)

    DEFINITION:	Releases a loaded sound.
	ARGUMENTS:	iSOUND pointer to free.	
	RETURNS:	None. 

# sub iSoundLoop(byval sound as iSOUND)

    DEFINITION:	Set the specified sound to play looped.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	None. 

# function iPlaySound(byval soundsource as iSOUND_SOURCE) as iSOUND

    DEFINITION:	Plays the specified sound in 2D.
	ARGUMENTS:	iSOUND_SOURCE pointer.	
	RETURNS:	iSOUND pointer. 

# function iPlayMusic(byval file as ZString ptr) as iSOUND

    DEFINITION:	Plays the specified sound file from stream in 2D.
	ARGUMENTS:	Filename of sound to play.	
	RETURNS:	iSOUND pointer. 

# sub iStopSound(byval sound as iSOUND)

    DEFINITION:	Stops the specified sound playing.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	None. 

# sub iPauseSound(byval sound as iSOUND)

    DEFINITION:	Pauses the specified sound playing.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	None. 

# sub iResumeSound(byval sound as iSOUND)

    DEFINITION:	Resumes the specified sound playing.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	None. 

# sub iSoundPitch(byval sound as iSOUND,byval pitch as Single)

    DEFINITION:	Change the pitch of the specified sound.
	ARGUMENTS:	iSOUND pointer and pitch vaule.	
	RETURNS:	None. 

# sub iSoundVolume(byval sound as iSOUND,byval volume as Single)

    DEFINITION:	Change the volume of the specified sound playing.
	ARGUMENTS:	iSOUND pointer and volume vaule.	
	RETURNS:	None. 

# sub iSoundPan(byval sound as iSOUND,byval pan as Single)

    DEFINITION:	Set the panning of the specified sound playing.
	ARGUMENTS:	iSOUND pointer and pan vaule.	
	RETURNS:	None. 

# function iSoundPlaying(byval sound as iSOUND) as Boolean

    DEFINITION:	Checks to see if the specified sound is currently playing.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	TRUE or FALSE. 

# sub iMasterVolume(byval volume as Single)

    DEFINITION:	Sets the master volume for all sounds.
	ARGUMENTS:	Volume 0.0 mute to 1.0 max.	
	RETURNS:	None. 

# sub iPauseAllSounds(byval pause as Boolean)

    DEFINITION:	Pauses all playing sounds.
	ARGUMENTS:	TRUE or FALSE.	
	RETURNS:	None. 

# sub iStopAllSounds()

    DEFINITION:	Stops all playing sounds.
	ARGUMENTS:	None.	
	RETURNS:	None. 

# sub iFreeAllSounds()

    DEFINITION:	Releases all loaded sounds.
	ARGUMENTS:	None.	
	RETURNS:	None. 

# function iSoundLength(byval sound as iSOUND) as UInteger

    DEFINITION:	Gets the length of the specified sound.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	Length of the sound. 

# function iGetPlayPosition(byval sound as iSOUND) as UInteger

    DEFINITION:	Gets the current play position of the specified sound.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	Play position of the sound. 

# sub iSetPlayPosition(byval sound as iSOUND,byval position as UInteger)

    DEFINITION:	Sets the current play position of the specified sound.
	ARGUMENTS:	iSOUND pointer and position.	
	RETURNS:	None. 

# sub iSetSoundDistance(byval sound as iSOUND,byval distance as Single)

    DEFINITION:	Sets the minimum hear distance of the specified 3D sound.
	ARGUMENTS:	iSOUND pointer and distance.	
	RETURNS:	None. 

# sub iPositionSound(byval sound as iSOUND,byval x as Single,byval y as Single,byval z as Single)

    DEFINITION:	Sets the 3D position of the specified 3D sound.
	ARGUMENTS:	iSOUND pointer,x ,y and z in world coordinates.	
	RETURNS:	None. 

# function iSoundSourceCount() as UInteger

    DEFINITION:	Count of all sound sources.
	ARGUMENTS:	None.	
	RETURNS:	Sound source count. 

# function iCreateCamera(byval parent as iENTITY=0, byval bind as boolean=true) as iCAMERA

    DEFINITION:	Adds a Camera to the scene.
	ARGUMENTS:	Parent and TRUE or FALSE to bind Camera target and rotation.	
	RETURNS:	iCAMERA pointer. 

# function iCreateIsometricCamera(byval vWidth as single, byval vHeight as single,byval vNear as single, byval vFar as single,byval parent as iENTITY=0) as iCAMERA

    DEFINITION:	Adds an Isometric Camera to the scene.
	ARGUMENTS:	Width, height, near, far and Parent.	
	RETURNS:	iCAMERA pointer. 

# function iCreateFPSCamera(byval rot_s as single = 100.0,byval mov_s as single = 0.5,byval parent as iENTITY=0, byval recv as Boolean = true) as iCAMERA

    DEFINITION:	Adds an FPS Camera to the scene.
	ARGUMENTS:	Rotation speed, move speed, parent and wheather to process events for this camera.	
	RETURNS:	iCAMERA pointer. 

# sub iCameraInput(byval camera as iCAMERA, byval enable as boolean = true)

    DEFINITION:	Enables\disables specified camera input events (Such as FPS camera).
	ARGUMENTS:	Camera and True or false.	
	RETURNS:	None. 

# function iCamInputEnabled(byval camera as iCAMERA) as boolean

    DEFINITION:	Checks if specified camera's input is enabled or disabled.
	ARGUMENTS:	Camera.	
	RETURNS:	True if currently enabled. 

# function iCreateMayaCamera(byval rots as single,byval zoos as single,byval tras as single,byval parent as iENTITY = 0) as iCAMERA

    DEFINITION:	Adds an Maya Camera to the scene.
	ARGUMENTS:	Rotation speed, zoom speed, translation speed and parent.	
	RETURNS:	iCAMERA pointer. 

# sub iCameraViewPort(byval x as UInteger,byval y as UInteger,byval w as UInteger,byval h as UInteger )

    DEFINITION:	Sets active camera viewport size.
	ARGUMENTS:	Rectangle defining new area of rendering.	
	RETURNS:	None. 

# sub iCLSColor(byval r as UInteger,byval g as UInteger,byval b as UInteger,byval a as UInteger=255 )

    DEFINITION:	Sets the clear screen color.
	ARGUMENTS:	Red, green, blue color and alpha.	
	RETURNS:	None. 

# sub iFogType(byval fogtype as EFT_FOG_TYPE)

    DEFINITION:	Sets the global fog type.
	ARGUMENTS:	EFT_FOG_EXP2, EFT_FOG_LINEAR or EFT_FOG_EXP.	
	RETURNS:	None. 

# sub iFogColor(byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the global fog color.
	ARGUMENTS:	Red, green and blue color.	
	RETURNS:	None. 

# sub iFogRange(byval fstart as Single=50.0,byval fend as Single=100.0)

    DEFINITION:	Sets the global fog range.
				*ONLY USED WITH EFT_FOG_LINEAR
	ARGUMENTS:	Fog start and end distance from camera.	
	RETURNS:	None. 

# sub iPixelFog(byval pfog as Boolean)

    DEFINITION:	Enable or disable pixel fog.
	ARGUMENTS:	False for vertex fog (default) or true for per-pixel fog.	
	RETURNS:	None. 

# sub iEnableRangeFog(byval rfog as Boolean)

    DEFINITION:	Sets fog range.
	ARGUMENTS:	True to enable range-based vertex fog - slower and may not work on all drivers.	
	RETURNS:	None. 

# sub iFogDensity(byval density as single=0.01)

    DEFINITION:	Sets fog density.
	ARGUMENTS:	Only used in exponential fog mode(linearFog=false). Must be a value between 0.0 and 1.0.	
	RETURNS:	None. 

# sub iCameraRange(byval camera as iCAMERA,byval znear as Single=1.0,byval zfar as Single=2000.0)

    DEFINITION:	Sets camera view distance.
	ARGUMENTS:	Near and far values.	
	RETURNS:	None. 

# sub iSetActiveCamera(byval camera as iCAMERA)

    DEFINITION:	Sets specified camera active.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	None. 

# sub iSetCameraFOV(byval camera as iCAMERA,byval fov as Single)

    DEFINITION:	Sets camera field of view. *DEFAULT: PI / 2.5
	ARGUMENTS:	Fov value.	
	RETURNS:	None. 

# function iGetCameraFOV(byval camera as iCAMERA) as Single

    DEFINITION:	Gets camera field of view.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	Fov value. 

# sub iSetCameraAspectRatio(byval camera as iCAMERA,byval aspectRatio as Single)

    DEFINITION:	Sets camera aspect ratio. *DEFAULT: 4.0 / 3.0
	ARGUMENTS:	iCAMERA and aspect ratio value.	
	RETURNS:	None. 

# sub iCameraTarget(byval camera as iCAMERA,byval x as single,byval y as Single,byval z as Single)

    DEFINITION:	Sets the specified camera's view target.
	ARGUMENTS:	iCAMERA and x, y and z of vector.	
	RETURNS:	None. 

# function iCamTargetX(byval camera as iCAMERA) as single

    DEFINITION:	Gets the specified camera's current target x value.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	Target x value. 

# function iCamTargetY(byval camera as iCAMERA) as single

    DEFINITION:	Gets the specified camera's current target y value.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	Target y value. 

# function iCamTargetZ(byval camera as iCAMERA) as single

    DEFINITION:	Gets the specified camera's current target z value.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	Target z value. 

# sub iFadeIn( byval ms as uinteger)

    DEFINITION:	Fades in from screen fader color, default is black.
				*iRenderGUI() must be called before iFlip() for this effect to be seen!
	ARGUMENTS:	Time in milliseconds.	
	RETURNS:	None. 

# sub iFadeOut(byval ms as uinteger)

    DEFINITION:	Fades out from screen fader color, default is black.
				*iRenderGUI() must be called before iFlip() for this effect to be seen!
	ARGUMENTS:	Time in milliseconds.	
	RETURNS:	None. 

# sub iFadeColor(byval r as uinteger,byval g as uinteger,byval b as uinteger,byval a as uinteger=0)

    DEFINITION:	Sets the screen fader color, default is black.
	ARGUMENTS:	Red, green and blue color.	
	RETURNS:	None. 

# function iFadeReady() as Boolean

    DEFINITION:	Checks if the screen fader is ready.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. 

# sub iSetLoopAnimation(byval entity as iENTITY,byval looped as boolean)

    DEFINITION:	Sets wheather to loop specified iENTITY animations.
	ARGUMENTS:	iENTITY and TRUE or FALSE.	
	RETURNS:	None. 

# function iAnimationLooped(byval entity as iENTITY) as Boolean

    DEFINITION:	Gets wheather the specified iENTITY animations are looped or not.
	ARGUMENTS:	iENTITY.	
	RETURNS:	TRUE or FALSE. 

# sub iSetAnimationSpeed(byval entity as iENTITY,byval speed as Single)

    DEFINITION:	Sets the animation speed for the specified iENTITY.
	ARGUMENTS:	iENTITY and speed value.	
	RETURNS:	None. 

# sub iSetAnimationFrame(byval entity as iENTITY,byval frame as Single)

    DEFINITION:	Sets the animation frame for the specified iENTITY.
	ARGUMENTS:	iENTITY and frame value.	
	RETURNS:	None. 

# function iAnimationStartFrame(byval entity as iENTITY) as integer

    DEFINITION:	Gets the start frame of the specified iENTITY animation.
	ARGUMENTS:	iENTITY.	
	RETURNS:	Start Frame. 

# function iAnimationEndFrame(byval entity as iENTITY) as integer

    DEFINITION:	Gets the end frame of the specified iENTITY animation.
	ARGUMENTS:	iENTITY.	
	RETURNS:	End Frame. 

# function iAnimationFrameCount(byval entity as iENTITY) as uinteger

    DEFINITION:	Gets the frame count of the specified iENTITY animation.
	ARGUMENTS:	iENTITY.	*NEEDS TESTED MAY CRASH!
	RETURNS:	Frame Count. 

# sub iSetAnimationTransitionTime(byval entity as iENTITY,byval ftime as single)

    DEFINITION:	Sets the animation transition time for the specified iENTITY.
	ARGUMENTS:	iENTITY and transition value.	
	RETURNS:	None. 

# sub iAnimate(byval entity as iENTITY,byval looped as Boolean,byval speed as Single,byval sframe as integer,byval eframe as Integer,byval ftime as Single)

    DEFINITION:	Animate the specified iENTITY.
	ARGUMENTS:	iENTITY, looped, speed, start frame, end frame and transition time.	
	RETURNS:	None. 

# sub iAnimateJoint(byval joint as iENTITY)

    DEFINITION:	Animate the specified joint.
	ARGUMENTS:	iENTITY.	
	RETURNS:	None. 

# sub iSetJointMode(byval joint as iENTITY,byval mode as JOINT_MODE)

    DEFINITION:	Sets the specified joints mode.
	ARGUMENTS:	Joint and mode.	(JOINT_MODE_NONE, JOINT_MODE_READ or JOINT_MODE_CONTROL).
	RETURNS:	None. 

# function iDeletionAnimator(byval entity as iENTITY,byval ms_delay as uInteger) as iANIMATOR

    DEFINITION:	Attaches a deletion animator to the specified entity.
	ARGUMENTS:	Entity and delay in milliseconds.
	RETURNS:	iANIMATOR pointer. 

# function iFlyCircleAnimator(byval entity as iEntity,byval x as single,byval y as single,byval z as single,byval radius as single,byval speed as single) as iAnimator

    DEFINITION:	Attaches a fly circle animator to the specified entity.
	ARGUMENTS:	Entity, the center, radius and speed.
	RETURNS:	iANIMATOR pointer. 

# function iFlyStraightAnimator(byval entity as iEntity,byval sx as single,byval sy as single,byval sz as single,byval ex as single,byval ey as single,byval ez as single,byval uitime as UInteger,byval looped as Boolean) as iAnimator

    DEFINITION:	Attaches a fly straight animator to the specified entity.
	ARGUMENTS:	Entity, start position, end position, time to perform and loop.
	RETURNS:	iANIMATOR pointer. 

# function iRotationAnimator(byval entity as iEntity,byval p as single,byval y as single,byval r as Single) as iAnimator

    DEFINITION:	Attaches a rotation animator to the specified entity.
	ARGUMENTS:	Entity, pitch, yaw and roll.
	RETURNS:	iANIMATOR pointer. 

# function iFollowSplineAnimator(byval entity as iEntity,byval iPoints as Integer,byref x as single,byref y as single,byref z as single,byval ttime as Integer,byval speed as Single=1.0,byval tightness as Single=0.5,byval looped as boolean=TRUE,byval pingpong as boolean=FALSE,byval steer as boolean=FALSE) as iAnimator

    DEFINITION:	Attaches a spline animator to the specified entity.
	ARGUMENTS:	Entity, number of points, time and speed.
	RETURNS:	iANIMATOR pointer. 

# function iFadeAnimator(byval entity as iEntity,byval ms_delay as Integer,byval scale as single) as iAnimator

    DEFINITION:	Attaches a fade animator to the specified entity.
	ARGUMENTS:	Entity, time and scale.
	RETURNS:	iANIMATOR pointer. 

# sub iFreeAnimator(byval entity as iEntity,byval anim as iAnimator)

    DEFINITION:	Removes and frees the specified animator from the specified entity.
	ARGUMENTS:	Entity and animator.
	RETURNS:	None. 

# sub iFreeAllAnimators(byval entity as iEntity )

    DEFINITION:	Removes and frees all animators from the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	None. 

# function iTextureAnimator(byval entity as iEntity,byval texture_name as ZString ptr,byval ext as ZString ptr,byval frame_count as Integer,byval frame_time as integer,byval looped as boolean=true,byval reverse as boolean=false) as iAnimator

    DEFINITION:	Attaches a texture animator to the specified entity.
	ARGUMENTS:	Entity, texture filename, file extension, frame count and frame time.
	RETURNS:	iANIMATOR pointer. 

# function iAddCollisionAnimator(byval selectorgroup as iTRI_SELECTOR, byval entity as iENTITY, byval recursive as boolean = false, byval sliding as single = 0.0005) as iANIMATOR

    DEFINITION:	Attaches a collision animator to the specified entity.
	ARGUMENTS:	The tri or meta selector, entity, recursive (for a meta) and sliding value.
	RETURNS:	iANIMATOR pointer. 

# sub iEntityRadius(byval entity as iENTITY, byval x as single, byval y as single, byval z as single)

    DEFINITION:	Set the radius of the specified entity.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and radius.
	RETURNS:	None. 

# sub iEntityGravity(byval entity as iENTITY, byval x as single, byval y as single, byval z as single)

    DEFINITION:	Set the gravity of the specified entity.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and gravity.
	RETURNS:	None. 

# sub iEntityOffset(byval entity as iENTITY, byval x as single, byval y as single, byval z as single)

    DEFINITION:	Set the position offset of the specified entity.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and offset value.
	RETURNS:	None. 

# function iCreateTriSelector(byval entity as iENTITY, byval iframe as integer = 0) as iTRI_SELECTOR

    DEFINITION:	Creates a triangle selector for the specified entity.
	ARGUMENTS:	Entity and frame if animated entity.
	RETURNS:	iTRI_SELECTOR pointer. 

# function iCreateOctreeSelector(byval entity as iENTITY, byval iframe as integer = 0) as iTRI_SELECTOR

    DEFINITION:	Creates a octree triangle selector for the specified entity(BSP Mesh, etc).
	ARGUMENTS:	Entity and frame if animated entity.
	RETURNS:	iTRI_SELECTOR pointer. 

# function iCreateBoxSelector(byval entity as iENTITY, byval recurse as boolean = false) as iTRI_SELECTOR

    DEFINITION:	Creates a bounding box triangle selector for the specified entity.
	ARGUMENTS:	Entity and frame if animated entity.
	RETURNS:	iTRI_SELECTOR pointer. 

# function iCreateTerrainSelector(byval terrain as iTERRAIN, byval level_of_detail as integer = 0) as iTRI_SELECTOR

    DEFINITION:	Creates a terrain triangle selector for the specified terrain.
	ARGUMENTS:	Terrain and LOD. * 0(BEST) to 3 else crash!
	RETURNS:	iTRI_SELECTOR pointer. 

# function iCreateMetaSelector() as iMETA_SELECTOR

    DEFINITION:	Creates a meta selector for grouping triangle selectors.
	ARGUMENTS:	None.
	RETURNS:	iMETA_SELECTOR pointer. 

# function iRemoveEntitySelector(byval entity as iENTITY, byval selector as iTRI_SELECTOR=NULL) as Boolean

    DEFINITION:	Removes the specified selector from the specified entity.
	ARGUMENTS:	Entity and triangle selector.
	RETURNS:	True on success. 

# sub iMetaAddSelector(byval ms as iMETA_SELECTOR, byval ts as iTRI_SELECTOR)

    DEFINITION:	Adds the specified triangle selector to the specified meta selector.
	ARGUMENTS:	Meta selector and triangle selector.
	RETURNS:	None. 

# sub iMetaRemoveSelector(byval ms as iMETA_SELECTOR, byval ts as iTRI_SELECTOR)

    DEFINITION:	Removes the specified triangle selector from the specified meta selector.
	ARGUMENTS:	Meta selector and triangle selector.
	RETURNS:	None. 

# sub iMetaRemoveEntitySelector(byval ms as iMETA_SELECTOR, byval entity as iENTITY)

    DEFINITION:	Removes the specified entity's triangle selector(s) from the specified meta selector.
	ARGUMENTS:	Meta selector and entity.
	RETURNS:	None. 

# sub iClearMetaSelector(byval ms as iMETA_SELECTOR)

    DEFINITION:	Removes all selectors from the specified meta selector.
	ARGUMENTS:	Meta selector.
	RETURNS:	None. 

# sub iSetEntitySelector(byval entity as iENTITY, byval selector as iTRI_SELECTOR)

    DEFINITION:	Assign the specified selector to the specified entity.
	ARGUMENTS:	Entity and triangle selector.
	RETURNS:	None. 

# function iDeleteMetaSelector(byval ms as iMETA_SELECTOR) as Boolean

    DEFINITION:	Removes and frees the specified meta selector.
	ARGUMENTS:	Meta selector.
	RETURNS:	True on success. 

# function iEntityCollided(byval entity as iENTITY) as Boolean

    DEFINITION:	Has the specified entity been involved in a collision.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity.
	RETURNS:	True if a collision occured. 

# function iCountCollisions(byval entity as iENTITY) as uinteger

    DEFINITION:	Returns the number of collisions that occured for the specified entity.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity.
	RETURNS:	Number of collisions. 

# function iEntityFalling(byval entity as iENTITY) as Boolean

    DEFINITION:	Is the specified entity falling?
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity.
	RETURNS:	True if falling. 

# function iCollidedEntity(byval entity as iENTITY, byval index as integer = 1) as iENTITY

    DEFINITION:	Entity that the specified entity collided with.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	Entity collided with. 

# function iCollidedPointX(byval entity as iENTITY, byval index as integer = 1) as single

    DEFINITION:	Entity's X collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The X coordinate of the vector. 

# function iCollidedPointY(byval entity as iENTITY, byval index as integer = 1) as single

    DEFINITION:	Entity's Y collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The Y coordinate of the vector. 

# function iCollidedPointZ(byval entity as iENTITY, byval index as integer = 1) as single

    DEFINITION:	Entity's Z collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The Z coordinate of the vector. 

# function iCollidedPointNX(byval entity as iENTITY, byval index as integer = 1) as single

    DEFINITION:	Entity's normal X collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The normal X coordinate of the vector. 

# function iCollidedPointNY(byval entity as iENTITY, byval index as integer = 1) as single

    DEFINITION:	Entity's normal Y collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The normal Y coordinate of the vector. 

# function iCollidedPointNZ(byval entity as iENTITY, byval index as integer = 1) as single

    DEFINITION:	Entity's normal Z collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The normal Z coordinate of the vector. 

# function iEntitiesCollided(byval entityA as iENTITY, byval entityB as iENTITY, byval buffer as single = 0.0) as Boolean

    DEFINITION:	Have to specified entites collided?
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and buffer.
	RETURNS:	True if collision occured. 

# sub iBoundingBoxSize(byval entity as iENTITY, byval x as single, byval y as single, byval z as single)

    DEFINITION:	Set the bounding box size of the specified entity.
	ARGUMENTS:	Entity and size.
	RETURNS:	None. 

# function iGetRayCollision(byval entityS as iENTITY, byval entityE as iENTITY, byval z as single=1.0) as Boolean

    DEFINITION:	Does ray from entityS collide with entityE?
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Starting entity, ending entity and max z distance.
	RETURNS:	True if collision occured. 

# function iVectorInsideEntity(byval entity as iEntity,byval x as single, byval y as Single,byval z as single) as Boolean

    DEFINITION:	Is specified point inside specified entity?
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and point.
	RETURNS:	True if inside entity. 

# function iCollisionEntity(byval selector as iTRI_SELECTOR, byval ellipsoidX as single, byval ellipsoidY as single, byval ellipsoidZ as single, byval ellipsoidRadius as single, byval velocityX as single, byval velocityY as single, byval velocityZ as single, byval gravityX as single, byval gravityY as single, byval gravityZ as single, byval slidingSpeed as single=0.0005) as iENTITY

    DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iGetCameraCollisionEntity(byval camera as iCamera,byval idBitMask as integer=0) as iEntity

    DEFINITION:	Has camera collided with another entity?
				*CAMERA MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Camera and ID mask.
	RETURNS:	Entity in which collision occured. 

# function iCollFalling() as Boolean

    DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iCollHitPositionX() as Single

    DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iCollHitPositionY() as Single

    DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iCollHitPositionZ() as Single

    DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iCollNewPositionX() as single

    DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iCollNewPositionY() as Single

    DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iCollNewPositionZ() as Single

    DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iCameraPick(byval x as Integer,byval y as Integer) as iENTITY

    DEFINITION:	Gets entity at specified active camera screen coordinates.
	ARGUMENTS:	Screen coordinates.	
	RETURNS:	Entity in which collision occured. 

# function iLinePick(byval sx as single,byval sy as single,byval sz as single,byval dx as single, byval dy as single,byval dz as single) as iEntity

    DEFINITION:	Gets collided entity with specified ray(line).
	ARGUMENTS:	Start and end ray coordinates.	
	RETURNS:	Entity in which collision occured. 

# function iPickedX() as single

    DEFINITION:	Gets the X value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	X value. 

# function iPickedY() as single

    DEFINITION:	Gets the Y value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Y value. 

# function iPickedZ() as single

    DEFINITION:	Gets the Z value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Z value. 

# function iPickedNX() as single

    DEFINITION:	Gets the normal X value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Normal X value. 

# function iPickedNY() as single

    DEFINITION:	Gets the normal Y value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Normal Y value. 

# function iPickedNZ() as single

    DEFINITION:	Gets the normal Z value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Normal Z value. 

# sub iNameEntity(byval entity as iEntity,byval zname as ZString ptr)

    DEFINITION:	Names the specified entity.
	ARGUMENTS:	Entity and name.	
	RETURNS:	None. 

# sub iFreeEntity(byval entity as iEntity)

    DEFINITION:	Frees the specified entity.
	ARGUMENTS:	Entity.	
	RETURNS:	None. 

# sub iEntityParent(byval entity as iEntity,byval parent as iEntity)

    DEFINITION:	Assign parent to specified entity.
	ARGUMENTS:	Entity and parent.	
	RETURNS:	None. 

# sub iShowEntity(byval entity as iEntity)

    DEFINITION:	Shows entity during render.
	ARGUMENTS:	Entity.	
	RETURNS:	None. 

# sub iHideEntity(byval entity as iEntity)

    DEFINITION:	Hides entity during render.
	ARGUMENTS:	Entity.	
	RETURNS:	None. 

# function iCopyEntity(byval entity as iEntity,byval parent as iEntity = 0) as iENTITY

    DEFINITION:	Copies the specified entity.
	ARGUMENTS:	Entity and optional parent.	
	RETURNS:	iENTITY pointer. 

# sub iEntityShininess(byval entity as iEntity,byval shininess as Single)

    DEFINITION:	Sets the shininess of the specified entity.
	ARGUMENTS:	Entity and shininess value.	
	RETURNS:	None. 

# sub iEntityAlpha(byval entity as iEntity,byval alpha as Integer)

    DEFINITION:	Sets the alpha of the specified entity.
	ARGUMENTS:	Entity and alpha value.	
	RETURNS:	None. 

# sub iEntityTexture(byval entity as iEntity,byval texture as iTexture,byval index as Integer=0)

    DEFINITION:	Sets the texture of the specified entity.
	ARGUMENTS:	Entity, texture and index value.	
	RETURNS:	None. 

# sub iEntityColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the color of the specified entity.
	ARGUMENTS:	Entity and color value.	
	RETURNS:	None. 

# sub iEntityDiffuseColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the diffuse color of the specified entity.
	ARGUMENTS:	Entity and diffuse color value.	
	RETURNS:	None. 

# sub iEntityAmbientColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the ambient color of the specified entity.
	ARGUMENTS:	Entity and ambient color value.	
	RETURNS:	None. 

# sub iEntityEmissiveColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the emissive color of the specified entity.
	ARGUMENTS:	Entity and emissive color value.	
	RETURNS:	None. 

# sub iEntitySpecularColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the specular color of the specified entity.
	ARGUMENTS:	Entity and specular color value.	
	RETURNS:	None. 

# sub iEntityColorByVertex(byval entity as iEntity,byval colorMaterial as ECM_COLOR_MATERIAL)

    DEFINITION:	Sets the vertex color of the specified entity.
	ARGUMENTS:	Entity and ECM_COLOR_MATERIAL.	
	RETURNS:	None. 

# sub iScaleEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)

    DEFINITION:	Scales the specified entity.
	ARGUMENTS:	Entity and x, y and z size.
	RETURNS:	None. 

# sub iPositionEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single, byval collAnimOverride as boolean = false)

    DEFINITION:	Positions the specified entity in 3D space.
	ARGUMENTS:	Entity, x, y, z position and true or false to override the collision animator, if any.
	RETURNS:	None. 

# sub iMoveEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)

    DEFINITION:	Moves the specified entity in 3D space.
	ARGUMENTS:	Entity and x, y and z direction.
	RETURNS:	None. 

# sub iTranslateEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)

    DEFINITION:	Moves the specified entity in 3D space disregarding orientation.
	ARGUMENTS:	Entity and x, y and z direction.
	RETURNS:	None. 

# sub iRotateEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)

    DEFINITION:	Sets the rotation of the specified entity in 3D space.
	ARGUMENTS:	Entity and x, y and z rotation.
	RETURNS:	None. 

# sub iTurnEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)

    DEFINITION:	Turns the specified entity in 3D space.
	ARGUMENTS:	Entity and x, y and z direction.
	RETURNS:	None. 

# sub iPointEntity(byval entity1 as iEntity,byval entity2 as iEntity)

    DEFINITION:	Points entity1 at entity2.
	ARGUMENTS:	Source entity and destination entity.
	RETURNS:	None. 

# sub iEntityPoint(byval entity as iEntity,byval x as single,byval y as single,byval z as single)

    DEFINITION:	Points entity to a specific 3D point.
	ARGUMENTS:	Entity and x, y and z of target point.
	RETURNS:	None. 

# sub iAlignToVector(byval entity as iENTITY, byval vector_x as single, byval vector_y as single, byval vector_z as single, byval axis as uinteger)

    DEFINITION:	Align specified entity with specified vector.
				*NOT YET IMPLEMENTED!
	ARGUMENTS:	Entity, vector and which axis to align with.
	RETURNS:	None. 

# function iCreateWater(byval texture1 as ZString ptr,byval texture2 as ZString ptr,byval height as single=2.0, byval speed as single=300.0,byval length as single=10.0,byval parent as iEntity=0) as iEntity

    DEFINITION:	Creates a water surface entity.
	ARGUMENTS:	Textures, wave height, length speed and parent.
	RETURNS:	iENTITY pointer. 

# function iWaterHeight( byval Entity as iENTITY,byval selector as iTRI_SELECTOR,byval x as single, byval z as single) as single

    DEFINITION:	Gets the height of a point on the specified Water node.
	ARGUMENTS:	The water and parameters.
	RETURNS:	Water height. 

# function iCreateShaderWater(byval wdth as single,byval height as Single, _

  # function iFreeShaderWater(byval shaderwater as iRealisticWaterEntity) as boolean

    DEFINITION:	Free's a previously created shader water.
	ARGUMENTS:	Shader water.
	RETURNS:	True or False. 

# function iShaderWaterWindForce(byval shaderwater as iRealisticWaterEntity, byval windForce as single=10.0) as boolean

    DEFINITION:	Sets the wind force of the shader water surface.
	ARGUMENTS:	shader water and wind force.
	RETURNS:	True or False. 

# function iShaderWaterWindDirection(byval shaderwater as iRealisticWaterEntity,byval x as single=0.0,byval y as single=1.0) as boolean

    DEFINITION:	Sets the wind direction of the shader water surface.
	ARGUMENTS:	shader water and x,y direction.
	RETURNS:	True or False. 

# function iShaderWaterWaveHeight(byval shaderwater as iRealisticWaterEntity,byval waveheight as single=0.5) as boolean

    DEFINITION:	Sets the wave height of the shader water surface.
	ARGUMENTS:	shader water and wave height.
	RETURNS:	True or False. 

# function iShaderWaterColor(byval shaderwater as iRealisticWaterEntity, byval r as uinteger,byval g as uinteger,byval b as uinteger,byval a as uinteger=255) as boolean

    DEFINITION:	Sets the color of the shader water surface.
	ARGUMENTS:	shader water and RGBA. Default 25.5, 25.5, 153, 255
	RETURNS:	True or False. 

# function iShaderWaterColorBlendFactor(byval shaderwater as iRealisticWaterEntity,byval colorBlendFactor as single=0.2) as boolean

    DEFINITION:	Sets the color of the shader water surface.
	ARGUMENTS:	shader water and blend factor.
	RETURNS:	True or False. 

# function iCreateLensFlare(byval txture as iTexture,byval parent as iEntity=0 ) as iEntity

    DEFINITION:	Creates a lens flare entity.
	ARGUMENTS:	Texture and parent.
	RETURNS:	iENTITY pointer. 

# sub iLensFlareScale(byval flare as iEntity,byval source as Single,byval optics as Single)

    DEFINITION:	Sets the scale of the lens flare entity.
	ARGUMENTS:	The lens flare, source(starting source light scale) and optics(projection scale).
	RETURNS:	None. 

# function iCreateLaser(byval parent as iEntity=0) as iEntity

    DEFINITION:	Creates a laser beam entity.
	ARGUMENTS:	Parent.
	RETURNS:	iENTITY pointer. 

# function iCreateSkybox(byval up as iTexture,byval down as iTexture, byval left as iTexture, byval right as iTexture,byval front as iTexture,byval back as iTexture, byval parent as iEntity = 0, byval id as integer = -1) as iEntity

    DEFINITION:	Creates a sky box entity.
	ARGUMENTS:	Textures and parent.
	RETURNS:	iENTITY pointer. 

# function iCreateSkydome(byval texture as iTexture,byval horiRes as Integer=16,byval vertRes as Integer=8, byval texturePercentage as Single=0.9,byval spherePercentage as single=2.0,byval domeRadius as single=1000.0,byval parent as iEntity=0) as iEntity

    DEFINITION:	Creates a sky dome entity.
	ARGUMENTS:	Texture, parameters of dome and parent.
	RETURNS:	iENTITY pointer. 

# function iCreateMirror(byval camera as iCAMERA,byval mirrorOverlay as iTEXTURE,byval parent as iEntity=0) as iENTITY

    DEFINITION:	Creates a mirror plane entity.
	ARGUMENTS:	Camera, texture and parent.
	RETURNS:	iENTITY pointer. 

# sub iMirrorReflect(byval mirror as iENTITY)

    DEFINITION:	Renders the mirror entity.
	ARGUMENTS:	Mirror.
	RETURNS:	None. 

# function iMeshAnimTime(byval mesh as iMesh) as UInteger

    DEFINITION:	Animation time of the specified animated mesh.
	ARGUMENTS:	Animated mesh.
	RETURNS:	Animation time. 

# function iEntityX(byval entity as iEntity,byval global as boolean=false) as Single

    DEFINITION:	The world coordinates X position of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	X world coordinate. 

# function iEntityY(byval entity as iEntity,byval global as boolean=false) as Single

    DEFINITION:	The world coordinates Y position of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Y world coordinate. 

# function iEntityZ(byval entity as iEntity,byval global as boolean=false) as Single

    DEFINITION:	The world coordinates Z position of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Z world coordinate. 

# function iEntityPitch(byval entity as iEntity,byval global as boolean=false) as Single

    DEFINITION:	The pitch of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Pitch in degrees. 

# function iEntityYaw(byval entity as iEntity,byval global as boolean=false) as Single

    DEFINITION:	The yaw of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Yaw in degrees. 

# function iEntityRoll(byval entity as iEntity,byval global as boolean=false) as Single

    DEFINITION:	The roll of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Roll in degrees. 

# function iDeltaYaw(byval srcEntity as iEntity,byval destEntity as iEntity) as single

    DEFINITION:	The yaw difference of the 2 specified entities.
	ARGUMENTS:	Source and destination entity.
	RETURNS:	Difference in degrees. 

# function iDeltaPitch(byval srcEntity as iEntity,byval destEntity as iEntity) as single

    DEFINITION:	The pitch difference of the 2 specified entities.
	ARGUMENTS:	Source and destination entity.
	RETURNS:	Pitch in degrees. 

# function iEntityName(byval entity as iEntity) as ZString ptr

    DEFINITION:	Get the name of the specified entity.
	ARGUMENTS:	Entity.	
	RETURNS:	Name as string. 

# function iEntityVisible(byval srcEntity as iEntity,byval destEntity as iEntity,byval selector as iTRI_SELECTOR) as boolean

    DEFINITION:	Test if entity is visible.
	ARGUMENTS:	Source and destination entity and and collision selector.	
	RETURNS:	True or False. 

# function iEntityDistance(byval entity1 as iEntity,byval entity2 as iEntity) as Single

    DEFINITION:	Get the distance between 2 entities.
	ARGUMENTS:	The two entities.	
	RETURNS:	Distance as single. 

# function iFindChild(byval mesh as iMesh,byval jointname as ZString ptr) as iEntity

    DEFINITION:	Find the child of the given mesh and joint name.
	ARGUMENTS:	Mesh and joint name.	
	RETURNS:	The entity if found. 

# function iCountChildren(byval mesh as iMesh,byval jointname as ZString ptr) as uinteger

    DEFINITION:	Child count of the specified mesh at the specified joint name.
	ARGUMENTS:	Mesh and joint name.	
	RETURNS:	Child count. 

# function iChildName(byval joint as iEntity) as ZString ptr

    DEFINITION:	The name of the specified joint.
	ARGUMENTS:	Joint name.	
	RETURNS:	Name as a string. 

# function iChildIndex(byval joint as iEntity) as uinteger

    DEFINITION:	The index value of the specified joint.
	ARGUMENTS:	Joint name.	
	RETURNS:	Index value. 

# sub iChildMode(byval mesh as iMesh,byval mode as UInteger)

    DEFINITION:	The chid mode of the specified mesh.
	ARGUMENTS:	Mesh name.	
	RETURNS:	None. 

# function iEntityClass(byval entity as iEntity) as UInteger

    DEFINITION:	The class value of the specified entity.
	ARGUMENTS:	Entity.	
	RETURNS:	Class value. 

# sub iEntityMaterialType(byval entity as iEntity,byval mtype as uinteger)

    DEFINITION:	The material type of the specified entity.
	ARGUMENTS:	Material type as EMT_MATERIAL_TYPES.	
	RETURNS:	None. 

# sub iEntityShaderMaterialType(byval entity as iEntity,byval mtype as uinteger)

    DEFINITION:	The shader material type of the specified entity.
	ARGUMENTS:	Material type.	
	RETURNS:	None. 

# sub iEntityMaterialFlag(byval entity as iEntity,byval flag as UInteger,byval mode as Boolean,byval index as integer=-1)

    DEFINITION:	The material flag of the specified entity.
	ARGUMENTS:	Material flag as EMF_MATERIAL_FLAG.	
	RETURNS:	None. 

# sub iEntityCullingType(byval entity as iENTITY, byval value as E_CULLING_TYPE)

    DEFINITION:	The culling type of the specified entity.
	ARGUMENTS:	Culling type as E_CULLING_TYPE.	
	RETURNS:	None. 

# function iGraphicsWidth() as UInteger

    DEFINITION:	Current Graphics Width.
	ARGUMENTS:	None.	
	RETURNS:	Graphics Width. 

# function iGraphicsHeight() as UInteger

    DEFINITION:	Current Graphics Height.
	ARGUMENTS:	None.	
	RETURNS:	Graphics Height. 

# function iQueryFeature(byval feature as EVDF_VIDEO_FEATURE_QUERY ) as Boolean

    DEFINITION:	Query a graphics card feature.
	ARGUMENTS:	EVDF_VIDEO_FEATURE_QUERY feature type.	
	RETURNS:	True or False. 

# sub iDisableFeature(byval feature as EVDF_VIDEO_FEATURE_QUERY,byval flag as Boolean)

    DEFINITION:	Disable or enable the specified feature.
	ARGUMENTS:	EVDF_VIDEO_FEATURE_QUERY feature type and True or False.	
	RETURNS:	None. 

# sub iWritePixelFast(byval x as UInteger,byval y as UInteger,byval image as iImage=0)

    DEFINITION:	Write a pixel at X,Y of the specified image.
	ARGUMENTS:	X and Y location and image.	
	RETURNS:	None. 

# function iReadPixelFast(byval x as UInteger,byval y as UInteger,byval image as iImage=0) as UInteger

    DEFINITION:	Read a pixel at X,Y of the specified image.
	ARGUMENTS:	X and Y location and image.	
	RETURNS:	Pixel value. 

# sub iLine3D(byval xStart as Single,byval yStart as Single,byval zStart as Single,byval xEnd as Single,byval yEnd as Single,byval zEnd as Single)

    DEFINITION:	Draws a line in 3D space.
	ARGUMENTS:	Start X,Y,Z and End X,Y,Z location in world coordinates.	
	RETURNS:	None. 

# sub iPixel(byval x as UInteger,byval y as UInteger)

    DEFINITION:	Creates a pixel at X,Y of screen coordinates.
	ARGUMENTS:	X and Y location of the screen.	
	RETURNS:	None. 

# sub iRect(byval x as Integer,byval y as Integer,byval rWidth as Integer,byval rHeight as Integer,byval solid as boolean=false)

    DEFINITION:	Creates a Rectangle with specified dimensions.
	ARGUMENTS:	Dimensions and solid or not.	
	RETURNS:	None. 

# sub iLine(byval x1 as Integer,byval y1 as Integer,byval x2 as Integer,byval y2 as Integer)

    DEFINITION:	Draws a Line with specified dimensions.
	ARGUMENTS:	Dimensions.	
	RETURNS:	None. 

# sub iOval(byval x as Integer,byval y as Integer,byval radius as Single,byval solid as boolean = false)

    DEFINITION:	Creates an Oval with specified dimensions.
	ARGUMENTS:	Dimensions and solid or not.	
	RETURNS:	None. 

# sub iPoly(byval x as Integer,byval y as Integer,byval radius as Single,byval vertexCount as integer=10,byval solid as boolean=false)

    DEFINITION:	Creates a Polygon with specified dimensions.
	ARGUMENTS:	Dimensions and solid or not.	
	RETURNS:	None. 

# sub iGUIClear()

    DEFINITION:	Clears the GUI overlay.
	ARGUMENTS:	None.	
	RETURNS:	None. 

# sub iFreeGadget(byval gadget as iGadget)

    DEFINITION:	Deletes the specified gadget.
	ARGUMENTS:	Gadget.	
	RETURNS:	None. 

# function iGetGadgetText(byval gadget as iGadget) as WString ptr

    DEFINITION:	Returns the text of the specified gadget.
	ARGUMENTS:	Gadget.	
	RETURNS:	Text as string. 

# function iGetElementText(byval id as integer) as WString ptr

    DEFINITION:	Returns the text of the specified gadget element ID.
	ARGUMENTS:	Gadget element ID.	
	RETURNS:	Text as string. 

# Sub iSetGadgetText(byval gadget as iGadget,byval text as wstring ptr)

    DEFINITION:	Sets the text of the specified gadget.
	ARGUMENTS:	Gadget.	
	RETURNS:	None. 

# Sub iSetElementText(byval id as integer,byval text as wstring ptr)

    DEFINITION:	Sets the text of the specified gadget element ID.
	ARGUMENTS:	Gadget element.	
	RETURNS:	None. 

# function iCreateWindow(byval title as WString ptr,byval x as Integer,byval y as Integer, byval w as Integer,byval h as Integer,byval options as uinteger=1, byval parent as iGadget=0) as iGadget

    DEFINITION:	Creates a GUI window.
	ARGUMENTS:	Dimensions and options.
					1 - The window is modal
					2 - The window is dragable
					4 - The window close button is visible
					8 - The window maximize button is visible
				   16 - The window minimize button is visible	
	RETURNS:	Gadget handle. 

# sub iSetGadgetAlignment(byval element as iGadget,byval upperLeft as EGUI_ALIGNMENT,byval lowerRight as EGUI_ALIGNMENT,byval top as EGUI_ALIGNMENT,byval bottom as EGUI_ALIGNMENT)

    DEFINITION:	lets you control the automatic layout of a gadget when a window is resized by the user.
	ARGUMENTS:	Gadget and edge alignment mode.
					EGUIA_UPPERLEFT		Aligned to parent's top or left side (default)
					EGUIA_LOWERRIGHT	Aligned to parent's bottom or right side
					EGUIA_CENTER		Aligned to the center of parent
					EGUIA_SCALE			Aligned to scale of parent
	RETURNS:	None. 

# function iStaticText(byval text as WString ptr,byval x as Integer,byval y as integer, byval w as Integer,byval h as Integer,byval border as Boolean=FALSE,byval wordWrap as Boolean=FALSE, byval parent as iGadget=NULL) as iGadget

    DEFINITION:	Adds text to the GUI overlay.
	ARGUMENTS:	Dimensions and options.	
	RETURNS:	Gadget handle. 

# function iActivateGadget(byval element as iGadget) as boolean

    DEFINITION:	Sets the specified gadget as active.
	ARGUMENTS:	Gadget to activate.	
	RETURNS:	TRUE or FALSE. 

# function iCreateButton(byval label as WString ptr,byval x as Integer,byval y as Integer,byval w as Integer,byval h as Integer, byval id as Integer,byval tip as WString ptr=NULL, byval parent as iGadget=0) as iGadget

    DEFINITION:	Creates a button gadget.
	ARGUMENTS:	Dimensions and options.	
	RETURNS:	Gadget handle. 

# sub iSetButtonImage(byval button as iGadget,byval texture as iTexture,byval state as EGUI_BUTTON_IMAGE_STATE,byval tx as integer=0, byval ty as integer=0,byval bx as integer=0, byval by as integer=0)

    DEFINITION:	Assigns an image to the specified button gadget.
	ARGUMENTS:	Button gadget, the state and coordinates for image sheet.	
	RETURNS:	None. 

# sub iSetButtonSprite(byval button as iGadget, byval state as EGUI_BUTTON_STATE=EGBS_BUTTON_UP, byval index as integer, _loop as Boolean=false,byval scale as Boolean=false)

    DEFINITION:	*NOT YET IMPLEMENTED!
	ARGUMENTS:		
	RETURNS:	 

# sub iButtonBorder(byval button as iGadget,byval border as Boolean)

    DEFINITION:	Adds a border to the specified button gadget.
	ARGUMENTS:	Button gadget and True or False.	
	RETURNS:	None. 

# function iButtonState(byval button as iGadget) as Boolean

    DEFINITION:	Returns the button state of the specified button gadget.
	ARGUMENTS:	Button gadget.	
	RETURNS:	True if pressed else False. 

# function iCreateScrollBar(byval horizontal as Boolean,byval x as Integer,byval y as Integer, byval w as Integer,byval h as Integer,byval id as Integer,byval spos as Integer, byval max as Integer,byval parent as iGadget=0 ) as iGadget

    DEFINITION:	Creates a scrollbar gadget.
	ARGUMENTS:	Scrollbar options.	
	RETURNS:	Gadget handle. 

# function iCreateListBox(byval x as Integer,byval y as Integer,byval w as Integer,byval h as Integer, byval id as Integer,byval AutoScroll as Boolean,byval background as Boolean,byval parent as iGadget=0) as iGadget

    DEFINITION:	Creates a listbox gadget.
	ARGUMENTS:	Listbox options.	
	RETURNS:	Gadget handle. 

# sub iGadgetSetAutoScroll(byval gadget as iGadget,byval AutoScroll as Boolean)

    DEFINITION:	Auto scroll text of specified gadget.
	ARGUMENTS:	Gadget and True or False.	
	RETURNS:	None. 

# sub iAddGadgetItem(byval gadget as iGadget,byval text as WString ptr)

    DEFINITION:	Adds a text item to the specified listbox gadget.
	ARGUMENTS:	Listbox gadget and text item.	
	RETURNS:	None. 

# sub iInsertGadgetItem(byval gadget as iGadget,byval text as WString ptr,byval index as UInteger)

    DEFINITION:	Adds a text item to the specified listbox gadget and specific index.
	ARGUMENTS:	Listbox gadget, text item and index.	
	RETURNS:	None. 

# sub iRemoveGadgetItem(byval gadget as iGadget,byval index as UInteger)

    DEFINITION:	Removes a text item from the specified listbox gadget.
	ARGUMENTS:	Listbox gadget and item index.	
	RETURNS:	None. 

# sub iSelectGadgetItem(byval gadget as iGadget,byval index as uinteger)

    DEFINITION:	Selects the specified text item, by index.
	ARGUMENTS:	Listbox gadget and item index.	
	RETURNS:	None. 

# function iSelectedGadgetItem(byval gadget as iGadget) as Integer

    DEFINITION:	Gets the specified text item, by index.
	ARGUMENTS:	Listbox gadget.	
	RETURNS:	Item index. 

# function iCountGadgetItems(byval gadget as iGadget) as Integer

    DEFINITION:	Gets the count of items in the listbox.
	ARGUMENTS:	Listbox gadget.	
	RETURNS:	Item count. 

# sub iClearGadgetItems(byval gadget as iGadget)

    DEFINITION:	Clears the specified listbox.
	ARGUMENTS:	Listbox gadget.	
	RETURNS:	None. 

# function iGadgetItemText(byval gadget as iGadget,byval index as uinteger) as CONST WString ptr 

    DEFINITION:	Gets the text of specified listbox item.
	ARGUMENTS:	Listbox gadget and item index.	
	RETURNS:	Text string. 

# function iCreateEditBox(byval text as WString ptr,byval x as Integer,byval y as Integer,byval w as Integer, byval h as Integer,byval id as Integer,byval border as Boolean,byval password as Boolean, byval parent as iGadget=0) as iGadget

    DEFINITION:	Creates an edit box with the specified parameters.
	ARGUMENTS:	Parameters.	
	RETURNS:	Gadget handle. 

# function iStaticImage(byval texture as iTexture,byval x as Integer,byval y as Integer,byval useAlpha as Boolean=TRUE, byval id as Integer=-1,byval parent as iGadget=NULL) as iGadget

    DEFINITION:	Adds a static image to the GUI template.
	ARGUMENTS:	Texture image and parameters.	
	RETURNS:	Gadget handle. 

# function iCreateCheckBox(byval text as WString ptr,byval x as Integer,byval y as Integer,byval w as Integer, byval h as Integer,byval id as Integer,byval checked as Boolean,byval parent as iGadget=0) as iGadget

    DEFINITION:	Creates a check box gadget.
	ARGUMENTS:	Check box parameters.	
	RETURNS:	Gadget handle. 

# sub iGadgetSetCheckBox(byval gadget as iGadget,byval checked as Boolean)

    DEFINITION:	Adds or removes a check in the specified check box.
	ARGUMENTS:	Check box gadget and true or false.	
	RETURNS:	None. 

# function iRequestFile(byval label as WString ptr,byval id as Integer,byval modal as Boolean, byval parent as iGadget=0) as iGadget

    DEFINITION:	Displays the file request GUI.
	ARGUMENTS:	Parameters.	
	RETURNS:	Gadget handle. 

# sub iSetGadgetFont(byval guifont as iFont)

    DEFINITION:	Sets the specified font active.
	ARGUMENTS:	Loaded xml font.	
	RETURNS:	None. 

# sub iSetElementColor(byval element as EGUI_DEFAULT_COLOR,byval r as integer,byval g as Integer,byval b as Integer,byval alpha as Integer)

    DEFINITION:	Sets the specified GUI elements color.
	ARGUMENTS:	The EGUI_DEFAULT_COLOR and RGBA.	
	RETURNS:	None. 

# function iNotify(byval mCaption as WString ptr, byval text as WString ptr, byval flag as EMBF_BUTTONS, byval parent as iGadget=0) as iGadget

    DEFINITION:	Text message and EMBF_BUTTONS buttons.
	ARGUMENTS:	The EGUI_DEFAULT_COLOR and RGBA.	
	RETURNS:	Gadget handle. 

# sub iShowGadget(byval gadget as iGadget)

    DEFINITION:	Shows the specified gadget.
	ARGUMENTS:	Gadget handle.	
	RETURNS:	None. 

# sub iHideGadget(byval gadget as iGadget)

    DEFINITION:	Hides the specified gadget.
	ARGUMENTS:	Gadget handle.	
	RETURNS:	None. 

# sub iEnableGadget(byval gadget as iGadget)

    DEFINITION:	Enables the specified gadget.
	ARGUMENTS:	Gadget handle.	
	RETURNS:	None. 

# sub iDisableGadget(byval gadget as iGadget)

    DEFINITION:	Disables the specified gadget.
	ARGUMENTS:	Gadget handle.	
	RETURNS:	None. 

# sub iWindowButtons(byval wind as iGadget, byval wclose as boolean=false, byval wmax as boolean=false, byval wmin as boolean=false)

    DEFINITION:	Sets which buttons are visible in a GUI Window.
	ARGUMENTS:	Window Gadget handle and True or False for close button, maximize button and minimize button.	
	RETURNS:	None. 

# function iLoadImage(byval file as ZString ptr) as iImage

    DEFINITION:	Loads the specified image file.
	ARGUMENTS:	Image file.
	RETURNS:	Image handle. 

# function iCreateImage(byval x as UInteger,byval y as UInteger,byval format as ECF_COLOR_FORMAT) as iImage

    DEFINITION:	Loads the specified image file.
	ARGUMENTS:	Image file.
	RETURNS:	Image handle. 

# sub iFreeImage(byval image as iImage)

    DEFINITION:	Frees the specified image.
	ARGUMENTS:	Image.
	RETURNS:	None. 

# function iLockImage(byval image as iImage) as integer

    DEFINITION:	Locks the specified image.
	ARGUMENTS:	Image.
	RETURNS:	True on success. 

# sub iUnlockImage(byval image as iImage)

    DEFINITION:	Unlocks the specified image.
	ARGUMENTS:	Image.
	RETURNS:	None. 

# function iGrabImage(byval x as UInteger,byval y as uinteger,byval w as UInteger,byval h as UInteger) as iImage

    DEFINITION:	Grabs an image from the specified screen coordinates.
	ARGUMENTS:	Coordinates.
	RETURNS:	Image Handle. 

# function iImageWidth(byval image as iImage) as uinteger

    DEFINITION:	Gets the width of the specified image.
	ARGUMENTS:	Image.
	RETURNS:	Width as uinteger. 

# function iImageHeight(byval image as iImage) as uinteger

    DEFINITION:	Gets the height of the specified image.
	ARGUMENTS:	Image.
	RETURNS:	Height as uinteger. 

# function iImagePitch(byval image as iImage) as uinteger

    DEFINITION:	Gets the pitch of the specified image.
	ARGUMENTS:	Image.
	RETURNS:	Pitch as uinteger. 

# function iImageColorFormat(byval image as iImage) as uinteger

    DEFINITION:	Gets the color format of the specified image.
	ARGUMENTS:	Image.
	RETURNS:	Uinteger value of the color format. 

# function iGetKey() as Integer

    DEFINITION:	Gets the last key pressed.
	ARGUMENTS:	None.
	RETURNS:	Value of last key pressed. 

# sub iWaitKey()

    DEFINITION:	Pauses until a key is pressed.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iKeyHit(byval key as integer) as integer

    DEFINITION:	The number of times the specified key has been hit.
	ARGUMENTS:	Key value.
	RETURNS:	Number of times. 

# function iKeyDown(byval key as integer) as integer

    DEFINITION:	Is the specified key down?
	ARGUMENTS:	Key value.
	RETURNS:	True if down. 

# sub iFlushKeys()

    DEFINITION:	Clears the keyboard buffer.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iMouseDown(byval button as integer) as integer

    DEFINITION:	Is the specified mouse button down?
	ARGUMENTS:	Button value.
	RETURNS:	True if down. 

# function iMouseHit(byval button as integer) as integer

    DEFINITION:	The number of times the specified button has been hit.
	ARGUMENTS:	Button value.
	RETURNS:	Number of times. 

# function iMouseXSpeed() as integer

    DEFINITION:	The speed at which the mouse traveled in the X direction.
	ARGUMENTS:	None.	*NOTE: NOT YET IMPLEMENTED!
	RETURNS:	Speed as float. 

# function iMouseYSpeed() as integer

    DEFINITION:	The speed at which the mouse traveled in the Y direction.
	ARGUMENTS:	None.	*NOTE: NOT YET IMPLEMENTED!
	RETURNS:	Speed as float. 

# function iMouseZSpeed() as single

    DEFINITION:	The speed at which the mouse wheel traveled.
	ARGUMENTS:	None.
	RETURNS:	Speed as float. 

# sub iFlushMouse()

    DEFINITION:	Clears the mouse buffer.
	ARGUMENTS:	None.
	RETURNS:	None. 

# sub iShowPointer()

    DEFINITION:	Shows the mouse pointer.
	ARGUMENTS:	None.
	RETURNS:	None. 

# sub iHidePointer()

    DEFINITION:	Hides the mouse pointer.
	ARGUMENTS:	None.
	RETURNS:	None. 

# sub iMoveMouse(byval x as integer, byval y as integer)

    DEFINITION:	Moves the mouse pointer to the X and Y screen position.
	ARGUMENTS:	X and Y coordinates.
	RETURNS:	None. 

# function iMouseX() as integer

    DEFINITION:	The current X coordinate of the mouse.
	ARGUMENTS:	None.
	RETURNS:	X screen coordinate. 

# function iMouseY() as integer

    DEFINITION:	The current Y coordinate of the mouse.
	ARGUMENTS:	None.
	RETURNS:	Y screen coordinate. 

# function iMouseZ() as integer

    DEFINITION:	The direction the mouse wheel is moving.
	ARGUMENTS:	None.
	RETURNS:	1 for forward, -1 for backwards or 0 for no movement. 

# function iGetLastSelectedFile() as wstring ptr

    DEFINITION:	Gets the last selected file from GUI window.
	ARGUMENTS:	None.
	RETURNS:	Stringname of file. 

# function iGUIEventAvailable() as Integer

    DEFINITION:	Checks for available GUI events.
	ARGUMENTS:	None.
	RETURNS:	True if events are buffered. 

# function iReadGUIEvent() as iGUI_EVENT PTR

    DEFINITION:	Reads the oldest GUI event from the event buffer.
	ARGUMENTS:	None.
	RETURNS:	iGUI_EVENT pointer. 

# sub iAmbientLight(byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the ambient light of the 3D environment.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. 

# function iCreateVolumetricLight(byval footR as UInteger,byval footG as UInteger,byval footB as UInteger, byval tailR as UInteger,byval tailG as UInteger,byval tailB as UInteger, byval parent as iEntity=0) as iLIGHT

    DEFINITION:	Creates a volumetric light and adds it to the scene.
	ARGUMENTS:	Light foot and tail color.	
	RETURNS:	iLIGHT. 

# function iCreateLight(byval ltype as ELT_LIGHT_TYPE=ELT_POINT,byval parent as iEntity=0) as iLIGHT

    DEFINITION:	Creates the specified light type and adds it to the scene, default is ELT_POINT.
	ARGUMENTS:	Light type and parent.	
	RETURNS:	iLIGHT. 

# sub iLightColor(byval light as iLight,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the color of the specified light.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. 

# sub iLightAmbientColor(byval light as iLight,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the ambient color of the specified light.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. 

# sub iLightDiffuseColor(byval light as iLight,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the diffuse color of the specified light.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. 

# sub iLightSpecularColor(byval light as iLight,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Sets the specular color of the specified light.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. 

# sub iLightRange(byval light as iLight,byval constant as Single,byval linear as Single,byval quadratic as Single)

    DEFINITION:	Sets the range or distance of the specified light.
	ARGUMENTS:	Constant, linear and quadratic values default ( 0, 1.f/radius, 0 ).
	RETURNS:	None. 

# sub iLightFalloff(byval light as iLight,byval Falloff as Single)

    DEFINITION:	Sets the falloff rate of the specified light.
	ARGUMENTS:	Falloff values.
	RETURNS:	None. 

# sub iLightConeAngle(byval light as iLight,byval innercone as Single,byval outercone as Single)

    DEFINITION:	Sets the cone angle of the specified light.
	ARGUMENTS:	Inner and outer cone values.
	RETURNS:	None. 

# sub iLightRadius(byval light as iLight,byval Radius as single)

    DEFINITION:	Sets the radius of the specified light, default is 100.0.
				*NOTE: Setting the radius will also influence the attenuation, setting it to (0,1/radius,0).
						If you want to override this behavior, set the attenuation after the radius.
	ARGUMENTS:	Light type and new radius.	
	RETURNS:	None. 

# sub iLightType(byval light as iLight,byval ltype as UInteger)

    DEFINITION:	Sets the type of the specified light.
	ARGUMENTS:	Type value.
	RETURNS:	None. 

# function iLightCount() as UInteger

    DEFINITION:	Current count of light entities.
	ARGUMENTS:	None.
	RETURNS:	count of lights. 

# sub iMaterialVertexColorAffects(byval material as iMaterial,byval colorMaterial as ECM_COLOR_MATERIAL)

    DEFINITION:	Sets the material color affects.
	ARGUMENTS:	Material and ECM_COLOR_MATERIAL.
	RETURNS:	None. 

# sub iMaterialShininess(byval material as iMaterial,byval shininess as Single)

    DEFINITION:	Sets the material Shininess.
	ARGUMENTS:	Material and shininess level.
	RETURNS:	None. 

# sub iMaterialSpecularColor(byval material as iMaterial,byval r as UInteger, byval g as UInteger,byval b as UInteger,byval a as UInteger)

    DEFINITION:	Sets the material specular color.
	ARGUMENTS:	Material and RGBA color.
	RETURNS:	None. 

# sub iMaterialDiffuseColor(byval material as iMaterial,byval r as UInteger, byval g as UInteger,byval b as UInteger,byval a as UInteger)

    DEFINITION:	Sets the material diffuse color.
	ARGUMENTS:	Material and RGBA color.
	RETURNS:	None. 

# sub iMaterialAmbientColor(byval material as iMaterial,byval r as UInteger, byval g as UInteger,byval b as UInteger,byval a as UInteger)

    DEFINITION:	Sets the material ambient color.
	ARGUMENTS:	Material and RGBA color.
	RETURNS:	None. 

# sub iMaterialEmissiveColor(byval material as iMaterial,byval r as UInteger, byval g as UInteger,byval b as UInteger,byval a as UInteger)

    DEFINITION:	Sets the material emissive color.
	ARGUMENTS:	Material and RGBA color.
	RETURNS:	None. 

# sub iMaterialTypeParam(byval material as iMaterial,byval pvalue as single)

    DEFINITION:	Sets the material type parameter value.
	ARGUMENTS:	Material and value.
	RETURNS:	None. 

# sub iMaterialBlend(byval material as iMaterial,byval blendSrc as EBF_BLEND_FACTOR,byval blendDest as EBF_BLEND_FACTOR)

    DEFINITION:	Sets the material blend factor.
	ARGUMENTS:	Material and blend factor.
	RETURNS:	None. 

# sub iMaterialLineThickness(byval material as iMaterial,byval lineThickness as Single)

    DEFINITION:	Sets the material line thickness.
	ARGUMENTS:	Material and thickness as single.
	RETURNS:	None. 

# function iMaterialCount(byval entity as iEntity) as UInteger

    DEFINITION:	Material count of the specified entity.
	ARGUMENTS:	iENTITY.
	RETURNS:	Count as uinteger. 

# function iGetMaterial(byval entity as iEntity,byval index as UInteger) as iMaterial

    DEFINITION:	Grabs the material index of the specified iENTITY.
	ARGUMENTS:	iENTITY and index value.
	RETURNS:	iMATERIAL. 

# function iCurveValue(byval nvalue as single,byval ovalue as Single,byval increment as Single) as Single

    DEFINITION:	Curves the value with the specified parameters.
	ARGUMENTS:	The new and old value and increment.
	RETURNS:	Value as single. 

# function iWrapValue(byval invalue as Single,byval min as Single,byval max as Single) as Single

    DEFINITION:	Wraps the value with the specified parameters.
	ARGUMENTS:	The min and max values.
	RETURNS:	Value as single. 

# function iClampValue(byval invalue as Single,byval low as Single,byval high as Single) as Single

    DEFINITION:	Clamps the value with the specified parameters.
	ARGUMENTS:	The low and high values.
	RETURNS:	Value as single. 

# function iMin(byval value1 as Single,byval value2 as Single) as Single

    DEFINITION:	The minimum of two values.
	ARGUMENTS:	Value one and value two.
	RETURNS:	Minimum value as single. 

# function iMax(byval value1 as Single,byval value2 as Single) as Single

    DEFINITION:	The maximum of two values.
	ARGUMENTS:	Value one and value two.
	RETURNS:	Maximum value as single. 

# function iDistance2D(byval x1 as Single,byval y1 as Single,byval x2 as Single,byval y2 as Single) as Single

    DEFINITION:	The distance between two 2D coordinates.
	ARGUMENTS:	The X and Y coordinates of both points.
	RETURNS:	Distance as single. 

# function iDistance3D(byval x1 as Single,byval y1 as Single,byval z1 as Single,byval x2 as Single, byval y2 as Single,byval z2 as Single) as Single

    DEFINITION:	The distance between two 3D coordinates.
	ARGUMENTS:	The X, Y and Z coordinates of both points.
	RETURNS:	Distance as single. 

# function iRand(byval min as Integer,byval max as Integer) as Integer

    DEFINITION:	Generates an integer random number.
	ARGUMENTS:	Minimum and maximum values.
	RETURNS:	Random integer. 

# function iRnd(byval min as single,byval max as single) as single

    DEFINITION:	Generates a float random number.
	ARGUMENTS:	Minimum and maximum values.
	RETURNS:	Random float. 

# sub iSeedRand(byval seed as Integer)

    DEFINITION:	Seeds the random number generator.
	ARGUMENTS:	Seed value.
	RETURNS:	None. 

# function iARGB(byval a as uinteger, byval r as uinteger, byval g as uinteger, byval b as uinteger) as uinteger

    DEFINITION:	Converts individual ARGB values to a single integer value.
	ARGUMENTS:	Alpha, red, green and blue values.
	RETURNS:	ARGB integer value. 

# function iLoadMD2(byval cptrFile as ZString ptr,byval parent as iEntity=0) as iEntity

    DEFINITION:	Loads an MD2 model from file.
	ARGUMENTS:	Filename of MD2 and optional parent.
	RETURNS:	iENTITY pointer. 

# sub iAnimateMD2(byval entity as iEntity,byval mode as uInteger,byval speed as Single,byval first_frame as Integer, byval last_frame as Integer,byval transition as Single)

    DEFINITION:	Animates an MD2 model.
	ARGUMENTS:	Entity, mode(0= 1 time, 1= Loop), speed, start frame, end frame and transition value.
	RETURNS:	None. 

# sub iPlayMD2Animation(byval entity as iEntity,byval animation as EMD2_ANIMATION_TYPE)

    DEFINITION:	Animates an MD2 model based on EMD2_ANIMATION_TYPE.
	ARGUMENTS:	Entity and EMD2_ANIMATION_TYPE.
	RETURNS:	None. 

# function iMD2AnimTime(byval entity as iEntity) as Single

    DEFINITION:	MD2 animation animation time.
	ARGUMENTS:	Entity.
	RETURNS:	Animation time as single. 

# function iMD2AnimLength(byval entity as iEntity) as UInteger

    DEFINITION:	MD2 animation animation length.
	ARGUMENTS:	Entity.
	RETURNS:	Animation length as single. 

# function iMD2Animating(byval entity as iEntity) as Boolean

    DEFINITION:	Checks if MD2 is currently animating.
	ARGUMENTS:	Entity.
	RETURNS:	True if animating. 

# function iMeshHeight(byval entity as iEntity) as single

    DEFINITION:	The height of the specified mesh entity.
	ARGUMENTS:	iENTITY.
	RETURNS:	Height as single. 

# function iMeshWidth(byval entity as iEntity) as single

    DEFINITION:	The width of the specified mesh entity.
	ARGUMENTS:	iENTITY.
	RETURNS:	Width as single. 

# function iMeshDepth(byval entity as iEntity) as single

    DEFINITION:	The depth of the specified mesh entity.
	ARGUMENTS:	iENTITY.
	RETURNS:	Depth as single. 

# function iCreateCube(byval parent as iEntity=0) as iEntity

    DEFINITION:	Creates a cube entity.
	ARGUMENTS:	Parent if needed.
	RETURNS:	iENTITY handle. 

# function iCreateSphere(byval polyCount as Integer=16,byval parent as iEntity=0) as iEntity

    DEFINITION:	Creates a sphere entity.
	ARGUMENTS:	Poly count an parent if needed.
	RETURNS:	iENTITY handle. 

# function iCreateCylinder(byval tesselation as UInteger,byval parent as iEntity=0) as iEntity

    DEFINITION:	Creates a cylinder entity.
	ARGUMENTS:	Tesselation and parent if needed.
	RETURNS:	iENTITY handle. 

# function iCreateCone(byval tesselation as UInteger,byval parent as iEntity=0) as iEntity

    DEFINITION:	Creates a cone entity.
	ARGUMENTS:	Tesselation and parent if needed.
	RETURNS:	iENTITY handle. 

# function iCreatePlane(byval parent as iEntity=0,byval size as Single=10000.0,byval tileCount as UInteger=1) as iEntity

    DEFINITION:	Creates a plane entity.
	ARGUMENTS:	Parent if needed size and tile count.
	RETURNS:	iENTITY handle. 

# function iCreateQuad(byval size as single = 10.0,byval parent as iENTITY=0) as iENTITY

    DEFINITION:	Creates a quad entity.
	ARGUMENTS:	Size and parent if needed.
	RETURNS:	iENTITY handle. 

# function iWriteMesh(byval mesh as iMesh,byval mtype as UInteger,byval filename as ZString ptr) as UInteger

    DEFINITION:	Mesh writer, 0=IRR(.irrmesh),1=COLLADA(.dae or.xml),2=STL(.stl),3=OBJ(.obj),4=PLY(.ply),
				5=BLITZ(.b3d)
	ARGUMENTS:	Mesh Entity, save type and filename.
	RETURNS:	0 writer failed, 1 file failed, 2 no valid mesh, 3 success. 

# sub iClearUnusedMeshes()

    DEFINITION:	Clears all unused meshes from the mesh buffer.
	ARGUMENTS:	None.
	RETURNS:	None. 

# sub iFreeMesh(byval mesh as iMesh)

    DEFINITION:	Frees the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	None. 

# sub iMeshTexture(byval mesh as iMesh,byval texture as iTexture,byval index as uinteger,byval iBuffer as uinteger)

    DEFINITION:	Textures the specified mesh.
	ARGUMENTS:	Mesh, texture, index and buffer.
	RETURNS:	None. 

# sub iNameMesh(byval mesh as iMesh,byval mname as ZString ptr)

    DEFINITION:	Names the specified mesh.
	ARGUMENTS:	iMESH and name.
	RETURNS:	None. 

# function iCopyMesh(byval mesh as iMesh) as iMesh

    DEFINITION:	Copies the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	iMESH handle. 

# sub iOutlineMesh(byval mesh as iEntity,byval lWidth as single,byval red as uinteger,byval green as UInteger,byval blue as UInteger)

    DEFINITION:	Adds an outline to the specified mesh.
	ARGUMENTS:	iMesh, line width and line color.
	RETURNS:	None. 

# function iFlipMesh(byval mesh as iMesh) as boolean

    DEFINITION:	Flips the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	True on success. 

# function iFlipEntityMesh(byval entity as iEntity) as boolean

    DEFINITION:	Flips the mesh of the specified entity.
	ARGUMENTS:	iENTITY handle.
	RETURNS:	True on success. 

# sub iScaleMesh(byval mesh as iMesh,byval xScale as single,byval yScale as single,byval zScale as single,byval iMeshBuffer as UInteger=0,byval sourceMesh as iMesh=0)

    DEFINITION:	Set the scale of the specified mesh.
	ARGUMENTS:	iMESH handle and parameters.
	RETURNS:	None. 

# function iCreateMesh(byval cptrMeshName as ZString ptr,byval iVertexCount as UInteger,byval vVertices as iVERTEX, byval iIndicesCount as UInteger,byval usIndices as UInteger) as iMesh

    DEFINITION:	Creates a mesh with the specified parameters.
	ARGUMENTS:	iMESH parameters.
	RETURNS:	iMESH handle. 

# function iLoadMesh(byval cptrFile as ZString ptr) as iMesh

    DEFINITION:	Loads a mesh from the specified file.
	ARGUMENTS:	Mesh file.
	RETURNS:	iMESH handle. 

# function iLoadMeshEntity(byval cptrFile as ZString ptr,byval parent as iEntity=0) as iEntity

    DEFINITION:	Loads a mesh entity from the specified file.
	ARGUMENTS:	Mesh file.
	RETURNS:	iENTITY handle. 

# function iGetEntityMesh(byval entity as iEntity) as iMesh

    DEFINITION:	Gets the mesh from the specified entity.
	ARGUMENTS:	iENTITY handle.
	RETURNS:	iMESH handle. 

# function iLoadAnimMesh(byval cptrFile as ZString ptr,byval parent as iEntity=0) as iEntity

    DEFINITION:	Loads an animated mesh entity from the specified file.
	ARGUMENTS:	Mesh file.
	RETURNS:	iENTITY handle. 

# function iCreateHillPlaneMesh(byval meshname as ZString ptr,byval tileSizeX as single,byval tileSizeY as Single, byval tileCountX as UInteger,byval tileCountY as UInteger,byval material as iMaterial, byval hillHeight as single, byval countHillsX as single,byval countHillsY as single, byval textureRepeatCountX as single,byval textureRepeatCountY as Single) as iMesh

    DEFINITION:	Creates a hill plane mesh with the specified parameters.
	ARGUMENTS:	Hill plane mesh parameters.
	RETURNS:	iMESH handle. 

# function iAddMeshToScene(byval mesh as iMesh) as iEntity

    DEFINITION:	Adds the specified mesh to the secen as an entity.
	ARGUMENTS:	iMESH handle.
	RETURNS:	iENTITY handle. 

# function iStaticMeshForNormalMapping(byval mesh as iMesh) as iEntity

    DEFINITION:	Preps the specified mesh for normal mapping.
	ARGUMENTS:	iMESH handle.
	RETURNS:	iENTITY handle. 

# sub iHWAcceleratedMesh(byval mesh as iMesh,byval iFrame as Integer=0)

    DEFINITION:	Marks the specified mesh for hardware exceleration.
	ARGUMENTS:	iMESH handle and frame if needed.
	RETURNS:	None. 

# sub iHWAcceleratedMeshEntity(byval entity as iEntity,byval iFrame as Integer=0)

    DEFINITION:	Marks the specified mesh entity for hardware exceleration.
	ARGUMENTS:	iENTITY handle and frame if needed.
	RETURNS:	None. 

# function iMeshFrameCount(byval mesh as iMesh) as UInteger

    DEFINITION:	Gets the frame count of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	Frame count. 

# function iMeshBufferCount(byval mesh as iMesh,byval iFrame as Integer) as UInteger

    DEFINITION:	Gets the buffer count of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	Buffer count. 

# function iMeshIndexCount(byval mesh as iMesh,byval iFrame as Integer,byval iMeshBuffer as UInteger = 0) as UInteger

    DEFINITION:	Gets the index count of the specified mesh.
	ARGUMENTS:	iMESH handle, frame and mesh buffer.
	RETURNS:	Index count. 

# sub iGetMeshIndices( byval mesh as iMesh, byval frame as integer, byref indicies as ushort, byval meshBuffer as integer = 0 )

    DEFINITION:	Gets the mesh indices of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	None. 

# sub iSetMeshIndices( byval mesh as iMesh, byval frame as integer, byref indicies as ushort, byval meshBuffer as integer = 0 )

    DEFINITION:	Sets the mesh indices of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	As indicies. 

# function iMeshVertexCount(byval mesh as iMesh,byval iFrame as Integer,byval iMeshBuffer as UInteger = 0) as UInteger

    DEFINITION:	Gets the mesh vertex count of the specified mesh.
	ARGUMENTS:	iMESH handle, frame and buffer.
	RETURNS:	Vertex count. 

# function iGetMeshVertexMemory(byval mesh as iMesh,byval frame as integer = 0,byval meshBuffer as integer = 0 ) as any ptr

    DEFINITION:	Gets the vertex memory to the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	Pointer to vertex memory. 

# sub iGetMeshVertices(byval mesh as iMesh,byval frame as integer,byref verticies as iVERTEX,byval meshBuffer as integer = 0 )

    DEFINITION:	Gets the mesh vertices of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	As verticies. 

# sub iSetMeshVertices(byval mesh as iMesh,byval frame as integer,byref verticies as iVERTEX,byval meshBuffer as integer = 0 )

    DEFINITION:	Sets the mesh vertices of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	None. 

# sub iMeshBoundingBox(byval mesh as iMesh,byref minx as Single,byref miny as Single,byref minz as Single, byref maxx as Single,byref maxy as Single,byref maxz as single)

    DEFINITION:	Sets the specified mesh's bounding box.
	ARGUMENTS:	iMESH handle and dimensions.
	RETURNS:	None. 

# function iMeshCount() as UInteger

    DEFINITION:	Gets the current engine mesh count.
	ARGUMENTS:	None.
	RETURNS:	Mesh count. 

# function iLoadMeshBSP(byval cptrFile as ZString ptr) as iMesh

    DEFINITION:	Loads a mesh BSP from the specified file.
	ARGUMENTS:	BSP mesh file.
	RETURNS:	iMESH handle. 

# function iCreateEntityBSPfromMeshBSP(byval vptrMesh as iMesh) as iEntity

    DEFINITION:	Creates an entity mesh from a BSP mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	iENTITY handle. 

# sub iStaticCollisionsBSP(byval meshBSP as iMesh,byval entityBSP as iEntity,byval entity as iEntity, byval radiusx as Single,byval radiusy as Single,byval radiusz as Single,byval gravityx as Single, byval gravityy as Single,byval gravityz as Single,byval offsetx as single,byval offsety as Single, byval offsetz as Single)

    DEFINITION:	Creates static collision for specified BSP mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	None. 

# function iRN_Version() as ZString ptr

    DEFINITION:	Gets the Raknet version.
	ARGUMENTS:	None.
	RETURNS:	Version. 

# function iRN_Init() as Integer

    DEFINITION:	Initializes the Raknet interface.
	ARGUMENTS:	None.
	RETURNS:	True on success. 

# function iRN_StartServer(byval maxConnections as UInteger,byval localPort as UInteger,byval password as ZString ptr=NULL) as Integer

    DEFINITION:	Attempt to start Raknet as Server.
	ARGUMENTS:	Server parameters.
	RETURNS:	TRUE or FALSE. Will return -1 if Raknet itself fails to startup Server. 

# function iRN_StartClient() as Integer

    DEFINITION:	Attempt to start Raknet as client.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. Will return -1 if Raknet itself fails to startup Client. 

# function iRN_GetMyIP() as CONST zstring ptr

    DEFINITION:	Gets local IP.
	ARGUMENTS:	None.
	RETURNS:	Local IP as string. 

# function iRN_GetMyGUID() as CONST zstring ptr

    DEFINITION:	Gets local internal GUID.
	ARGUMENTS:	None.
	RETURNS:	Local GUID as string. 

# function iRN_Connect(byval host as ZString ptr,byval remotePort as UInteger,byval password as ZString ptr=NULL, byval blocking as Boolean=false) as Integer

    DEFINITION:	For Client, attempts to connect to a server, if blocking is TRUE, program
				will wait for connection message else you must process yourself.
	ARGUMENTS:	Connection parameters.
	RETURNS:	TRUE or FALSE, if blocking is FALSE, this will return TRUE always. 

# function iRN_CloseConnection(byval notify as Boolean=true) as boolean

    DEFINITION:	For Client, closes current connection.
	ARGUMENTS:	True to send disconnect message.
	RETURNS:	TRUE or FALSE. 

# function iRN_Shutdown(byval waitTimeMS as uInteger=100) as boolean

    DEFINITION:	Shutdown Raknet. *YOU MUST RUN THIS BEFORE EXITING YOUR APP IF YOU USED iRN_Init()! 
	ARGUMENTS:	Shutdown delay.
	RETURNS:	TRUE or FALSE. 

# function iRN_CheckMessages() as boolean

    DEFINITION:	Check Message Queue, returns True if messages are waiting.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. 

# function iRN_ClearMessage() as boolean

    DEFINITION:	Clears the current Message from the receive queue.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. 

# function iRN_ForwardMessage() as Boolean

    DEFINITION:	For Server only, forwards the active received Message.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. 

# function iRN_DisconnectPlayer(byval playerID as Integer,byval notify as Boolean=true) as boolean

    DEFINITION:	For Server only, disconnects a player.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. 

# function iRN_GetMyID() as Integer

    DEFINITION:	Returns my Player ID.
	ARGUMENTS:	None.
	RETURNS:	Player ID. 

# function iRN_GetPlayerID() as Integer

    DEFINITION:	For Server only, returns Player ID for current Message.
	ARGUMENTS:	None.
	RETURNS:	1 or greater for player ID or FALSE for failure. 

# function iRN_GetDisconnectID() as Integer

    DEFINITION:	For Server only, returns Player ID for last player disconnect.
	ARGUMENTS:	None.
	RETURNS:	Player ID. 

# function iRN_GetTotalConnections() as UInteger

    DEFINITION:	For Server only, returns current connected player count.
	ARGUMENTS:	None.
	RETURNS:	Current total connections. 

# function iRN_GetTime() as Integer

    DEFINITION:	Gets Raknet internal clock.
	ARGUMENTS:	None.
	RETURNS:	Clock value. 

# function iRN_Active() as Boolean

    DEFINITION:	Returns if Raknet is currently initialized.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. 

# function iRN_PingHost(byval host as ZString ptr,byval remotePort as UInteger) as Integer

    DEFINITION:	*NOT YET IMPLEMENTED!
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iRN_GetAveragePing(byval playerID as Integer) as Integer

    DEFINITION:	For Server only, returns average ping for specified player.
	ARGUMENTS:	Player ID.
	RETURNS:	Ping value. 

# function iRN_GetLastPing(byval playerID as Integer) as Integer

    DEFINITION:	For Server only, returns last ping for specified player.
	ARGUMENTS:	Player ID.
	RETURNS:	Ping value. 

# function iRN_GetLowestPing(byval playerID as Integer) as Integer

    DEFINITION:	For Server only, returns specified players lowest ping.
	ARGUMENTS:	Player ID.
	RETURNS:	Ping value. 

# sub iRN_AddToBanList(byval ip as ZString ptr,byval milliseconds as Integer=60000)

    DEFINITION:	For Server only, Adds an IP Address to the BAN LIST.
	ARGUMENTS:	IP to add.
	RETURNS:	None. 

# sub iRN_RemoveFromBanList(byval ip as ZString ptr)

    DEFINITION:	For Server only, removes and IP Address from the BAN LIST.
	ARGUMENTS:	IP to remove.
	RETURNS:	None. 

# sub iRN_ClearBanList()

    DEFINITION:	For Server only, clears the internal BAN LIST.
	ARGUMENTS:	None.
	RETURNS:	None. 

# function iRN_IsBanned(byval ip as ZString ptr) as Boolean

    DEFINITION:	For Server only, check if a specific IP Address is currently BANNED.
	ARGUMENTS:	IP to check.
	RETURNS:	TRUE or FALSE. 

# function iRN_SendMessage(byval playerID as Integer,byval priority as Integer,byval reliability as Integer, byval orderingChannel as Integer=0,byval broadcast as Boolean=true) as Integer

    DEFINITION:	Send current message.
	ARGUMENTS:	PID and send parameters.
	RETURNS:	Raknet's Result. 

# sub iRN_SendTimeStamp()

    DEFINITION:	Add this immediately after Message Type (RN_SendByte) when you want a timestamped message.
	ARGUMENTS:	None.
	RETURNS:	None. 

# sub iRN_SendByte(byval bValue as Byte)

    DEFINITION:	Send a Byte of Data.
	ARGUMENTS:	Byte value.
	RETURNS:	None. 

# sub iRN_SendInt(byval iValue as integer)

    DEFINITION:	Send a Integer of Data.
	ARGUMENTS:	Integer value.
	RETURNS:	None. 

# sub iRN_SendFloat(byval fValue as Single)

    DEFINITION:	Send a Float(single) of Data.
	ARGUMENTS:	Float value.
	RETURNS:	None. 

# sub iRN_SendString(byval sValue as CONST zstring ptr)

    DEFINITION:	Send a string of data (* Max length of 254).
	ARGUMENTS:	String value.
	RETURNS:	None. 

# function iRN_GetTimeStamp() as integer

    DEFINITION:	Returns translated timestamp of current message, this is cleard with the message (RN_ClearMessage).
	ARGUMENTS:	None.
	RETURNS:	Timestamp value. 

# function iRN_GetByte() as Byte

    DEFINITION:	Returns a Byte of data from current message.
	ARGUMENTS:	None.
	RETURNS:	Byte value. 

# function iRN_GetInt() as Integer

    DEFINITION:	Returns a Integer of data from current message.
	ARGUMENTS:	None.
	RETURNS:	Integer value. 

# function iRN_GetFloat() as Single

    DEFINITION:	Returns a Float(single) of data from current message.
	ARGUMENTS:	None.
	RETURNS:	Float value. 

# function iRN_GetString() as CONST zstring ptr

    DEFINITION:	Returns a String of data from current message.
	ARGUMENTS:	None.
	RETURNS:	String value. 

# function iCreateSpline() as uinteger

    DEFINITION:	Initializes a new spline handle.
	ARGUMENTS:	None.
	RETURNS:	Spline ID. 

# function iFreeSpline(byval splineID as UInteger) as boolean

    DEFINITION:	Free's a spline handle and data.
	ARGUMENTS:	Spline ID.
	RETURNS:	TRUE on success. 

# function iGetSplineX(byval splineID as uinteger,byval timeMS as Single) as Single

    DEFINITION:	Gets the X value of the specified spline and time.
	ARGUMENTS:	Spline ID and ms value.
	RETURNS:	Value of X at the supplied time. 

# function iGetSplineY(byval splineID as uinteger,byval timeMS as Single) as Single

    DEFINITION:	Gets the Y value of the specified spline and time.
	ARGUMENTS:	Spline ID and ms value.
	RETURNS:	Value of Y at the supplied time. 

# function iGetSplineZ(byval splineID as uinteger,byval timeMS as Single) as Single

    DEFINITION:	Gets the Z value of the specified spline and time.
	ARGUMENTS:	Spline ID and ms value.
	RETURNS:	Value of Z at the supplied time. 

# sub iInit2DSpline(byval splineID as UInteger,byval StartX as Single,byval StartY as Single,byval Ctrl1X as Single, byval Ctrl1Y as Single,byval Ctrl2X as Single,byval Ctrl2Y as Single,byval EndX as Single,byval EndY as Single)

    DEFINITION:	Initialize a 2D spline with the supplied data.
	ARGUMENTS:	Spline ID, start, control and end values.
	RETURNS:	None. 

# sub iInit3DSpline(byval SplineID as UInteger,byval StartX as Single,byval StartY as Single,byval StartZ as Single, byval Ctrl1X as Single,byval Ctrl1Y as Single,byval Ctrl1Z as Single,byval Ctrl2X as Single,byval Ctrl2Y as Single,byval Ctrl2Z as Single, byval EndX as Single,byval EndY as Single,byval EndZ as Single)

    DEFINITION:	Initialize a 3D spline with the supplied data.
	ARGUMENTS:	Spline ID, start, control and end values.
	RETURNS:	None. 

# function iExtrapolatePoint(byval timeMS as single,byval initPos as Single,byval vel as Single,byval accel as Single=0, byval maxvel as Single=0) as Single

    DEFINITION:	Calculates where an object would be after the time specified.
	ARGUMENTS:	Time in ms and control values.
	RETURNS:	Point value. 

# function iGetTotalSplines() as UInteger

    DEFINITION:	Gets the total number of active splines.
	ARGUMENTS:	None.
	RETURNS:	Spline count. 

# function iCreateParticleSystem( ByVal add_emitter As Boolean=false, ByVal parent As iEntity = 0) As iPARTICLE_SYSTEM

    DEFINITION:	Creates a particle system.
	ARGUMENTS:	System parameters.
	RETURNS:	iPARTICLE_SYSTEM handle. 

# sub iParticleSize( byval particle_emitter as iEMITTER, byval x as single, byval y as single )

    DEFINITION:	Sets the X and Y size of the specified emitter.
	ARGUMENTS:	iEMITTER and X and Y size.
	RETURNS:	None. 

# sub iParticleMinSize( byval particle_emitter as iEMITTER, byval X as single, byval Y as single )

    DEFINITION:	Sets the minimum size of the specified emitter.
	ARGUMENTS:	iEMITTER and minimum X and Y size.
	RETURNS:	None. 

# sub iParticleMaxSize( byval particle_emitter as iEMITTER, byval X as single, byval Y as single )

    DEFINITION:	Sets the maximum size of the specified emitter.
	ARGUMENTS:	iEMITTER and maximum X and Y size.
	RETURNS:	None. 

# function iCreateParticleEmitter( byval particle_system as iPARTICLE_SYSTEM, byVAL settings as iPARTICLE_SETTINGS ) as iEMITTER

    DEFINITION:	Creates a particle emitter.
	ARGUMENTS:	Particle system and iPARTICLE_SETTINGS array.
	RETURNS:	iEMITTER handle. 

# function iCreateAnimatedEntityEmitter( byval particle_system as iPARTICLE_SYSTEM, byval entity as iEntity, byval use_normal_direction as uinteger, byval normal_direction_modifier as single, byval emit_from_every_vertex as integer, byval settings as iPARTICLE_SETTINGS ) as iEMITTER

    DEFINITION:	Creates a animated mesh entity particle emitter.
	ARGUMENTS:	Particle system, entity and iPARTICLE_SETTINGS array.
	RETURNS:	iEMITTER handle. 

# function iCreateFadeOutAffector( byval particle_system as iPARTICLE_SYSTEM, byval fade_speed as uinteger, byval fade_to_red as uinteger, byval fade_to_green as uinteger, byval fade_to_blue as uinteger ) as iAffector

    DEFINITION:	Creates a fading affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. 

# function iCreateGravityAffector( ByVal particle_system As iPARTICLE_SYSTEM, ByVal x As Single, ByVal y As Single, ByVal z As Single, ByVal timeForceLost As uInteger = 1000 ) as iAffector

    DEFINITION:	Creates a gravity affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. 

# function iCreateAttractionAffector( ByVal particle_system As iPARTICLE_SYSTEM, ByVal x As Single, ByVal y As Single, ByVal z As Single, ByVal speed As Single = 1.0, ByVal attract as uinteger = 1, ByVal affectX as uinteger = 1, ByVal affectY as uinteger = 1, ByVal affectZ as uinteger = 1 ) as iAffector

    DEFINITION:	Creates a attracting affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. 

# function iCreateRotationAffector( ByVal particle_system As iPARTICLE_SYSTEM, ByVal Speed_X As Single, ByVal Speed_Y As Single, ByVal Speed_Z As Single, ByVal pivot_X As Single, ByVal pivot_Y As Single, ByVal pivot_Z As Single ) as iAffector

    DEFINITION:	Creates a rotation affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. 

# function iCreateStopAffector( ByVal particle_system As iPARTICLE_SYSTEM,ByVal run_time as uinteger, ByVal target_emitter as iEMITTER ) as iAffector

    DEFINITION:	Creates a stop affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. 

# function iCreatePushAffector(ByVal particle_system as iPARTICLE_SYSTEM,ByVal x as single, ByVal y as single, ByVal z as single, ByVal speedX as single, ByVal speedY as single, ByVal speedZ as single, ByVal far as single, ByVal near as single, ByVal column as single, ByVal radial as integer ) as iAffector

    DEFINITION:	Creates a push affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. 

# function iCreateColorAffector(ByVal particle_system as iPARTICLE_SYSTEM, ByVal num as uinteger, ByVal particlecolors as uinteger ptr, ByVal particletimes as uinteger ptr, byVal smooth as uinteger ) as iAffector

    DEFINITION:	Creates a color affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. 

# function iCreateSplineAffector(ByVal particle_system as iPARTICLE_SYSTEM,ByVal VertexCount as uinteger, ByVal verticies as iVERTEX ptr,ByVal speed as single,ByVal tightness as single,ByVal attraction as single, ByVal deleteAtEnd as uinteger ) as iAffector

    DEFINITION:	Creates a spline affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. 

# sub iFreeAffectors( byval particle_system as iPARTICLE_SYSTEM )

    DEFINITION:	Free's all the Affectors applied to the specified iPARTICLE_SYSTEM.
	ARGUMENTS:	Particle system.
	RETURNS:	None. 

# sub iEmitterDirection( byval emitter As iEMITTER, byval x as single, byval y as single, byval z as single )

    DEFINITION:	Sets the direction of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. 

# sub iEmitterMinPPS( byval emitter As iEMITTER, byval minPPS as uinteger )

    DEFINITION:	Sets the minimum particles per second of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. 

# sub iEmitterMaxPPS( byval emitter As iEMITTER, byval maxPPS as uinteger )

    DEFINITION:	Sets the maximum particles per second of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. 

# sub iEmitterMinStartColor( byval emitter As iEMITTER, byval Red as uinteger, byval Green as uinteger, byval Blue as uinteger )

    DEFINITION:	Sets the minimum start color of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. 

# sub iEmitterMaxStartColor( byval emitter As iEMITTER, byval Red as uinteger, byval Green as uinteger, byval Blue as uinteger )

    DEFINITION:	Sets the maximum start color of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. 

# sub iAffectorEnable( byval affector as iAffector, byval enable as uinteger )

    DEFINITION:	Enables or disables the specified iAFFECTOR.
	ARGUMENTS:	iAFFECTOR and TRUE or FALSE.
	RETURNS:	None. 

# sub iFadeOutAffectorTime( byval affector as iAffector, byval fade_speed as single )

    DEFINITION:	Sets a fade affectors fade time.
	ARGUMENTS:	iAFFECTOR and speed.
	RETURNS:	None. 

# sub iFadeOutAffectorTargetColor( byval affector as iAffector, byval fade_to_red as uinteger, byval fade_to_green as uinteger, byval fade_to_blue as uinteger )

    DEFINITION:	Sets a fade affectors target fade color.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. 

# sub iGravityAffectorDirection( byval affector as iAffector, byval x as single, byval y as single, byval z as single )

    DEFINITION:	Sets the direction of a gravity affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. 

# sub iGravityAffectorTimeForceLost( byval affector as iAffector, byval time_Force_Lost as single )

    DEFINITION:	Sets the fade of force of a gravity affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. 

# sub iAttractionAffectorAffectX( byval affector as iAffector, byval affect_x as uinteger )

    DEFINITION:	Sets an attraction affectors X value.
	ARGUMENTS:	iAFFECTOR and X value.
	RETURNS:	None. 

# sub iAttractionAffectorAffectY( byval affector as iAffector, byval affect_y as uinteger )

    DEFINITION:	Sets an attraction affectors Y value.
	ARGUMENTS:	iAFFECTOR and Y value.
	RETURNS:	None. 

# sub iAttractionAffectorAffectZ( byval affector as iAffector, byval affect_z as uinteger )

    DEFINITION:	Sets an attraction affectors Z value.
	ARGUMENTS:	iAFFECTOR and Z value.
	RETURNS:	None. 

# sub iAttractionAffectorAttract( byval affector as iAffector, byval attract as uinteger )

    DEFINITION:	Sets an attraction affectors attract value.
	ARGUMENTS:	iAFFECTOR and attract value.
	RETURNS:	None. 

# sub iAttractionAffectorPoint( byval affector as iAffector, byval x as single, byval y as single, byval z as single )

    DEFINITION:	Sets an attraction affectors point value.
	ARGUMENTS:	iAFFECTOR and X,Y and Z point in 3D space.
	RETURNS:	None. 

# sub iRotationAffectorPivotPoint( byval affector as iAffector, byval x as single, byval y as single, byval z as single )

    DEFINITION:	Sets the pivot point of the specified rotation affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. 

# sub iMaxDistanceOfEffect( byval affector as iAffector, byval NewDistance as single )

    DEFINITION:	Sets the maximum distance of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. 

# sub iMinDistanceOfEffect( byval affector as iAffector, byval NewDistance as single )

    DEFINITION:	Sets the minimum distance of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. 

# sub iColumnDistanceOfEffect( byval affector as iAffector, byval NewDistance as single )

    DEFINITION:	Sets the column distance of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. 

# sub iCenterOfEffect( byval affector as iAffector, byval x as single, byval y as single, byval z as single )

    DEFINITION:	Sets the center of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. 

# sub iStrengthOfEffect( byval affector as iAffector, byval x as single, byval y as single, byval z as single )

    DEFINITION:	Sets the strength of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. 

# function iCreateBoxEmitter(byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER

    DEFINITION:	Creates a box style emitter for the specified particle system.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	iEMITTER handle. 

# sub iBoxEmitterSize(byval emitter as iEMITTER,byval sx as single,byval sy as Single,byval sz as Single)

    DEFINITION:	Sets the size of the specified BOX iEMITTER.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	None. 

# function iCreateCylinderEmitter(byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER

    DEFINITION:	Creates a cylinder style emitter for the specified particle system.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	iEMITTER handle. 

# sub iCylinderEmitterCenter(byval emitter as iEMITTER,byval x as Single,byval y as Single,byval z as Single)

    DEFINITION:	Sets the center point of the specified CYLINDER iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. 

# sub iCylinderEmitterRadius(byval emitter as iEMITTER,byval radius as Single)

    DEFINITION:	Sets the radius of the specified CYLINDER iEMITTER.
	ARGUMENTS:	iEMITTER and radius.
	RETURNS:	None. 

# sub iCylinderEmitterLength(byval emitter as iEMITTER,byval length as Single)

    DEFINITION:	Sets the length of the specified CYLINDER iEMITTER.
	ARGUMENTS:	iEMITTER and length.
	RETURNS:	None. 

# function iCreateMeshEmitter(byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER

    DEFINITION:	Creates a mesh style emitter for the specified particle system.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	iEMITTER handle. 

# sub iMeshEmitterMesh(byval emitter as iEMITTER,byval meshEntity as iEntity)

    DEFINITION:	Sets the for the specified MESH iEMITTER.
	ARGUMENTS:	iEMITTER and MESH iENTITY.
	RETURNS:	None. 

# sub iMeshEmitterEveryVertex(byval emitter as iEMITTER,byval allMeshVertex as Boolean)

    DEFINITION:	Enables an emitter at every vertex of the specified MESH iEMITTER.
	ARGUMENTS:	iEMITTER and TRUE or FALSE.
	RETURNS:	None. 

# function iCreateRingEmitter(byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER

    DEFINITION:	Creates a ring style emitter for the specified particle system.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	iEMITTER handle. 

# sub iRingEmitterCenter(byval emitter as iEMITTER,byval x as Single,byval y as Single,byval z as Single)

    DEFINITION:	Sets the center point of the specified RING iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. 

# sub iRingEmitterRadius(byval emitter as iEMITTER,byval radius as Single)

    DEFINITION:	Sets the radius of the specified RING iEMITTER.
	ARGUMENTS:	iEMITTER and radius.
	RETURNS:	None. 

# sub iRingEmitterThickness(byval emitter as iEMITTER,byval ringThickness as Single)

    DEFINITION:	Sets the ring thickness of the specified RING iEMITTER.
	ARGUMENTS:	iEMITTER and thickness.
	RETURNS:	None. 

# function iCreatePivot(byval parent as iEntity=0) as iEntity

    DEFINITION:	Creates and empty iENTITY.
	ARGUMENTS:	Parent if needed.
	RETURNS:	iENTITY handle. 

# function iCreateNamedVSC( byval shader as iSHADER ptr, byval const_name as zstring ptr, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer

    DEFINITION:	Create a named vertex shader constant.
	ARGUMENTS:	See definition.	
	RETURNS:	TRUE or FALSE. 

# function iCreateNamedPSC( byval shader as iSHADER ptr, byval const_name as zstring ptr, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer

    DEFINITION:	Create a named pixel shader constant.
	ARGUMENTS:	See definition.	
	RETURNS:	TRUE or FALSE. 

# function iCreateAddressedVSC( byval shader as iSHADER ptr, byval const_address as integer, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer

    DEFINITION:	Create an addressed vertex shader constant.
	ARGUMENTS:	See definition.	
	RETURNS:	TRUE or FALSE. 

# function iCreateAddressedPSC( byval shader as iSHADER ptr, byval const_address as integer, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer

    DEFINITION:	Create an addressed pixel shader constant.
	ARGUMENTS:	See definition.	
	RETURNS:	TRUE or FALSE. 

# function iAddHLSMaterial( byval vertex_program as zstring ptr, byval vertex_start_function as zstring ptr, byval vertex_prog_type as uinteger, byval pixel_program as zstring ptr, byval pixel_start_function as zstring ptr, byval pixel_prog_type as uinteger, byval material_type as uinteger ) as iSHADER ptr

    DEFINITION:	Adds a new material renderer to the VideoDriver, based on a high level shading language.
	ARGUMENTS:	See definition.	
	RETURNS:	Shader pointer. 

# function iLoadHLSMaterial( byval vertex_program_filename as zstring ptr, byval vertex_start_function as zstring ptr, byval vertex_prog_type as uinteger, byval pixel_program_filename as zstring ptr, byval pixel_start_function as zstring ptr, byval pixel_prog_type as uinteger, byval material_type as uinteger ) as iSHADER ptr

    DEFINITION:	Loads a new material renderer to the VideoDriver, based on a high level shading language.
	ARGUMENTS:	See definition.	
	RETURNS:	Shader pointer. 

# function iAddShaderMaterial( byval vertex_program as zstring ptr, byval pixel_program as zstring ptr, byval material_type as uinteger ) as iSHADER ptr

    DEFINITION:	Adds a new material renderer to the VideoDriver, using pixel and/or vertex shaders to render geometry.
	ARGUMENTS:	See definition.	
	RETURNS:	Shader pointer. 

# function iLoadShaderMaterial( byval vertex_program_filename as zstring ptr, byval pixel_program_filename as zstring ptr, byval material_type as uinteger ) as iSHADER ptr

    DEFINITION:	Loads a new material renderer to the VideoDriver, using pixel and/or vertex shaders to render geometry.
	ARGUMENTS:	See definition.	
	RETURNS:	Shader pointer. 

# sub iApplyShaderEntity(byval shader_reply as iSHADER ptr,byval entity as iEntity)

    DEFINITION:	Applies the specified shader to the specified entity.
	ARGUMENTS:	See definition.	
	RETURNS:	None. 

# sub iApplyShaderMaterial(byval shader_reply as iSHADER ptr,byval entity as iEntity,byval index as UInteger)

    DEFINITION:	Applies the specified shader to the specified entity at the specified material index.
	ARGUMENTS:	See definition.	
	RETURNS:	None. 

# sub iShadowColor(byval r as UInteger,byval g as UInteger,byval b as UInteger,byval alpha as UInteger)

    DEFINITION:	Sets the shadow color for the engine's stencile shadow system.
	ARGUMENTS:	RGBA of the shadows.	
	RETURNS:	None. 

# sub iLightCastShadows(byval light as iLight,byval castShadows as Boolean = true)

    DEFINITION:	Sets the specified iLIGHT to cast shadows.
	ARGUMENTS:	iLIGHT and TRUE or FALSE.	
	RETURNS:	None. 

# function iEntityCastShadow(byval entity as iEntity) as iSHADOW

    DEFINITION:	Sets the specified iENTITY to cast shadows.
	ARGUMENTS:	iENTITY.	
	RETURNS:	iSHADOW handle. 

# function iGetEntityShadow(byval entity as iEntity) as iSHADOW

    DEFINITION:	Gets the specified iENTITY shadow if it exists.
	ARGUMENTS:	iENTITY.	
	RETURNS:	iSHADOW handle or NULL. 

# function iEntityFreeShadow(byval entity as iEntity,byval shadowEntity as iSHADOW) as Boolean

    DEFINITION:	Frees the specified iENTITY's and iSHADOW.
	ARGUMENTS:	iENTITY and iSHADOW.	
	RETURNS:	TRUE on success. 

# sub iSetShadowMesh(byval shadowEntity as iSHADOW)

    DEFINITION:	Sets a default mesh shadow.
	ARGUMENTS:	iSHADOW.	
	RETURNS:	None. 

# function iLoadSprite(byval file as ZString ptr,byval fixedpitch as boolean=false,byval parent as iEntity=0) as iSPRITE

    DEFINITION:	Loads a sprite entity.
	ARGUMENTS:	Sprite file, true or false for fixed pitch and parent.
	RETURNS:	iSPRITE. 

# function iCreateSprite(byval fixedpitch as boolean=false, byval parent as iEntity=0) as iSPRITE

    DEFINITION:	Creates a sprite entity.
	ARGUMENTS:	True or false for fixed pitch and parent.
	RETURNS:	iSPRITE. 

# sub iScaleSprite(byval sprite as iSPRITE,byval w as Single,byval h as Single)

    DEFINITION:	Scales a sprite entity.
	ARGUMENTS:	New width and height.
	RETURNS:	None. 

# sub iSpriteColor(byval sprite as iSPRITE,byval r as UInteger,byval g as UInteger,byval b as UInteger)

    DEFINITION:	Change color of a sprite entity.
	ARGUMENTS:	Red, blue and green.
	RETURNS:	None. 

# sub iRenderSprite(byval sprite as iSPRITE)

    DEFINITION:	Force renders a sprite entity.
	ARGUMENTS:	iSPRITE.
	RETURNS:	None. 

# function iCreateTiledTerrain( byval image as iIMAGE, byval tilesize as UInteger, byval datax as UInteger, byval datay as UInteger, byval parent as iEntity=0) as iTerrain

    DEFINITION:	Creates a tiled terrain.
	ARGUMENTS:	Tiled terrain parameters.
	RETURNS:	iTERRAIN handle. 

# sub iAttachTile(byval terrain as iTerrain,byval neighbor as iTerrain,byval edge as TERRAIN_EDGE)

    DEFINITION:	Attaches a tiled terrain.
	ARGUMENTS:	Tiled terrains and edge(TOP_EDGE 0, BOTTOM_EDGE 1, LEFT_EDGE 2, RIGHT_EDGE 3).
	RETURNS:	None. 

# sub iLoadTileStructure( byval terrain as iTerrain, byval image as iImage, byval dataX as integer = 0, byval dataY as integer = 0 )

    DEFINITION:	Load the height and UV data from an image.
	ARGUMENTS:	The terrain and parameters.
	RETURNS:	None. 

# sub iLoadTileColor( byval terrain as iTerrain, byval image as iImage, byval dataX as integer = 0, byval dataY as integer = 0 )

    DEFINITION:	Load the vertex color information of a tile.
	ARGUMENTS:	The terrain and parameters.
	RETURNS:	None. 

# function iLoadTerrain( byval path as zstring ptr, byval parent as iEntity=0 ) as iTERRAIN

    DEFINITION:	Load a terrain frome a heightmap file.
	ARGUMENTS:	Path to file and parent if needed.
	RETURNS:	iTERRAIN handle. 

# function iTerrainHeight( byval terrain as iTerrain,byval x as single, byval z as single) as single

    DEFINITION:	Gets the height of a point on the specified terrain.
	ARGUMENTS:	The terrain and parameters.
	RETURNS:	Terrain height. 

# function iCreateTerrain( byval parent as iEntity=0) as iTerrain

    eclare function iCreateTerrain( byval file as zstring ptr,byval patchSize as ETPS_TERRAIN_PATCH_SIZE=ETPS_17,byval parent as iEntity=0) as iTerrain
	DEFINITION:	Creates a terrain.
	ARGUMENTS:	Terrain parameters.
	RETURNS:	iTERRAIN handle. 

# sub iScaleTerrainTexture( byval terrain as iTerrain, byval X as single, byval Y as single, byval tType as TERRAIN_TYPE=TERRAIN_NORMAL )

    DEFINITION:	Scales the texture of the specified terrain.
	ARGUMENTS:	Terrain, scale and terrain type (TERRAIN_NORMAL, TERRAIN_SPHERICAL or TERRAIN_TILED).
				* TERRAIN TYPE MUST BE CORRECT OR WILL CRASH WITHOUT NOTICE!
	RETURNS:	None. 

# function iCreateSphericalTerrain( byval topPath as zstring ptr, byval frontPath as zstring ptr, byval backPath as zstring ptr, byval leftPath as zstring ptr, byval rightPath as zstring ptr, byval bottomPath as zstring ptr, byval parent as iEntity=0) as iTerrain

    DEFINITION:	Creates a spherical terrain.
	ARGUMENTS:	Paths to terrain faces and parent if needed.
	RETURNS:	iTERRAIN handle. 

# sub iSphericalTerrainTexture( byval terrain as iTerrain, byval topTexture as iTexture, byval frontTexture as iTexture, byval backTexture as iTexture, byval leftTexture as iTexture, byval rightTexture as iTexture, byval bottomTexture as iTexture, byval materialIndex as uinteger )

    DEFINITION:	Applies textures to a spherical terrains faces.
	ARGUMENTS:	Spherical terrain and patchs to textures.
	RETURNS:	None. 

# sub iSphericalTerrainVertexColor( byval terrain as iTerrain, byval topImage as iImage, byval frontImage as iImage, byval backImage as iImage, byval leftImage as iImage, byval rightImage as iImage, byval bottomImage as iImage )

    DEFINITION:	Applies textures to a spherical terrains faces.
	ARGUMENTS:	Spherical terrain and paths to textures.
	RETURNS:	None. 

# function iSphericalTerrainSurfaceX( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single

    DEFINITION:	Gets the X value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	X value. 

# function iSphericalTerrainSurfaceY( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single

    DEFINITION:	Gets the Y value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	Y value. 

# function iSphericalTerrainSurfaceZ( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single

    DEFINITION:	Gets the Z value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	Z value. 

# function iSphericalTerrainAngleRX( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single

    DEFINITION:	Gets the X rotation angle of a spherical terrain.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	X rotation angle value. 

# function iSphericalTerrainAngleRY( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single

    DEFINITION:	Gets the Y rotation angle of a spherical terrain.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	Y rotation angle value. 

# function iSphericalTerrainAngleRZ( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single

    DEFINITION:	Gets the Z rotation angle of a spherical terrain.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	Z rotation angle value. 

# function iSphericalSurfaceLogicalX( byval terrain as iTerrain, byval X as single, byval Y as single, byval Z as single, byref face as integer) as Single

    DEFINITION:	Gets the logical X value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X,Y and Z.
	RETURNS:	Logical X value. 

# function iSphericalSurfaceLogicalZ( byval terrain as iTerrain, byval X as single, byval Y as single, byval Z as single, byref face as integer) as Single

    DEFINITION:	Gets the logical Z value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X,Y and Z.
	RETURNS:	Logical Z value. 

# function iLoadFont(byval fontfile as ZString ptr) as iFont

    DEFINITION:	Loads an XML font file.
	ARGUMENTS:	Path to XML file.
	RETURNS:	iFONT handle. 

# sub iSetFont(byval font as iFont)

    DEFINITION:	Sets the active font.
	ARGUMENTS:	iFONT handle.
	RETURNS:	None. 

# function iTextLen(byval text as ZString ptr) as UInteger

    DEFINITION:	Gets the lenght of the specified text.
	ARGUMENTS:	Text.
	RETURNS:	Length. 

# sub iText(byval x as UInteger,byval y as UInteger,byval text as zString ptr,byval hcenter as Boolean=false,byval vcenter as Boolean=false)

    DEFINITION:	Draws text to the backbuffer.
	ARGUMENTS:	Location, text and parameters.
	RETURNS:	None. 

# function iFontWidth() as UInteger

    DEFINITION:	Gets the width of the active font.
	ARGUMENTS:	None.
	RETURNS:	Font width. 

# function iFontHeight() as UInteger

    DEFINITION:	Gets the height of the active font.
	ARGUMENTS:	None.
	RETURNS:	Font height. 

# sub iColor(byval r as UInteger,byval g as uinteger,byval b as UInteger,byval a as UInteger=255)

    DEFINITION:	Sets the active color for text and drawing.
	ARGUMENTS:	RGBA.
	RETURNS:	None. 

# sub iTextureCreateFlag(byval flag as ETCF_TEXTURE_CREATION_FLAG,byval enable as Boolean)

    DEFINITION:	Modify the engine's texture creation flags.
	ARGUMENTS:	ETCF_TEXTURE_CREATION_FLAG and TRUE or FALSE.
	RETURNS:	None. 

# function iCreateTexture(byval tname as ZString ptr,byval x as uinteger,byval y as UInteger,byval format as ECF_COLOR_FORMAT=ECF_A8R8G8B8) as iTEXTURE

    DEFINITION:	Creates a new texture.
	ARGUMENTS:	Name, dimensions and ECF_COLOR_FORMAT.
	RETURNS:	iTEXTURE handle. 

# function iLoadTexture(byval file as ZString ptr) as iTEXTURE

    DEFINITION:	Loads a texture into memory.
	ARGUMENTS:	Path to texture.
	RETURNS:	iTEXTURE handle. 

# function iCreateRenderTexture(byval x as UInteger,byval y as UInteger) as iTEXTURE

    DEFINITION:	Creates a new texture capable of being rendered to.
	ARGUMENTS:	Dimensions.
	RETURNS:	iTEXTURE handle. 

# sub iDrawTexture(byval texture as iTEXTURE,byval iX as Integer,byval iY as Integer)

    DEFINITION:	Draws a texture to the screen.
	ARGUMENTS:	iTEXTURE handle and location.
	RETURNS:	None. 

# sub iDrawTextureScale(byval texture as iTEXTURE,byval dTX as Integer,byval dTY as Integer,byval dBX as Integer,byval dBY as Integer, byval TX as Integer,byval TY as Integer,byval BX as Integer,byval BY as Integer,byval useAlpha as Boolean)

    DEFINITION:	Draws and scales a texture to the screen.
	ARGUMENTS:	iTEXTURE handle and coordinates.
	RETURNS:	None. 

# sub iRenderToTexture(byval renderTarget as iTEXTURE,byval clearBackBuffer as Boolean=TRUE,byval clearZBuffer as Boolean=TRUE)

    DEFINITION:	Sets the specified texture as the render target, renders the scene then returns target to back buffer.
	ARGUMENTS:	Texture, clear back buffer and clear z buffer.	
	RETURNS:	None. 

# sub iRenderTargetTexture(byval renderTarget as iTEXTURE,byval alpha as UInteger=255,byval clearBackBuffer as Boolean=true,byval clearZBuffer as Boolean=true)

    DEFINITION:	Sets the specified texture as the render target.
				* MUST USE iRenderTargetTexture( NULL ) after operations to return render target to back buffer!
	ARGUMENTS:	Texture, alpha, clear back buffer and clear z buffer.	
	RETURNS:	None. 

# sub iFreeTexture(byval texture as iTEXTURE)

    DEFINITION:	Frees the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	None. 

# function iTextureBlend(byval texDest as iTEXTURE,byval texSrc as iTEXTURE,byval xoffset as Integer,byval yoffset as Integer, byval operation as integer) as UInteger

    DEFINITION:	Blends texturesrc to texturedest.
	ARGUMENTS:	Operation: BLEND_SCREEN, BLEND_ADD, BLEND_SUBTRACT, BLEND_MULTIPLY or BLEND_DIVIDE.	
	RETURNS:	0 on success, 1 Incompatible texture types or 2 Unsupported texture format. 

# sub iScaleEntityTexture(byval texture as iTEXTURE,byval sx as Single,byval sy as Single,byval index as uinteger=0)

    DEFINITION:	Scales a texture, globaly.
	ARGUMENTS:	iTEXTURE, size and index.	
	RETURNS:	None. 

# function iTextureWidth(byval texture as iTEXTURE) as UInteger

    DEFINITION:	Gets the width of the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	iTEXTURE width. 

# function iTextureHeight(byval texture as iTEXTURE) as UInteger

    DEFINITION:	Gets the height of the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	iTEXTURE height. 

# sub iMaskTexture(byval texture as iTEXTURE,byval r as UInteger,byval g as UInteger,byval b as UInteger,byval alpha as UInteger=0)

    DEFINITION:	Applies mask to specified texture and color.
	ARGUMENTS:	iTEXTURE and RGBA.	
	RETURNS:	None. 

# function iLockTexture(byval texture as iTEXTURE) as UInteger

    DEFINITION:	Locks a texture for manipulation.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	True on success. 

# sub iUnlockTexture(byval texture as iTEXTURE)

    DEFINITION:	Unlocks a texture for manipulation.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	None. 

# sub iNormalMapTexture(byval texture as iTEXTURE,byval amplitude as Single)

    DEFINITION:	Converts the specified texture to a normal texture.
	ARGUMENTS:	iTEXTURE and strength.	
	RETURNS:	None. 

# sub iPositionTexture(byval entity as iEntity,byval x as single,byval y as Single,byval matIndex as UInteger=0,byval texIndex as UInteger=0)

    DEFINITION:	Changes the position of the texture on the specified entity.
	ARGUMENTS:	iENTITY location and index.	
	RETURNS:	None. 

# sub iAngleTexture(byval entity as iEntity,byval radAngle as Single,byval matIndex as UInteger,byval texIndex as UInteger)

    DEFINITION:	Changes the rotation of the texture on the specified entity.
	ARGUMENTS:	iENTITY angle and index.	
	RETURNS:	None. 

# sub iScaleTexture(byval entity as iEntity,byval sx as single,byval sy as Single,byval matIndex as UInteger=0,byval texIndex as UInteger=0)

    DEFINITION:	Scales a texture of the specified entity.
	ARGUMENTS:	iENTITY, location and index.	
	RETURNS:	None. 

# function iFlipTexture(byval texture as iTEXTURE) as boolean

    DEFINITION:	Flips the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	TRUE on success. 

# function iCopyTexture(byval texture as iTEXTURE) as iTEXTURE

    DEFINITION:	Copies the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	iTEXTURE handle. 

# function iSaveTexture(byval texture as iTEXTURE,byval filename as ZString ptr) as boolean

    DEFINITION:	Saves the specified texture to file.
	ARGUMENTS:	iTEXTURE and filename.	
	RETURNS:	TRUE on success. 

