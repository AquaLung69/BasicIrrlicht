## ----------------------------------------------------------------------------
## 					IRRKLANG CONSTANTS
## ----------------------------------------------------------------------------
#E_SOUND_OUTPUT_DRIVER
ESOD_AUTO_DETECT 						= 0			# Auto detects the best sound driver for the system
ESOD_DIRECT_SOUND 					    = 1			# DirectSound sound output driver, windows only
ESOD_NULL 							    = 2			# Null driver, creating no sound output
ESOD_COUNT 							    = 3			# Amount of built-in sound engine types
ESOD_FORCE_32_BIT	 					= 0x7fffffff

#E_SOUND_ENGINE_OPTIONS
ESEO_MULTI_THREADED 					= 1
ESEO_MUTE_IF_NOT_FOCUSED 				= 2
ESEO_LOAD_PLUGINS 					    = 4
ESEO_USE_3D_BUFFERS 					= 8
ESEO_PRINT_DEBUG_INFO_TO_DEBUGGER		= 16
ESEO_LINEAR_ROLLOFF 					= 32
ESEO_DEFAULT_OPTIONS 					= 29
ESEO_FORCE_32_BIT 					    = 0x7fffffff

#E_STREAM_MODE
ESM_AUTO_DETECT 						= 0
ESM_STREAMING 						    = 1
ESM_NO_STREAMING 						= 2
ESM_FORCE_32_BIT 						= 0x7fffffff
