'	.----.  .--.  .----.-.----.           
'	| {_} }/ {} \{ {__-{ | }`-'           
'	| {_} /  /\  .-._} | | },-.           
'	.-.---..---..-.--.-.----.-. .-.-----. 
'	{ } }}_} }}_} |  { | }`-{ {_} `-' '-' 
'	| | } \| } \} '--| | },-| { } } } {   
'	`-`-'-'`-'-'`----`-`----`-' `-' `-'   
'----------------------------------------------------------------------------
'	Basic-Irrlicht Wrapper coded by EM ENGINEERING 2019-2024
'	Irrlicht3D 
'	IrrKlang
'	Raknet
'----------------------------------------------------------------------------
' This software is provided 'as-is', without any express Or implied
' warranty.  In no event will the authors be held liable For any damages
' arising from the use of this software.
' Permission is granted To anyone To use this software For any purpose,
' including commercial applications, And To alter it And redistribute it
' freely, subject To the following restrictions:
' 1. The Origin of this software must Not be misrepresented; you must Not
'    claim that you wrote the original software. If you use this software
'    in a product, an acknowledgement in the product documentation would be
'    appreciated but is Not required.
' 2. Altered source versions must be clearly marked as such, And must Not be
'    misrepresented as being the original software.
' 3. This notice may Not be removed Or altered from any source distribution.
'----------------------------------------------------------------------------
#ifndef __FB_64BIT__
	#inclib "BasicIrrlicht"
	#inclib "Irrlicht"
	#inclib "irrKlang" 
#else
	#inclib "BasicIrrlicht64"  
	#inclib "Irrlicht64"
	#inclib "irrKlang64"
#endif

'----------------------------------------------------------------------------
'  Constants
'----------------------------------------------------------------------------
'#ifndef NULL
'	#define NULL cptr(any ptr,0)
'#endif
CONST NULL = 0
CONST PI as double = 3.141592653589793



'----------------------------------------------------------------------------
'  Enumerations
'----------------------------------------------------------------------------
' GUI Button Image States
ENUM EGUI_BUTTON_IMAGE_STATE
	EGBIS_IMAGE_UP =0
	EGBIS_IMAGE_UP_MOUSEOVER
	EGBIS_IMAGE_UP_FOCUSED
	EGBIS_IMAGE_UP_FOCUSED_MOUSEOVER
	EGBIS_IMAGE_DOWN
	EGBIS_IMAGE_DOWN_MOUSEOVER
	EGBIS_IMAGE_DOWN_FOCUSED
	EGBIS_IMAGE_DOWN_FOCUSED_MOUSEOVER
	EGBIS_IMAGE_DISABLED
	EGBIS_COUNT
END ENUM

' GUI Button States
ENUM EGUI_BUTTON_STATE
	EGBS_BUTTON_UP = 0
	EGBS_BUTTON_DOWN
	EGBS_BUTTON_MOUSE_OVER
	EGBS_BUTTON_MOUSE_OFF
	EGBS_BUTTON_FOCUSED
	EGBS_BUTTON_NOT_FOCUSED
	EGBS_COUNT
END ENUM
	
' Spherical Terrain Faces
ENUM TERRAIN_FACE
	TOP_FACE = 0
	FRONT_FACE
	BACK_FACE
	LEFT_FACE
	RIGHT_FACE
	BOTTOM_FACE
END ENUM

' Tile Terrain Edges
ENUM TERRAIN_EDGE
	TOP_EDGE = 0
	BOTTOM_EDGE
	LEFT_EDGE
	RIGHT_EDGE
END ENUM

ENUM ELOG_LEVEL
	ELL_DEBUG = 0
	ELL_INFORMATION
	ELL_WARNING
	ELL_ERROR
	ELL_NONE
end enum

ENUM TERRAIN_TYPE
	TERRAIN_NORMAL = 0
	TERRAIN_SPHERICAL
	TERRAIN_TILED
end enum

ENUM E_CULLING_TYPE
    EAC_OFF            	= 0
    EAC_BOX            	= 1
    EAC_FRUSTUM_BOX    	= 2
    EAC_FRUSTUM_SPHERE 	= 4
	EAC_OCC_QUERY 		= 8
END ENUM

ENUM ESNT_NODE_TYPES
   ESNT_NONE = 0
   ESNT_SCENE_MANAGER
   ESNT_CUBE
   ESNT_SPHERE
   ESNT_TEXT
   ESNT_WATER_SURFACE
   ESNT_TERRAIN
   ESNT_SKY_BOX
   ESNT_SKY_DOME
   ESNT_SHADOW_VOLUME
   ESNT_OCTREE
   ESNT_MESH
   ESNT_LIGHT
   ESNT_EMPTY
   ESNT_DUMMY_TRANSFORMATION
   ESNT_CAMERA
   ESNT_BILLBOARD
   ESNT_ANIMATED_MESH
   ESNT_PARTICLE_SYSTEM
   ESNT_Q3SHADER_SCENE_NOD
   ESNT_MD3_SCENE_NODE
   ESNT_VOLUME_LIGHT
   ESNT_CAMERA_MAYA
   ESNT_CAMERA_FPS
   ESNT_UNKNOWN
   ESNT_ANY
   ESNT_CLOUD_LAYER
   ESNT_SHADER_WATER
END ENUM

ENUM EMF_MATERIAL_FLAG
   EMF_WIREFRAME = 0
   EMF_POINTCLOUD  
   EMF_GOURAUD_SHADING  
   EMF_LIGHTING 
   EMF_ZBUFFER 
   EMF_ZWRITE_ENABLE
   EMF_BACK_FACE_CULLING
   EMF_FRONT_FACE_CULLING 
   EMF_BILINEAR_FILTER
   EMF_TRILINEAR_FILTER 
   EMF_ANISOTROPIC_FILTER 
   EMF_FOG_ENABLE
   EMF_NORMALIZE_NORMALS 
   EMF_TEXTURE_WRAP
   EMF_ANTI_ALIASING
   EMF_COLOR_MASK
   EMF_COLOR_MATERIAL
   EMF_USE_MIP_MAPS
   EMF_BLEND_OPERATION
   EMF_POLYGON_OFFSET
END ENUM

ENUM EMT_MATERIAL_TYPES
   EMT_SOLID = 0 
   EMT_SOLID_2_LAYER 
   EMT_LIGHTMAP  
   EMT_LIGHTMAP_ADD       
   EMT_LIGHTMAP_M2           
   EMT_LIGHTMAP_M4            
   EMT_LIGHTMAP_LIGHTING   
   EMT_LIGHTMAP_LIGHTING_M2    
   EMT_LIGHTMAP_LIGHTING_M4 
   EMT_DETAIL_MAP
   EMT_SPHERE_MAP  
   EMT_REFLECTION_2_LAYER 
   EMT_TRANSPARENT_ADD_COLOR 
   EMT_TRANSPARENT_ALPHA_CHANNEL  
   EMT_TRANSPARENT_ALPHA_CHANNEL_REF 
   EMT_TRANSPARENT_VERTEX_ALPHA  
   EMT_TRANSPARENT_REFLECTION_2_LAYER 
   EMT_NORMAL_MAP_SOLID 
   EMT_NORMAL_MAP_TRANSPARENT_ADD_COLOR 
   EMT_NORMAL_MAP_TRANSPARENT_VERTEX_ALPHA 
   EMT_PARALLAX_MAP_SOLID      
   EMT_PARALLAX_MAP_TRANSPARENT_ADD_COLOR 
   EMT_PARALLAX_MAP_TRANSPARENT_VERTEX_ALPHA 
   EMT_ONE_TEXTURE_BLEND
   EMT_FORCE_32BIT = &h7fffffff
END ENUM

ENUM EBF_BLEND_FACTOR
   EBF_ZERO = 0
   EBF_ONE
   EBF_DST_COLOR
   EBF_ONE_MINUS_DST_COLOR
   EBF_SRC_COLOR
   EBF_ONE_MINUS_SRC_COLOR
   EBF_SRC_ALPHA
   EBF_ONE_MINUS_SRC_ALPHA
   EBF_DST_ALPHA
   EBF_ONE_MINUS_DST_ALPHA
   EBF_SRC_ALPHA_SATURATE          
END ENUM

ENUM EMIE_MOUSE_EVENTS
	MOUSE_LEFT
	MOUSE_MIDDLE
	MOUSE_RIGHT
END ENUM

ENUM EMD2_ANIMATION_TYPE
   EMAT_STAND = 0
   EMAT_RUN
   EMAT_ATTACK
   EMAT_PAIN_A
   EMAT_PAIN_B
   EMAT_PAIN_C
   EMAT_JUMP
   EMAT_FLIP
   EMAT_SALUTE
   EMAT_FALLBACK
   EMAT_WAVE
   EMAT_POINT
   EMAT_CROUCH_STAND
   EMAT_CROUCH_WALK
   EMAT_CROUCH_ATTACK
   EMAT_CROUCH_PAIN
   EMAT_CROUCH_DEATH
   EMAT_DEATH_FALLBACK
   EMAT_DEATH_FALLFORWARD
   EMAT_DEATH_FALLBACKSLOW
   EMAT_BOOM
END ENUM

ENUM EMD3_ANIMATION_TYPE
   EMD3_BOTH_DEATH_1 = 0
   EMD3_BOTH_DEAD_1
   EMD3_BOTH_DEATH_2
   EMD3_BOTH_DEAD_2
   EMD3_BOTH_DEATH_3
   EMD3_BOTH_DEAD_3
   EMD3_TORSO_GESTURE
   EMD3_TORSO_ATTACK_1
   EMD3_TORSO_ATTACK_2
   EMD3_TORSO_DROP
   EMD3_TORSO_RAISE
   EMD3_TORSO_STAND_1
   EMD3_TORSO_STAND_2
   EMD3_LEGS_WALK_CROUCH
   EMD3_LEGS_WALK
   EMD3_LEGS_RUN
   EMD3_LEGS_BACK
   EMD3_LEGS_SWIM
   EMD3_LEGS_JUMP_1
   EMD3_LEGS_LAND_1
   EMD3_LEGS_JUMP_2
   EMD3_LEGS_LAND_2
   EMD3_LEGS_IDLE
   EMD3_LEGS_IDLE_CROUCH	
   EMD3_LEGS_TURN
   EMD3_ANIMATION_COUNT
END ENUM

ENUM EMD3_MODELS
	EEMD3_HEAD = 0
	EEMD3_UPPER
	EEMD3_LOWER
	EEMD3_WEAPON
	EEMD3_NUMMODELS
END ENUM

Enum ELT_LIGHT_TYPE
   ELT_POINT = 0
	ELT_SPOT
   ELT_DIRECTIONAL
End Enum

Enum JOINT_MODE
   JOINT_MODE_NONE = 0
   JOINT_MODE_READ
   JOINT_MODE_CONTROL
End Enum

Enum ESM_SHADOW_MODE
	ESM_RECEIVE = 0
	ESM_CAST
	ESM_BOTH
	ESM_EXCLUDE
	ESM_COUNT
End Enum

Enum EFT_FILTER_TYPE
	EFT_NONE = 0
	EFT_4PCF
	EFT_8PCF
	EFT_12PCF
	EFT_16PCF
	EFT_COUNT
End Enum

Enum SHADER_CONSTANTS
   NO_PRESET = 0
   INVERSE_WORLD
   WORLD_VIEW_PROJECTION
   CAMERA_POSITION
   TRANSPOSED_WORLD
End Enum

Enum VERTEX_SHADER_VERSION
   EVST_VS_1_1 = 0
   EVST_VS_2_0
   EVST_VS_2_a
   EVST_VS_3_0
End Enum

Enum PIXEL_SHADER_VERSION
	EPST_PS_1_1 = 0
	EPST_PS_1_2
	EPST_PS_1_3
	EPST_PS_1_4
	EPST_PS_2_0
	EPST_PS_2_a
	EPST_PS_2_b
	EPST_PS_3_0
End Enum

Enum EVDF_VIDEO_FEATURE_QUERY
   EVDF_RENDER_TO_TARGET = 0
   EVDF_HARDWARE_TL   
   EVDF_MULTITEXTURE 
   EVDF_BILINEAR_FILTER         
   EVDF_MIP_MAP       
   EVDF_MIP_MAP_AUTO_UPDATE 
   EVDF_STENCIL_BUFFER   
   EVDF_VERTEX_SHADER_1_1   
   EVDF_VERTEX_SHADER_2_0   
   EVDF_VERTEX_SHADER_3_0  
   EVDF_PIXEL_SHADER_1_1  
   EVDF_PIXEL_SHADER_1_2  
   EVDF_PIXEL_SHADER_1_3  
   EVDF_PIXEL_SHADER_1_4 
   EVDF_PIXEL_SHADER_2_0 
   EVDF_PIXEL_SHADER_3_0
   EVDF_ARB_VERTEX_PROGRAM_1
   EVDF_ARB_FRAGMENT_PROGRAM_1
   EVDF_ARB_GLSL
   EVDF_HLSL
   EVDF_TEXTURE_NSQUARE
   EVDF_TEXTURE_NPOT
   EVDF_FRAMEBUFFER_OBJECT
   EVDF_VERTEX_BUFFER_OBJECT
   EVDF_ALPHA_TO_COVERAGE
   EVDF_COLOR_MASK
   EVDF_MULTIPLE_RENDER_TARGETS
   EVDF_MRT_BLEND
   EVDF_MRT_COLOR_MASK
   EVDF_MRT_BLEND_FUNC
   EVDF_GEOMETRY_SHADER
End Enum

Enum EMWT_MESH_FILE_FORMAT
   EMWT_IRR_MESH = 0   
   EMWT_COLLADA  
   EMWT_STL
	EMWT_OBJ
	EMWT_PLY	
End Enum

Enum ETPS_TERRAIN_PATCH_SIZE
	ETPS_9 			= 9  
	ETPS_17 			= 17 
	ETPS_33 			= 33  
	ETPS_65 			= 65  
	ETPS_129 		= 129 
End Enum

Enum ETCF_TEXTURE_CREATION_FLAG
   ETCF_ALWAYS_16_BIT          = &h1
   ETCF_ALWAYS_32_BIT          = &h2
   ETCF_OPTIMIZED_FOR_QUALITY  = &h4
   ETCF_OPTIMIZED_FOR_SPEED    = &h8
   ETCF_CREATE_MIP_MAPS        = &h10  
   ETCF_NO_ALPHA_CHANNEL       = &h20 
   ETCF_ALLOW_NON_POWER_2      = &h40
End Enum

Enum ECF_COLOR_FORMAT
   ECF_A1R5G5B5 = 0 
   ECF_R5G6B5 
   ECF_R8G8B8   
   ECF_A8R8G8B8 
End Enum

Enum TEXTURE_BLEND
   BLEND_SCREEN = 0
   BLEND_ADD
   BLEND_SUBTRACT
   BLEND_MULTIPLY
   BLEND_DIVIDE
End Enum

Enum ECM_COLOR_MATERIAL
   ECM_NONE = 0 
   ECM_DIFFUSE   
   ECM_AMBIENT 
   ECM_EMISSIVE  
   ECM_SPECULAR  
   ECM_DIFFUSE_AND_AMBIENT
End Enum

Enum EDS_DEBUG
   EDS_OFF 						= 0
   EDS_BBOX 					= 1
   EDS_NORMALS 					= 2
   EDS_SKELETON 				= 4
   EDS_MESH_WIRE_OVERLAY 		= 8
   EDS_HALF_TRANSPARENCY 		= 16
   EDS_BBOX_BUFFERS 			= 32
   EDS_FULL 					= &hffffffff
End Enum

enum EMBF_BUTTONS
   EMBF_OK 						= 1
   EMBF_CANCEL					= 2
   EMBF_YES						= 4
   EMBF_NO						= 8
end enum

enum EGUI_ALIGNMENT
	EGUIA_UPPERLEFT	= 0,		'Aligned to parent's top or left side (default)
	EGUIA_LOWERRIGHT,			'Aligned to parent's bottom or right side
	EGUIA_CENTER,				'Aligned to the center of parent
	EGUIA_SCALE					'Stretched to fit parent
end enum

Enum EGUI_EVENT_TYPE
   EGET_ELEMENT_FOCUS_LOST = 0,
   EGET_ELEMENT_FOCUSED
   EGET_ELEMENT_HOVERED
   EGET_ELEMENT_LEFT
   EGET_ELEMENT_CLOSED
   EGET_BUTTON_CLICKED
   EGET_SCROLL_BAR_CHANGED
   EGET_CHECKBOX_CHANGED
   EGET_LISTBOX_CHANGED
   EGET_LISTBOX_SELECTED_AGAIN
   EGET_FILE_SELECTED
   EGET_DIRECTORY_SELECTED
   EGET_FILE_CHOOSE_DIALOG_CANCELLED
   EGET_MESSAGEBOX_YES
   EGET_MESSAGEBOX_NO
   EGET_MESSAGEBOX_OK
   EGET_MESSAGEBOX_CANCEL
   EGET_EDITBOX_ENTER
   EGET_EDITBOX_CHANGED
   EGET_EDITBOX_MARKING_CHANGED
   EGET_TAB_CHANGED
   EGET_MENU_ITEM_SELECTED
   EGET_COMBO_BOX_CHANGED
   EGET_SPINBOX_CHANGED
   EGET_TABLE_CHANGED
   EGET_TABLE_HEADER_CHANGED
   EGET_TABLE_SELECTED_AGAIN
   EGET_TREEVIEW_NODE_DESELECT
   EGET_TREEVIEW_NODE_SELECT
   EGET_TREEVIEW_NODE_EXPAND
   EGET_TREEVIEW_NODE_COLLAPSE
   EGET_COUNT
End Enum

Enum EGUI_DEFAULT_COLOR
	EGDC_3D_DARK_SHADOW = 0 
	EGDC_3D_SHADOW 
	EGDC_3D_FACE    
	EGDC_3D_HIGH_LIGHT 
	EGDC_3D_LIGHT 
	EGDC_ACTIVE_BORDER  
	EGDC_ACTIVE_CAPTION  
	EGDC_APP_WORKSPACE    
	EGDC_BUTTON_TEXT    
	EGDC_GRAY_TEXT    
	EGDC_HIGH_LIGHT       
	EGDC_HIGH_LIGHT_TEXT     
	EGDC_INACTIVE_BORDER  
	EGDC_INACTIVE_CAPTION   
	EGDC_TOOLTIP  
	EGDC_TOOLTIP_BACKGROUND 
	EGDC_SCROLLBAR   
	EGDC_WINDOW  
	EGDC_WINDOW_SYMBOL   
	EGDC_ICON    
	EGDC_ICON_HIGH_LIGHT
	EGDC_GRAY_WINDOW_SYMBOL
	EGDC_EDITABLE
	EGDC_GRAY_EDITABLE
	EGDC_FOCUSED_EDITABLE
	EGDC_COUNT      
End Enum

ENUM EFT_FOG_TYPE
   EFT_FOG_EXP = 0
   EFT_FOG_LINEAR
   EFT_FOG_EXP2
end enum

Enum EKEY_CODE
	KEY_LBUTTON          = &H01 '1
	KEY_RBUTTON          = &H02 
	KEY_CANCEL           = &H03  
	KEY_MBUTTON          = &H04 
	KEY_XBUTTON1         = &H05 '5
	KEY_XBUTTON2         = &H06 
	KEY_BACK             = &H08 
	KEY_TAB              = &H09
	KEY_CLEAR            = &H0C '10
	KEY_RETURN           = &H0D '13
	KEY_SHIFT            = &H10  
	KEY_CONTROL          = &H11   
	KEY_MENU             = &H12 
	KEY_PAUSE            = &H13 
	KEY_CAPITAL          = &H14 '20 
	KEY_KANA             = &H15 
	KEY_HANGUEL          = &H15  
	KEY_HANGUL           = &H15 
	KEY_JUNJA            = &H17 
	KEY_FINAL            = &H18 
	KEY_HANJA            = &H19  
	KEY_KANJI            = &H19 
	KEY_ESCAPE           = &H1B '27
	KEY_CONVERT          = &H1C 
	KEY_NONCONVERT       = &H1D 
	KEY_ACCEPT           = &H1E 
	KEY_MODECHANGE       = &H1F  
	KEY_SPACE            = &H20 '32
	KEY_PRIOR            = &H21 
	KEY_NEXT             = &H22
	KEY_END              = &H23 
	KEY_HOME             = &H24 
	KEY_LEFT             = &H25  
	KEY_UP               = &H26  
	KEY_RIGHT            = &H27 
	KEY_DOWN             = &H28   
	KEY_SELECT           = &H29   
	KEY_PRINT            = &H2A  
	KEY_EXECUT           = &H2B  
	KEY_SNAPSHOT         = &H2C  
	KEY_INSERT           = &H2D 
	KEY_DELETE           = &H2E 
	KEY_HELP             = &H2F  
	KEY_0				= &H30  
	KEY_1				= &H31  
	KEY_2            	= &H32  
	KEY_3				= &H33 
	KEY_4				= &H34  
	KEY_5				= &H35  
	KEY_6				= &H36   
	KEY_7				= &H37 
	KEY_8				= &H38 
	KEY_9				= &H39 
	KEY_A				= &H41 
	KEY_B				= &H42 
	KEY_C				= &H43 
	KEY_D				= &H44  
	KEY_E				= &H45 
	KEY_F				= &H46 
	KEY_G				= &H47 
	KEY_H				= &H48   
	KEY_I				= &H49 
	KEY_J				= &H4A    
	KEY_K				= &H4B 
	KEY_L				= &H4C  
	KEY_M				= &H4D   
	KEY_N				= &H4E   
	KEY_O				= &H4F 
	KEY_P				= &H50 
	KEY_Q				= &H51  
	KEY_R				= &H52  
	KEY_S				= &H53  
	KEY_T				= &H54  
	KEY_U				= &H55 
	KEY_V				= &H56 
	KEY_W				= &H57 
	KEY_X				= &H58 
	KEY_Y				= &H59 
	KEY_Z				= &H5A 
	KEY_LWIN             = &H5B   
	KEY_RWIN             = &H5C  
	KEY_APPS             = &H5D  
	KEY_SLEEP            = &H5F 
	KEY_NUMPAD0          = &H60 
	KEY_NUMPAD1          = &H61 
	KEY_NUMPAD2          = &H62 
	KEY_NUMPAD3          = &H63 
	KEY_NUMPAD4          = &H64   
	KEY_NUMPAD5          = &H65   
	KEY_NUMPAD6          = &H66   
	KEY_NUMPAD7          = &H67  
	KEY_NUMPAD8          = &H68   
	KEY_NUMPAD9          = &H69   
	KEY_MULTIPLY         = &H6A   
	KEY_ADD              = &H6B  
	KEY_SEPARATOR        = &H6C    
	KEY_SUBTRACT         = &H6D  
	KEY_DECIMAL          = &H6E  
	KEY_DIVIDE           = &H6F  
	KEY_F1               = &H70  
	KEY_F2               = &H71  
	KEY_F3               = &H72  
	KEY_F4               = &H73  
	KEY_F5               = &H74  
	KEY_F6               = &H75   
	KEY_F7               = &H76  
	KEY_F8               = &H77  
	KEY_F9               = &H78   
	KEY_F10              = &H79   
	KEY_F11              = &H7A  
	KEY_F12              = &H7B   
	KEY_F13              = &H7C  
	KEY_F14              = &H7D   
	KEY_F15              = &H7E   
	KEY_F16              = &H7F  
	KEY_F17              = &H80   
	KEY_F18              = &H81  
	KEY_F19              = &H82  
	KEY_F20              = &H83  
	KEY_F21              = &H84   
	KEY_F22              = &H85  
	KEY_F23              = &H86   
	KEY_F24              = &H87 
	KEY_NUMLOCK          = &H90  
	KEY_SCROLL           = &H91 
	KEY_LSHIFT           = &HA0 '160
	KEY_RSHIFT           = &HA1 '161
	KEY_LCONTROL         = &HA2 
	KEY_RCONTROL         = &HA3 
	KEY_LMENU            = &HA4 
	KEY_RMENU            = &HA5 
	KEY_PLUS             = &HBB 
	KEY_COMMA            = &HBC 
	KEY_MINUS            = &HBD 
	KEY_PERIOD           = &HBE
	KEY_OEM_2            = &HBF
	KEY_OEM_3            = &HC0
	KEY_OEM_4            = &HDB
	KEY_OEM_5            = &HDC
	KEY_OEM_6            = &HDD
	KEY_OEM_7            = &HDE
	KEY_OEM_8            = &HDF
	KEY_OEM_AX           = &HE1
	KEY_OEM_102          = &HE2
	KEY_ATTN             = &HF6
	KEY_CRSEL            = &HF7
	KEY_EXSEL            = &HF8 
	KEY_EREOF            = &HF9
	KEY_PLAY             = &HFA 
	KEY_ZOOM             = &HFB 
	KEY_PA1              = &HFD
	KEY_OEM_CLEAR        = &HFE
	KEY_NONE			 = &HFF
	KEY_KEY_CODES_COUNT  = &H100
End Enum

'----------------------------------------------------------------------------
'  Type Definitions
'----------------------------------------------------------------------------
TYPE iGUI_EVENT
   id as integer
   thisevent as EGUI_EVENT_TYPE
   x as integer
   y as integer
END TYPE

TYPE iPARTICLE_SETTINGS
   min_box_x as single
   min_box_y as single
   min_box_z as single
   max_box_x as single
   max_box_y as single
   max_box_z as single
   direction_x as single
   direction_y as single
   direction_z as single
   min_paritlcles_per_second as uinteger
   max_paritlcles_per_second as uinteger
   min_start_color_red as integer
   min_start_color_green as integer
   min_start_color_blue as integer
   max_start_color_red as integer
   max_start_color_green as integer
   max_start_color_blue as integer
   min_lifetime as uinteger
   max_lifetime as uinteger
   min_start_sizeX as single
   min_start_sizeY as single
   max_start_sizeX as single
   max_start_sizeY as single
   max_angle_degrees as integer
END TYPE

TYPE iVERTEX
   x as single 
   y as single  
   z as single   
   normal_x as single  
   normal_y as single   
   normal_z as single 
   vcolor as uinteger  
   texture_x as single 
   texture_y as single  
END TYPE

TYPE iVECTOR
    x as single
    y as single
    z as single
END TYPE

Type iSHADER
    material_type as INTEGER
    material_object as UINTEGER PTR
    next_shader as UINTEGER PTR
End Type

TYPE iMESH as UINTEGER PTR
TYPE iIMAGE as UINTEGER PTR
TYPE iTEXTURE as UINTEGER PTR
TYPE iMATERIAL as UINTEGER PTR
TYPE iENTITY as UINTEGER PTR				'Irrlicht Mesh Node
TYPE iCAMERA as UINTEGER PTR
TYPE iTERRAIN as UINTEGER PTR
TYPE iTRI_SELECTOR as UINTEGER PTR
TYPE iMETA_SELECTOR as UINTEGER PTR
TYPE iOCTREE_SELECTOR as UINTEGER PTR
TYPE iTERRAIN_SELECTOR as UINTEGER PTR
TYPE iPARTICLE_SYSTEM as UINTEGER PTR
TYPE iEMITTER as UINTEGER PTR
TYPE iAFFECTOR as UINTEGER PTR
TYPE iANIMATOR as UINTEGER PTR
TYPE iCOLLISION_ANIMATOR as UINTEGER PTR
TYPE iFONT as UINTEGER PTR
TYPE iARCHIVE as UINTEGER PTR
TYPE iLIGHT as UINTEGER PTR
TYPE iSHADOW as UINTEGER PTR
TYPE iSPRITE as UINTEGER PTR				'Irrlicht Billboard
TYPE iGADGET as Any Ptr						'Irrlicht GUI Element
TYPE iRealisticWaterEntity as Any Ptr
	
'----------------------------------------------------------------------------
'  IRRKLANG SOUND
'----------------------------------------------------------------------------
TYPE iSOUND as UINTEGER PTR
TYPE iSOUND_SOURCE as UINTEGER PTR

'----------------------------------------------------------------------------
'  RAKNET CONSTANTS
'----------------------------------------------------------------------------
CONST RN_BROADCAST = 0
CONST RN_HOST = 0

'////////////////////////////////////////////////////////
' MESSAGE PRIORITIES
'////////////////////////////////////////////////////////
CONST RN_IMMEDIATE_PRIORITY = 0		'Not BUFFERED - SENDS IMMEDIATELY
CONST RN_HIGH_PRIORITY = 1			'BUFFERED - SEND IN GROUPS EVERY 10ms
CONST RN_MEDIUM_PRIORITY = 2		'*
CONST RN_LOW_PRIORITY = 3			'*

'////////////////////////////////////////////////////////
' MESSAGE RELIABILITY
'////////////////////////////////////////////////////////
CONST RN_UNRELIABLE = 0
CONST RN_UNRELIABLE_SEQUENCED = 1
CONST RN_RELIABLE = 2
CONST RN_RELIABLE_ORDERED = 3
CONST RN_RELIABLE_SEQUENCED = 4

'////////////////////////////////////////////////////////
' RAKNET MESSAGE TYPES	4.081
'////////////////////////////////////////////////////////
' RESERVED TYPES - DO NOT CHANGE THESE
CONST ID_CONNECTED_PING = 0 
CONST ID_UNCONNECTED_PING = 1
CONST ID_UNCONNECTED_PING_OPEN_CONNECTIONS = 2
CONST ID_CONNECTED_PONG = 3
CONST ID_DETECT_LOST_CONNECTIONS = 4
CONST ID_OPEN_CONNECTION_REQUEST_1 = 5
CONST ID_OPEN_CONNECTION_REPLY_1 = 6
CONST ID_OPEN_CONNECTION_REQUEST_2 = 7
CONST ID_OPEN_CONNECTION_REPLY_2 = 8
CONST ID_CONNECTION_REQUEST = 9
CONST ID_REMOTE_SYSTEM_REQUIRES_PUBLIC_KEY =10
CONST ID_OUR_SYSTEM_REQUIRES_SECURITY = 11
CONST ID_PUBLIC_KEY_MISMATCH = 12
CONST ID_OUT_OF_BAND_INTERNAL = 13
CONST ID_SND_RECEIPT_ACKED = 14
CONST ID_SND_RECEIPT_LOSS = 15
' USER TYPES - DO NOT CHANGE THESE
CONST ID_CONNECTION_REQUEST_ACCEPTED = 16
CONST ID_CONNECTION_ATTEMPT_FAILED = 17
CONST ID_ALREADY_CONNECTED = 18
CONST ID_NEW_INCOMING_CONNECTION = 19
CONST ID_NO_FREE_INCOMING_CONNECTIONS = 20
CONST ID_DISCONNECTION_NOTIFICATION = 21
CONST ID_CONNECTION_LOST = 22
CONST ID_CONNECTION_BANNED = 23
CONST ID_INVALID_PASSWORD = 24
CONST ID_INCOMPATIBLE_PROTOCOL_VERSION = 25
CONST ID_IP_RECENTLY_CONNECTED = 26
CONST ID_TIMESTAMP = 27
CONST ID_UNCONNECTED_PONG = 28
CONST ID_ADVERTISE_SYSTEM = 29
CONST ID_DOWNLOAD_PROGRESS = 30
CONST ID_REMOTE_DISCONNECTION_NOTIFICATION = 31
CONST ID_REMOTE_CONNECTION_LOST = 32
CONST ID_REMOTE_NEW_INCOMING_CONNECTION = 33
CONST ID_FILE_LIST_TRANSFER_HEADER = 34
CONST ID_FILE_LIST_TRANSFER_FILE = 35
CONST ID_FILE_LIST_REFERENCE_PUSH_ACK = 36
CONST ID_DDT_DOWNLOAD_REQUEST = 37
CONST ID_TRANSPORT_STRING = 38
CONST ID_REPLICA_MANAGER_CONSTRUCTION = 39
CONST ID_REPLICA_MANAGER_SCOPE_CHANGE = 40
CONST ID_REPLICA_MANAGER_SERIALIZE = 41
CONST ID_REPLICA_MANAGER_DOWNLOAD_STARTED = 42
CONST ID_REPLICA_MANAGER_DOWNLOAD_COMPLETE = 43
CONST ID_RAKVOICE_OPEN_CHANNEL_REQUEST = 44
CONST ID_RAKVOICE_OPEN_CHANNEL_REPLY = 45
CONST ID_RAKVOICE_CLOSE_CHANNEL = 46
CONST ID_RAKVOICE_DATA = 47
CONST ID_AUTOPATCHER_GET_CHANGELIST_SINCE_DATE = 48
CONST ID_AUTOPATCHER_CREATION_LIST = 49
CONST ID_AUTOPATCHER_DELETION_LIST = 50
CONST ID_AUTOPATCHER_GET_PATCH = 51
CONST ID_AUTOPATCHER_PATCH_LIST = 52
CONST ID_AUTOPATCHER_REPOSITORY_FATAL_ERROR = 53
CONST ID_AUTOPATCHER_CANNOT_DOWNLOAD_ORIGINAL_UNMODIFIED_FILES = 54
CONST ID_AUTOPATCHER_FINISHED_INTERNAL = 55
CONST ID_AUTOPATCHER_FINISHED = 56
CONST ID_AUTOPATCHER_RESTART_APPLICATION = 57
CONST ID_NAT_PUNCHTHROUGH_REQUEST = 58
CONST ID_NAT_CONNECT_AT_TIME = 59
CONST ID_NAT_GET_MOST_RECENT_PORT = 60
CONST ID_NAT_CLIENT_READY = 61
CONST ID_NAT_TARGET_NOT_CONNECTED = 62
CONST ID_NAT_TARGET_UNRESPONSIVE = 63
CONST ID_NAT_CONNECTION_TO_TARGET_LOST = 64
CONST ID_NAT_ALREADY_IN_PROGRESS = 65
CONST ID_NAT_PUNCHTHROUGH_FAILED = 66
CONST ID_NAT_PUNCHTHROUGH_SUCCEEDED = 67
CONST ID_READY_EVENT_SET = 68
CONST ID_READY_EVENT_UNSET = 69
CONST ID_READY_EVENT_ALL_SET = 70
CONST ID_READY_EVENT_QUERY = 71
CONST ID_LOBBY_GENERAL = 72
CONST ID_RPC_REMOTE_ERROR = 73
CONST ID_RPC_PLUGIN = 74
CONST ID_FILE_LIST_REFERENCE_PUSH = 75
CONST ID_READY_EVENT_FORCE_ALL_SET = 76
CONST ID_ROOMS_EXECUTE_FUNC = 77
CONST ID_ROOMS_LOGON_STATUS = 78
CONST ID_ROOMS_HANDLE_CHANGE = 79
CONST ID_LOBBY2_SEND_MESSAGE = 80
CONST ID_LOBBY2_SERVER_ERROR = 81
CONST ID_FCM2_NEW_HOST = 82
CONST ID_FCM2_REQUEST_FCMGUID = 83
CONST ID_FCM2_RESPOND_CONNECTION_COUNT = 84
CONST ID_FCM2_INFORM_FCMGUID = 85
CONST ID_FCM2_UPDATE_MIN_TOTAL_CONNECTION_COUNT = 86
CONST ID_FCM2_VERIFIED_JOIN_START = 87
CONST ID_FCM2_VERIFIED_JOIN_CAPABLE = 88
CONST ID_FCM2_VERIFIED_JOIN_FAILED = 89
CONST ID_FCM2_VERIFIED_JOIN_ACCEPTED = 90
CONST ID_FCM2_VERIFIED_JOIN_REJECTED = 91
CONST ID_UDP_PROXY_GENERAL = 92
CONST ID_SQLite3_EXEC = 93
CONST ID_SQLite3_UNKNOWN_DB = 94
CONST ID_SQLLITE_LOGGER = 95
CONST ID_NAT_TYPE_DETECTION_REQUEST = 96
CONST ID_NAT_TYPE_DETECTION_RESULT = 97
CONST ID_ROUTER_2_INTERNAL = 98
CONST ID_ROUTER_2_FORWARDING_NO_PATH = 99
CONST ID_ROUTER_2_FORWARDING_ESTABLISHED = 100
CONST ID_ROUTER_2_REROUTED = 101
CONST ID_TEAM_BALANCER_INTERNAL = 102
CONST ID_TEAM_BALANCER_REQUESTED_TEAM_FULL = 103
CONST ID_TEAM_BALANCER_REQUESTED_TEAM_LOCKED = 104
CONST ID_TEAM_BALANCER_TEAM_REQUESTED_CANCELLED = 105
CONST ID_TEAM_BALANCER_TEAM_ASSIGNED = 106
CONST ID_LIGHTSPEED_INTEGRATION = 107
CONST ID_XBOX_LOBBY = 108
CONST ID_TWO_WAY_AUTHENTICATION_INCOMING_CHALLENGE_SUCCESS = 109
CONST ID_TWO_WAY_AUTHENTICATION_OUTGOING_CHALLENGE_SUCCESS = 110
CONST ID_TWO_WAY_AUTHENTICATION_INCOMING_CHALLENGE_FAILURE = 111
CONST ID_TWO_WAY_AUTHENTICATION_OUTGOING_CHALLENGE_FAILURE = 112
CONST ID_TWO_WAY_AUTHENTICATION_OUTGOING_CHALLENGE_TIMEOUT = 113
CONST ID_TWO_WAY_AUTHENTICATION_NEGOTIATION = 114
CONST ID_CLOUD_POST_REQUEST = 115
CONST ID_CLOUD_RELEASE_REQUEST = 116
CONST ID_CLOUD_GET_REQUEST = 117
CONST ID_CLOUD_GET_RESPONSE = 118
CONST ID_CLOUD_UNSUBSCRIBE_REQUEST = 119
CONST ID_CLOUD_SERVER_TO_SERVER_COMMAND = 120
CONST ID_CLOUD_SUBSCRIPTION_NOTIFICATION = 121
CONST ID_LIB_VOICE = 122
CONST ID_RELAY_PLUGIN = 123
CONST ID_NAT_REQUEST_BOUND_ADDRESSES = 124
CONST ID_NAT_RESPOND_BOUND_ADDRESSES = 125
CONST ID_FCM2_UPDATE_USER_CONTEXT = 126
CONST ID_RESERVED_3 = 127
CONST ID_RESERVED_4 = 128
CONST ID_RESERVED_5 = 129
CONST ID_RESERVED_6 = 130
CONST ID_RESERVED_7 = 131
CONST ID_RESERVED_8 = 132
CONST ID_RESERVED_9 = 133
' USER MESSAGE DEFINITIOINS DEFINED FROM 134 TO 255

'----------------------------------------------------------------------------
'  Functions and Subroutines
'----------------------------------------------------------------------------
Extern "c"

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Global.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iGetVersion() as CONST zstring ptr
/'	DEFINITION:	Wrapper Version.
	ARGUMENTS:	None.	
	RETURNS:	Version of the BasicIrrlicht.dll Wrapper. '/
declare function iGraphics(byval X as integer, byval Y as integer, byval Bits as integer, byval Fullscreen as boolean ) as Boolean
/'	DEFINITION:	Sets the 2D graphics mode. * NOT YET IMPLEMENTED!
	ARGUMENTS:	X and Y of screen size, color depth and TRUE or FALSE for fullscreen.	
	RETURNS:	TRUE or FALSE. '/
declare function iGraphics3D(byval X as integer, byval Y as integer, byval Bits as integer, byval Fullscreen as boolean, byval Resizable as boolean=FALSE ) as Boolean
/'	DEFINITION:	Sets the 3D graphics mode.
	ARGUMENTS:	X and Y of screen size, color depth, TRUE or FALSE for fullscreen and resizeable window.	
	RETURNS:	TRUE or FALSE. '/
declare function iRun() as integer
/'	DEFINITION:	Is the engine running.
				*REQUIRED AT THE BEGINNING OF YOUR MAIN LOOP!
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare sub iUpdateScene(byval clearBackBuffer as Boolean=TRUE,byval clearZBuffer as Boolean=TRUE)
/'	DEFINITION:	Updates sound engine listener, set cls color and buffer settings etc.
	ARGUMENTS:	Clear backbuffer and\or zbuffer.	
	RETURNS:	None. '/
declare sub iRenderScene()
/'	DEFINITION:	Updates movement\animation all scene entities and renders the scene to the back buffer.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare sub iRenderGUI()
/'	DEFINITION:	Renders all gui elements to the back buffer.
	ARGUMENTS:	None.	
	RETURNS:	None. '/
declare function iFlip() as Boolean
/'	DEFINITION:	Ends the scene and flips the back buffer.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare sub iUpdateEventReceiver()
/'	DEFINITION:	Force update event receiver.
	ARGUMENTS:	None.	
	RETURNS:	None. '/
declare sub iEndGraphics()
/'	DEFINITION:	Closes the graphics mode.
	ARGUMENTS:	None.	
	RETURNS:	None. '/
declare sub iVSync(byval apply as Boolean)
/'	DEFINITION:	Enables or disables vertical sync.
				*MUST BE USED BEFORE iGraphics3D OR WILL HAVE NO EFFECT!
	ARGUMENTS:	TRUE or FALSE.	
	RETURNS:	None. '/
declare sub iAntialias(byval level as UInteger)
/'	DEFINITION:	Sets Fullscreen Antialias level.
				*MUST BE USED BEFORE iGraphics3D OR WILL HAVE NO EFFECT!
	ARGUMENTS:	0 and 1 is disabled. If value is too high, smaller values will be tried automatically.	
	RETURNS:	None. '/
declare sub iFrameLimit(byval limit as uinteger)
/'	DEFINITION:	Set maximum engine FPS.
	ARGUMENTS:	Framelimit.	
	RETURNS:	None. '/
declare function iFPS() as integer
/'	DEFINITION:	Internal Irrlicht FPS counter.
	ARGUMENTS:	None.	
	RETURNS:	Engine FPS. '/
declare function iTrisRendered() as Integer
/'	DEFINITION:	Total primitives drawn during last iRenderScene().
	ARGUMENTS:	None.	
	RETURNS:	Count of primitives drawn. '/
declare sub iAppTitle( byval text as wstring ptr )
/'	DEFINITION:	Window title.
	ARGUMENTS:	Text to display.	
	RETURNS:	None. '/
declare function iMilliSecs() as Integer
/'	DEFINITION:	Internal Irrlicht timer.
	ARGUMENTS:	None.	
	RETURNS:	Milliseconds in time passed. '/
declare function iRunTime() as integer
/'	DEFINITION:	Internal Irrlicht runtime timer.
	ARGUMENTS:	None.	
	RETURNS:	Engine run time in Milliseconds. '/
declare sub iClearScene()
/'	DEFINITION:	Clears the scene of all entities and textures.
	ARGUMENTS:	None.	
	RETURNS:	None. '/
declare function iLoadScene(ByVal filename As zstring ptr) as Boolean
/'	DEFINITION:	Loads a saved Irrlicht scene file(.irr).
	ARGUMENTS:	Filename to load.	
	RETURNS:	TRUE or FALSE. '/
declare function iSaveScene(ByVal filename As zstring ptr) as Boolean
/'	DEFINITION:	Saves the current scene to an Irrlicht scene file(.irr).
	ARGUMENTS:	Filename to save.	
	RETURNS:	TRUE or FALSE. '/
declare sub iTransparentZWrite(byval enable as Boolean)
/'	DEFINITION:	Enable or Disable TransparentZWrite.
	ARGUMENTS:	TRUE or FALSE.	
	RETURNS:	None. '/
declare function iAddArchive( byval filename as Zstring ptr, byval ignore_case as boolean, byval ignore_paths as boolean, byval password as Zstring ptr) as iARCHIVE
/'	DEFINITION:	Add a compressed media archive file.
	ARGUMENTS:	Filename, case, ignore paths and password if exists.	
	RETURNS:	iARCHIVE pointer to archive if it exists. '/
declare sub iFreeArchive(byval archive as iARCHIVE)
/'	DEFINITION:	Releases the archive file.
	ARGUMENTS:	iARCHIVE file pointer.	
	RETURNS:	None. '/
declare sub iScreenShot(byval folder as Zstring ptr=@".")
/'	DEFINITION:	Saves a screenshot in the specified folder or current if none specified, with date and time.
	ARGUMENTS:	None.	
	RETURNS:	None. '/
declare sub iEngineSleep(byval Time_MS as UInteger)
/'	DEFINITION:	Force the Irrlicht Engine to sleep.
	ARGUMENTS:	Time to sleep in milliseconds.	
	RETURNS:	None. '/
declare function iSupportStencilBuffer() as Boolean
/'	DEFINITION:	Does the graphics card support Stencil Buffer.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare function iSupportMultiTexture() as Boolean
/'	DEFINITION:	Does the graphics card support Multi Texture.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare function iSupportHardwareTL() as Boolean
/'	DEFINITION:	Does the graphics card support Hardware TL.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare function iSupportGLSL() as Boolean
/'	DEFINITION:	Does the graphics card support GLSL.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare function iSupportARB() as Boolean
/'	DEFINITION:	Does the graphics card support ARB.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare function iProcessorSpeed() as uinteger
/'	DEFINITION:	Processor Speed in Mhz.
	ARGUMENTS:	None.	
	RETURNS:	Current processor speed. '/
declare function iTotalMemory() as uinteger
/'	DEFINITION:	System Memory.
	ARGUMENTS:	None.	
	RETURNS:	Total System Memory. '/
declare function iAvailableMemory() as uinteger
/'	DEFINITION:	System Memory.
	ARGUMENTS:	None.	
	RETURNS:	Available System Memory. '/
declare function iVideoModeCount() as integer
/'	DEFINITION:	Supported video modes.
	ARGUMENTS:	None.	
	RETURNS:	Count of supported video modes. '/
declare function iVideoModeDepth( byval ModeNumber as integer ) as integer
/'	DEFINITION:	Supported video mode depth.
	ARGUMENTS:	None.	
	RETURNS:	Supported video mode depth. '/
declare function iVideoModeResolutionWidth( byval ModeNumber as integer ) as integer
/'	DEFINITION:	Supported video mode resolution width.
	ARGUMENTS:	None.	
	RETURNS:	Supported video mode resolution width. '/
declare function iVideoModeResolutionHeight( byval ModeNumber as integer ) as integer
/'	DEFINITION:	Supported video mode resolution height.
	ARGUMENTS:	None.	
	RETURNS:	Supported video mode resolution height. '/
declare sub iSetLogLevel( byval level as ELOG_LEVEL = ELL_ERROR )
/'	DEFINITION:	Set logging level to console.
	ARGUMENTS:	Level = ELL_DEBUG, ELL_INFORMATION, ELL_WARNING, ELL_ERROR or ELL_NONE.	
	RETURNS:	None. '/
declare function iFullscreen() as boolean
/'	DEFINITION:	Check if set to Fullscreen.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare function iWindowActive() as boolean
/'	DEFINITION:	Check if window is active.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare function iWindowFocused() as boolean
/'	DEFINITION:	Check if window has focus.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare function iWindowMinimized() as boolean
/'	DEFINITION:	Check if window is minimized.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/
declare sub iEntityDebug(byval entity as iENTITY, byval visible as uinteger = EDS_OFF)
/'	DEFINITION:	Enable debug view for specified entity.
	ARGUMENTS:	EDS_OFF, EDS_BBOX, EDS_NORMALS, EDS_SKELETON, EDS_MESH_WIRE_OVERLAY, EDS_HALF_TRANSPARENCY, EDS_BBOX_BUFFERS or EDS_FULL.	
	RETURNS:	TRUE or FALSE. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Audio.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare sub iDopplerEffect(byval doppler as Single=1.0,byval distance as Single=1.0)
/'	DEFINITION:	Set the doppler effect of the listener.
	ARGUMENTS:	doppler value and distance.	
	RETURNS:	None. '/
declare function iEmitSound(byval sound as iSOUND_SOURCE,byval parent as iENTITY=0,byval looped as boolean=false) as iSOUND
/'	DEFINITION:	Emits a the specified 3D sound from the specified entity.
	ARGUMENTS:	iSOUND_SOURCE, entity and wheather to play looped.	
	RETURNS:	iSOUND pointer. '/
declare function iLoadSound(byval file as ZString ptr) as iSOUND_SOURCE
/'	DEFINITION:	Loads a sound file.
	ARGUMENTS:	Filename of sound file.	
	RETURNS:	iSOUND_SOURCE pointer. '/
declare sub iFreeSound(byval sound as iSOUND_SOURCE)
/'	DEFINITION:	Releases a loaded sound.
	ARGUMENTS:	iSOUND pointer to free.	
	RETURNS:	None. '/
declare sub iSoundLoop(byval sound as iSOUND)
/'	DEFINITION:	Set the specified sound to play looped.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	None. '/
declare function iPlaySound(byval soundsource as iSOUND_SOURCE) as iSOUND
/'	DEFINITION:	Plays the specified sound in 2D.
	ARGUMENTS:	iSOUND_SOURCE pointer.	
	RETURNS:	iSOUND pointer. '/
declare function iPlayMusic(byval file as ZString ptr) as iSOUND
/'	DEFINITION:	Plays the specified sound file from stream in 2D.
	ARGUMENTS:	Filename of sound to play.	
	RETURNS:	iSOUND pointer. '/
declare sub iStopSound(byval sound as iSOUND)
/'	DEFINITION:	Stops the specified sound playing.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	None. '/
declare sub iPauseSound(byval sound as iSOUND)
/'	DEFINITION:	Pauses the specified sound playing.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	None. '/
declare sub iResumeSound(byval sound as iSOUND)
/'	DEFINITION:	Resumes the specified sound playing.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	None. '/
declare sub iSoundPitch(byval sound as iSOUND,byval pitch as Single)
/'	DEFINITION:	Change the pitch of the specified sound.
	ARGUMENTS:	iSOUND pointer and pitch vaule.	
	RETURNS:	None. '/
declare sub iSoundVolume(byval sound as iSOUND,byval volume as Single)
/'	DEFINITION:	Change the volume of the specified sound playing.
	ARGUMENTS:	iSOUND pointer and volume vaule.	
	RETURNS:	None. '/
declare sub iSoundPan(byval sound as iSOUND,byval pan as Single)
/'	DEFINITION:	Set the panning of the specified sound playing.
	ARGUMENTS:	iSOUND pointer and pan vaule.	
	RETURNS:	None. '/
declare function iSoundPlaying(byval sound as iSOUND) as Boolean
/'	DEFINITION:	Checks to see if the specified sound is currently playing.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	TRUE or FALSE. '/
declare sub iMasterVolume(byval volume as Single)
/'	DEFINITION:	Sets the master volume for all sounds.
	ARGUMENTS:	Volume 0.0 mute to 1.0 max.	
	RETURNS:	None. '/
declare sub iPauseAllSounds(byval pause as Boolean)
/'	DEFINITION:	Pauses all playing sounds.
	ARGUMENTS:	TRUE or FALSE.	
	RETURNS:	None. '/
declare sub iStopAllSounds()
/'	DEFINITION:	Stops all playing sounds.
	ARGUMENTS:	None.	
	RETURNS:	None. '/
declare sub iFreeAllSounds()
/'	DEFINITION:	Releases all loaded sounds.
	ARGUMENTS:	None.	
	RETURNS:	None. '/
declare function iSoundLength(byval sound as iSOUND) as UInteger
/'	DEFINITION:	Gets the length of the specified sound.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	Length of the sound. '/
declare function iGetPlayPosition(byval sound as iSOUND) as UInteger
/'	DEFINITION:	Gets the current play position of the specified sound.
	ARGUMENTS:	iSOUND pointer.	
	RETURNS:	Play position of the sound. '/
declare sub iSetPlayPosition(byval sound as iSOUND,byval position as UInteger)
/'	DEFINITION:	Sets the current play position of the specified sound.
	ARGUMENTS:	iSOUND pointer and position.	
	RETURNS:	None. '/
declare sub iSetSoundDistance(byval sound as iSOUND,byval distance as Single)
/'	DEFINITION:	Sets the minimum hear distance of the specified 3D sound.
	ARGUMENTS:	iSOUND pointer and distance.	
	RETURNS:	None. '/
declare sub iPositionSound(byval sound as iSOUND,byval x as Single,byval y as Single,byval z as Single)
/'	DEFINITION:	Sets the 3D position of the specified 3D sound.
	ARGUMENTS:	iSOUND pointer,x ,y and z in world coordinates.	
	RETURNS:	None. '/
declare function iSoundSourceCount() as UInteger
/'	DEFINITION:	Count of all sound sources.
	ARGUMENTS:	None.	
	RETURNS:	Sound source count. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Camera.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iCreateCamera(byval parent as iENTITY=0, byval bind as boolean=true) as iCAMERA
/'	DEFINITION:	Adds a Camera to the scene.
	ARGUMENTS:	Parent and TRUE or FALSE to bind Camera target and rotation.	
	RETURNS:	iCAMERA pointer. '/
declare function iCreateIsometricCamera(byval vWidth as single, byval vHeight as single,byval vNear as single, byval vFar as single,byval parent as iENTITY=0) as iCAMERA
/'	DEFINITION:	Adds an Isometric Camera to the scene.
	ARGUMENTS:	Width, height, near, far and Parent.	
	RETURNS:	iCAMERA pointer. '/
declare function iCreateFPSCamera(byval rot_s as single = 100.0,byval mov_s as single = 0.5,byval parent as iENTITY=0, byval recv as Boolean = true) as iCAMERA
/'	DEFINITION:	Adds an FPS Camera to the scene.
	ARGUMENTS:	Rotation speed, move speed, parent and wheather to process events for this camera.	
	RETURNS:	iCAMERA pointer. '/
declare sub iCameraInput(byval camera as iCAMERA, byval enable as boolean = true)
/'	DEFINITION:	Enables\disables specified camera input events (Such as FPS camera).
	ARGUMENTS:	Camera and True or false.	
	RETURNS:	None. '/
declare function iCamInputEnabled(byval camera as iCAMERA) as boolean
/'	DEFINITION:	Checks if specified camera's input is enabled or disabled.
	ARGUMENTS:	Camera.	
	RETURNS:	True if currently enabled. '/
declare function iCreateMayaCamera(byval rots as single,byval zoos as single,byval tras as single,byval parent as iENTITY = 0) as iCAMERA
/'	DEFINITION:	Adds an Maya Camera to the scene.
	ARGUMENTS:	Rotation speed, zoom speed, translation speed and parent.	
	RETURNS:	iCAMERA pointer. '/
declare sub iCameraViewPort(byval x as UInteger,byval y as UInteger,byval w as UInteger,byval h as UInteger )
/'	DEFINITION:	Sets active camera viewport size.
	ARGUMENTS:	Rectangle defining new area of rendering.	
	RETURNS:	None. '/
declare sub iCLSColor(byval r as UInteger,byval g as UInteger,byval b as UInteger,byval a as UInteger=255 )
/'	DEFINITION:	Sets the clear screen color.
	ARGUMENTS:	Red, green, blue color and alpha.	
	RETURNS:	None. '/
declare sub iFogType(byval fogtype as EFT_FOG_TYPE)
/'	DEFINITION:	Sets the global fog type.
	ARGUMENTS:	EFT_FOG_EXP2, EFT_FOG_LINEAR or EFT_FOG_EXP.	
	RETURNS:	None. '/
declare sub iFogColor(byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the global fog color.
	ARGUMENTS:	Red, green and blue color.	
	RETURNS:	None. '/
declare sub iFogRange(byval fstart as Single=50.0,byval fend as Single=100.0)
/'	DEFINITION:	Sets the global fog range.
				*ONLY USED WITH EFT_FOG_LINEAR
	ARGUMENTS:	Fog start and end distance from camera.	
	RETURNS:	None. '/
declare sub iPixelFog(byval pfog as Boolean)
/'	DEFINITION:	Enable or disable pixel fog.
	ARGUMENTS:	False for vertex fog (default) or true for per-pixel fog.	
	RETURNS:	None. '/
declare sub iEnableRangeFog(byval rfog as Boolean)
/'	DEFINITION:	Sets fog range.
	ARGUMENTS:	True to enable range-based vertex fog - slower and may not work on all drivers.	
	RETURNS:	None. '/
declare sub iFogDensity(byval density as single=0.01)
/'	DEFINITION:	Sets fog density.
	ARGUMENTS:	Only used in exponential fog mode(linearFog=false). Must be a value between 0.0 and 1.0.	
	RETURNS:	None. '/
declare sub iCameraRange(byval camera as iCAMERA,byval znear as Single=1.0,byval zfar as Single=2000.0)
/'	DEFINITION:	Sets camera view distance.
	ARGUMENTS:	Near and far values.	
	RETURNS:	None. '/
declare sub iSetActiveCamera(byval camera as iCAMERA)
/'	DEFINITION:	Sets specified camera active.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	None. '/
declare sub iSetCameraFOV(byval camera as iCAMERA,byval fov as Single)
/'	DEFINITION:	Sets camera field of view. *DEFAULT: PI / 2.5
	ARGUMENTS:	Fov value.	
	RETURNS:	None. '/
declare function iGetCameraFOV(byval camera as iCAMERA) as Single
/'	DEFINITION:	Gets camera field of view.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	Fov value. '/
declare sub iSetCameraAspectRatio(byval camera as iCAMERA,byval aspectRatio as Single)
/'	DEFINITION:	Sets camera aspect ratio. *DEFAULT: 4.0 / 3.0
	ARGUMENTS:	iCAMERA and aspect ratio value.	
	RETURNS:	None. '/
declare sub iCameraTarget(byval camera as iCAMERA,byval x as single,byval y as Single,byval z as Single)
/'	DEFINITION:	Sets the specified camera's view target.
	ARGUMENTS:	iCAMERA and x, y and z of vector.	
	RETURNS:	None. '/
declare function iCamTargetX(byval camera as iCAMERA) as single
/'	DEFINITION:	Gets the specified camera's current target x value.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	Target x value. '/
declare function iCamTargetY(byval camera as iCAMERA) as single
/'	DEFINITION:	Gets the specified camera's current target y value.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	Target y value. '/
declare function iCamTargetZ(byval camera as iCAMERA) as single
/'	DEFINITION:	Gets the specified camera's current target z value.
	ARGUMENTS:	iCAMERA.	
	RETURNS:	Target z value. '/
declare sub iFadeIn( byval ms as uinteger)
/'	DEFINITION:	Fades in from screen fader color, default is black.
				*iRenderGUI() must be called before iFlip() for this effect to be seen!
	ARGUMENTS:	Time in milliseconds.	
	RETURNS:	None. '/
declare sub iFadeOut(byval ms as uinteger)
/'	DEFINITION:	Fades out from screen fader color, default is black.
				*iRenderGUI() must be called before iFlip() for this effect to be seen!
	ARGUMENTS:	Time in milliseconds.	
	RETURNS:	None. '/
declare sub iFadeColor(byval r as uinteger,byval g as uinteger,byval b as uinteger,byval a as uinteger=0)
/'	DEFINITION:	Sets the screen fader color, default is black.
	ARGUMENTS:	Red, green and blue color.	
	RETURNS:	None. '/
declare function iFadeReady() as Boolean
/'	DEFINITION:	Checks if the screen fader is ready.
	ARGUMENTS:	None.	
	RETURNS:	TRUE or FALSE. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_EntityAnimation.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare sub iSetLoopAnimation(byval entity as iENTITY,byval looped as boolean)
/'	DEFINITION:	Sets wheather to loop specified iENTITY animations.
	ARGUMENTS:	iENTITY and TRUE or FALSE.	
	RETURNS:	None. '/
declare function iAnimationLooped(byval entity as iENTITY) as Boolean
/'	DEFINITION:	Gets wheather the specified iENTITY animations are looped or not.
	ARGUMENTS:	iENTITY.	
	RETURNS:	TRUE or FALSE. '/
declare sub iSetAnimationSpeed(byval entity as iENTITY,byval speed as Single)
/'	DEFINITION:	Sets the animation speed for the specified iENTITY.
	ARGUMENTS:	iENTITY and speed value.	
	RETURNS:	None. '/
declare sub iSetAnimationFrame(byval entity as iENTITY,byval frame as Single)
/'	DEFINITION:	Sets the animation frame for the specified iENTITY.
	ARGUMENTS:	iENTITY and frame value.	
	RETURNS:	None. '/
declare function iAnimationStartFrame(byval entity as iENTITY) as integer
/'	DEFINITION:	Gets the start frame of the specified iENTITY animation.
	ARGUMENTS:	iENTITY.	
	RETURNS:	Start Frame. '/
declare function iAnimationEndFrame(byval entity as iENTITY) as integer
/'	DEFINITION:	Gets the end frame of the specified iENTITY animation.
	ARGUMENTS:	iENTITY.	
	RETURNS:	End Frame. '/
declare function iAnimationFrameCount(byval entity as iENTITY) as uinteger
/'	DEFINITION:	Gets the frame count of the specified iENTITY animation.
	ARGUMENTS:	iENTITY.	*NEEDS TESTED MAY CRASH!
	RETURNS:	Frame Count. '/
declare sub iSetAnimationTransitionTime(byval entity as iENTITY,byval ftime as single)
/'	DEFINITION:	Sets the animation transition time for the specified iENTITY.
	ARGUMENTS:	iENTITY and transition value.	
	RETURNS:	None. '/
declare sub iAnimate(byval entity as iENTITY,byval looped as Boolean,byval speed as Single,byval sframe as integer,byval eframe as Integer,byval ftime as Single)
/'	DEFINITION:	Animate the specified iENTITY.
	ARGUMENTS:	iENTITY, looped, speed, start frame, end frame and transition time.	
	RETURNS:	None. '/
declare sub iAnimateJoint(byval joint as iENTITY)
/'	DEFINITION:	Animate the specified joint.
	ARGUMENTS:	iENTITY.	
	RETURNS:	None. '/
declare sub iSetJointMode(byval joint as iENTITY,byval mode as JOINT_MODE)
/'	DEFINITION:	Sets the specified joints mode.
	ARGUMENTS:	Joint and mode.	(JOINT_MODE_NONE, JOINT_MODE_READ or JOINT_MODE_CONTROL).
	RETURNS:	None. '/
	
'  ANIMATORS
declare function iDeletionAnimator(byval entity as iENTITY,byval ms_delay as uInteger) as iANIMATOR
/'	DEFINITION:	Attaches a deletion animator to the specified entity.
	ARGUMENTS:	Entity and delay in milliseconds.
	RETURNS:	iANIMATOR pointer. '/
declare function iFlyCircleAnimator(byval entity as iEntity,byval x as single,byval y as single,byval z as single,byval radius as single,byval speed as single) as iAnimator
/'	DEFINITION:	Attaches a fly circle animator to the specified entity.
	ARGUMENTS:	Entity, the center, radius and speed.
	RETURNS:	iANIMATOR pointer. '/
declare function iFlyStraightAnimator(byval entity as iEntity,byval sx as single,byval sy as single,byval sz as single,byval ex as single,byval ey as single,byval ez as single,byval uitime as UInteger,byval looped as Boolean) as iAnimator
/'	DEFINITION:	Attaches a fly straight animator to the specified entity.
	ARGUMENTS:	Entity, start position, end position, time to perform and loop.
	RETURNS:	iANIMATOR pointer. '/
declare function iRotationAnimator(byval entity as iEntity,byval p as single,byval y as single,byval r as Single) as iAnimator
/'	DEFINITION:	Attaches a rotation animator to the specified entity.
	ARGUMENTS:	Entity, pitch, yaw and roll.
	RETURNS:	iANIMATOR pointer. '/
declare function iFollowSplineAnimator(byval entity as iEntity,byval iPoints as Integer,byref x as single,byref y as single,byref z as single,byval ttime as Integer,byval speed as Single=1.0,byval tightness as Single=0.5,byval looped as boolean=TRUE,byval pingpong as boolean=FALSE,byval steer as boolean=FALSE) as iAnimator
/'	DEFINITION:	Attaches a spline animator to the specified entity.
	ARGUMENTS:	Entity, number of points, time and speed.
	RETURNS:	iANIMATOR pointer. '/
declare function iFadeAnimator(byval entity as iEntity,byval ms_delay as Integer,byval scale as single) as iAnimator
/'	DEFINITION:	Attaches a fade animator to the specified entity.
	ARGUMENTS:	Entity, time and scale.
	RETURNS:	iANIMATOR pointer. '/
declare sub iFreeAnimator(byval entity as iEntity,byval anim as iAnimator)
/'	DEFINITION:	Removes and frees the specified animator from the specified entity.
	ARGUMENTS:	Entity and animator.
	RETURNS:	None. '/
declare sub iFreeAllAnimators(byval entity as iEntity )
/'	DEFINITION:	Removes and frees all animators from the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	None. '/
declare function iTextureAnimator(byval entity as iEntity,byval texture_name as ZString ptr,byval ext as ZString ptr,byval frame_count as Integer,byval frame_time as integer,byval looped as boolean=true,byval reverse as boolean=false) as iAnimator
/'	DEFINITION:	Attaches a texture animator to the specified entity.
	ARGUMENTS:	Entity, texture filename, file extension, frame count and frame time.
	RETURNS:	iANIMATOR pointer. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_EntityCollision.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iAddCollisionAnimator(byval selectorgroup as iTRI_SELECTOR, byval entity as iENTITY, byval recursive as boolean = false, byval sliding as single = 0.0005) as iANIMATOR
/'	DEFINITION:	Attaches a collision animator to the specified entity.
	ARGUMENTS:	The tri or meta selector, entity, recursive (for a meta) and sliding value.
	RETURNS:	iANIMATOR pointer. '/
declare sub iEntityRadius(byval entity as iENTITY, byval x as single, byval y as single, byval z as single)
/'	DEFINITION:	Set the radius of the specified entity.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and radius.
	RETURNS:	None. '/
declare sub iEntityGravity(byval entity as iENTITY, byval x as single, byval y as single, byval z as single)
/'	DEFINITION:	Set the gravity of the specified entity.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and gravity.
	RETURNS:	None. '/
declare sub iEntityOffset(byval entity as iENTITY, byval x as single, byval y as single, byval z as single)
/'	DEFINITION:	Set the position offset of the specified entity.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and offset value.
	RETURNS:	None. '/
declare function iCreateTriSelector(byval entity as iENTITY, byval iframe as integer = 0) as iTRI_SELECTOR
/'	DEFINITION:	Creates a triangle selector for the specified entity.
	ARGUMENTS:	Entity and frame if animated entity.
	RETURNS:	iTRI_SELECTOR pointer. '/
declare function iCreateOctreeSelector(byval entity as iENTITY, byval iframe as integer = 0) as iTRI_SELECTOR
/'	DEFINITION:	Creates a octree triangle selector for the specified entity(BSP Mesh, etc).
	ARGUMENTS:	Entity and frame if animated entity.
	RETURNS:	iTRI_SELECTOR pointer. '/
declare function iCreateBoxSelector(byval entity as iENTITY, byval recurse as boolean = false) as iTRI_SELECTOR
/'	DEFINITION:	Creates a bounding box triangle selector for the specified entity.
	ARGUMENTS:	Entity and frame if animated entity.
	RETURNS:	iTRI_SELECTOR pointer. '/
declare function iCreateTerrainSelector(byval terrain as iTERRAIN, byval level_of_detail as integer = 0) as iTRI_SELECTOR
/'	DEFINITION:	Creates a terrain triangle selector for the specified terrain.
	ARGUMENTS:	Terrain and LOD. * 0(BEST) to 3 else crash!
	RETURNS:	iTRI_SELECTOR pointer. '/
declare function iCreateMetaSelector() as iMETA_SELECTOR
/'	DEFINITION:	Creates a meta selector for grouping triangle selectors.
	ARGUMENTS:	None.
	RETURNS:	iMETA_SELECTOR pointer. '/
declare function iRemoveEntitySelector(byval entity as iENTITY, byval selector as iTRI_SELECTOR=NULL) as Boolean
/'	DEFINITION:	Removes the specified selector from the specified entity.
	ARGUMENTS:	Entity and triangle selector.
	RETURNS:	True on success. '/
declare sub iMetaAddSelector(byval ms as iMETA_SELECTOR, byval ts as iTRI_SELECTOR)
/'	DEFINITION:	Adds the specified triangle selector to the specified meta selector.
	ARGUMENTS:	Meta selector and triangle selector.
	RETURNS:	None. '/
declare sub iMetaRemoveSelector(byval ms as iMETA_SELECTOR, byval ts as iTRI_SELECTOR)
/'	DEFINITION:	Removes the specified triangle selector from the specified meta selector.
	ARGUMENTS:	Meta selector and triangle selector.
	RETURNS:	None. '/
declare sub iMetaRemoveEntitySelector(byval ms as iMETA_SELECTOR, byval entity as iENTITY)
/'	DEFINITION:	Removes the specified entity's triangle selector(s) from the specified meta selector.
	ARGUMENTS:	Meta selector and entity.
	RETURNS:	None. '/
declare sub iClearMetaSelector(byval ms as iMETA_SELECTOR)
/'	DEFINITION:	Removes all selectors from the specified meta selector.
	ARGUMENTS:	Meta selector.
	RETURNS:	None. '/
declare sub iSetEntitySelector(byval entity as iENTITY, byval selector as iTRI_SELECTOR)
/'	DEFINITION:	Assign the specified selector to the specified entity.
	ARGUMENTS:	Entity and triangle selector.
	RETURNS:	None. '/
declare function iDeleteMetaSelector(byval ms as iMETA_SELECTOR) as Boolean
/'	DEFINITION:	Removes and frees the specified meta selector.
	ARGUMENTS:	Meta selector.
	RETURNS:	True on success. '/
declare function iEntityCollided(byval entity as iENTITY) as Boolean
/'	DEFINITION:	Has the specified entity been involved in a collision.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity.
	RETURNS:	True if a collision occured. '/
declare function iCountCollisions(byval entity as iENTITY) as uinteger
/'	DEFINITION:	Returns the number of collisions that occured for the specified entity.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity.
	RETURNS:	Number of collisions. '/
declare function iEntityFalling(byval entity as iENTITY) as Boolean
/'	DEFINITION:	Is the specified entity falling?
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity.
	RETURNS:	True if falling. '/
declare function iCollidedEntity(byval entity as iENTITY, byval index as integer = 1) as iENTITY
/'	DEFINITION:	Entity that the specified entity collided with.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	Entity collided with. '/
declare function iCollidedPointX(byval entity as iENTITY, byval index as integer = 1) as single
/'	DEFINITION:	Entity's X collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The X coordinate of the vector. '/
declare function iCollidedPointY(byval entity as iENTITY, byval index as integer = 1) as single
/'	DEFINITION:	Entity's Y collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The Y coordinate of the vector. '/
declare function iCollidedPointZ(byval entity as iENTITY, byval index as integer = 1) as single
/'	DEFINITION:	Entity's Z collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The Z coordinate of the vector. '/
declare function iCollidedPointNX(byval entity as iENTITY, byval index as integer = 1) as single
/'	DEFINITION:	Entity's normal X collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The normal X coordinate of the vector. '/
declare function iCollidedPointNY(byval entity as iENTITY, byval index as integer = 1) as single
/'	DEFINITION:	Entity's normal Y collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The normal Y coordinate of the vector. '/
declare function iCollidedPointNZ(byval entity as iENTITY, byval index as integer = 1) as single
/'	DEFINITION:	Entity's normal Z collision point.
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and index of the collision (iCountCollisions).
	RETURNS:	The normal Z coordinate of the vector. '/
declare function iEntitiesCollided(byval entityA as iENTITY, byval entityB as iENTITY, byval buffer as single = 0.0) as Boolean
/'	DEFINITION:	Have to specified entites collided?
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and buffer.
	RETURNS:	True if collision occured. '/
declare sub iBoundingBoxSize(byval entity as iENTITY, byval x as single, byval y as single, byval z as single)
/'	DEFINITION:	Set the bounding box size of the specified entity.
	ARGUMENTS:	Entity and size.
	RETURNS:	None. '/
declare function iGetRayCollision(byval entityS as iENTITY, byval entityE as iENTITY, byval z as single=1.0) as Boolean
/'	DEFINITION:	Does ray from entityS collide with entityE?
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Starting entity, ending entity and max z distance.
	RETURNS:	True if collision occured. '/
declare function iVectorInsideEntity(byval entity as iEntity,byval x as single, byval y as Single,byval z as single) as Boolean
/'	DEFINITION:	Is specified point inside specified entity?
				*ENTITY MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Entity and point.
	RETURNS:	True if inside entity. '/
declare function iCollisionEntity(byval selector as iTRI_SELECTOR, byval ellipsoidX as single, byval ellipsoidY as single, byval ellipsoidZ as single, byval ellipsoidRadius as single, byval velocityX as single, byval velocityY as single, byval velocityZ as single, byval gravityX as single, byval gravityY as single, byval gravityZ as single, byval slidingSpeed as single=0.0005) as iENTITY
/'	DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iGetCameraCollisionEntity(byval camera as iCamera,byval idBitMask as integer=0) as iEntity
/'	DEFINITION:	Has camera collided with another entity?
				*CAMERA MUST HAVE A COLLISION ANIMATOR ATTACHED.
	ARGUMENTS:	Camera and ID mask.
	RETURNS:	Entity in which collision occured. '/
declare function iCollFalling() as Boolean
/'	DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iCollHitPositionX() as Single
/'	DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iCollHitPositionY() as Single
/'	DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iCollHitPositionZ() as Single
/'	DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iCollNewPositionX() as single
/'	DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iCollNewPositionY() as Single
/'	DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iCollNewPositionZ() as Single
/'	DEFINITION:	Specific collision detection.
				*SLATED FOR REMOVAL.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iCameraPick(byval x as Integer,byval y as Integer) as iENTITY
/'	DEFINITION:	Gets entity at specified active camera screen coordinates.
	ARGUMENTS:	Screen coordinates.	
	RETURNS:	Entity in which collision occured. '/
declare function iLinePick(byval sx as single,byval sy as single,byval sz as single,byval dx as single, byval dy as single,byval dz as single) as iEntity
/'	DEFINITION:	Gets collided entity with specified ray(line).
	ARGUMENTS:	Start and end ray coordinates.	
	RETURNS:	Entity in which collision occured. '/
declare function iPickedX() as single
/'	DEFINITION:	Gets the X value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	X value. '/
declare function iPickedY() as single
/'	DEFINITION:	Gets the Y value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Y value. '/
declare function iPickedZ() as single
/'	DEFINITION:	Gets the Z value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Z value. '/
declare function iPickedNX() as single
/'	DEFINITION:	Gets the normal X value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Normal X value. '/
declare function iPickedNY() as single
/'	DEFINITION:	Gets the normal Y value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Normal Y value. '/
declare function iPickedNZ() as single
/'	DEFINITION:	Gets the normal Z value of collision point.
	ARGUMENTS:	None.	
	RETURNS:	Normal Z value. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_EntityControl.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare sub iNameEntity(byval entity as iEntity,byval zname as ZString ptr)
/'	DEFINITION:	Names the specified entity.
	ARGUMENTS:	Entity and name.	
	RETURNS:	None. '/
declare sub iFreeEntity(byval entity as iEntity)
/'	DEFINITION:	Frees the specified entity.
	ARGUMENTS:	Entity.	
	RETURNS:	None. '/
declare sub iEntityParent(byval entity as iEntity,byval parent as iEntity)
/'	DEFINITION:	Assign parent to specified entity.
	ARGUMENTS:	Entity and parent.	
	RETURNS:	None. '/
declare sub iShowEntity(byval entity as iEntity)
/'	DEFINITION:	Shows entity during render.
	ARGUMENTS:	Entity.	
	RETURNS:	None. '/
declare sub iHideEntity(byval entity as iEntity)
/'	DEFINITION:	Hides entity during render.
	ARGUMENTS:	Entity.	
	RETURNS:	None. '/
declare function iCopyEntity(byval entity as iEntity,byval parent as iEntity = 0) as iENTITY
/'	DEFINITION:	Copies the specified entity.
	ARGUMENTS:	Entity and optional parent.	
	RETURNS:	iENTITY pointer. '/
declare sub iEntityShininess(byval entity as iEntity,byval shininess as Single)
/'	DEFINITION:	Sets the shininess of the specified entity.
	ARGUMENTS:	Entity and shininess value.	
	RETURNS:	None. '/
declare sub iEntityAlpha(byval entity as iEntity,byval alpha as Integer)
/'	DEFINITION:	Sets the alpha of the specified entity.
	ARGUMENTS:	Entity and alpha value.	
	RETURNS:	None. '/
declare sub iEntityTexture(byval entity as iEntity,byval texture as iTexture,byval index as Integer=0)
/'	DEFINITION:	Sets the texture of the specified entity.
	ARGUMENTS:	Entity, texture and index value.	
	RETURNS:	None. '/
declare sub iEntityColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the color of the specified entity.
	ARGUMENTS:	Entity and color value.	
	RETURNS:	None. '/
declare sub iEntityDiffuseColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the diffuse color of the specified entity.
	ARGUMENTS:	Entity and diffuse color value.	
	RETURNS:	None. '/
declare sub iEntityAmbientColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the ambient color of the specified entity.
	ARGUMENTS:	Entity and ambient color value.	
	RETURNS:	None. '/
declare sub iEntityEmissiveColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the emissive color of the specified entity.
	ARGUMENTS:	Entity and emissive color value.	
	RETURNS:	None. '/
declare sub iEntitySpecularColor(byval entity as iEntity,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the specular color of the specified entity.
	ARGUMENTS:	Entity and specular color value.	
	RETURNS:	None. '/
declare sub iEntityColorByVertex(byval entity as iEntity,byval colorMaterial as ECM_COLOR_MATERIAL)
/'	DEFINITION:	Sets the vertex color of the specified entity.
	ARGUMENTS:	Entity and ECM_COLOR_MATERIAL.	
	RETURNS:	None. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_EntityMovement.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare sub iScaleEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)
/'	DEFINITION:	Scales the specified entity.
	ARGUMENTS:	Entity and x, y and z size.
	RETURNS:	None. '/
declare sub iPositionEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single, byval collAnimOverride as boolean = false)
/'	DEFINITION:	Positions the specified entity in 3D space.
	ARGUMENTS:	Entity, x, y, z position and true or false to override the collision animator, if any.
	RETURNS:	None. '/
declare sub iMoveEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)
/'	DEFINITION:	Moves the specified entity in 3D space.
	ARGUMENTS:	Entity and x, y and z direction.
	RETURNS:	None. '/
declare sub iTranslateEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)
/'	DEFINITION:	Moves the specified entity in 3D space disregarding orientation.
	ARGUMENTS:	Entity and x, y and z direction.
	RETURNS:	None. '/
declare sub iRotateEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)
/'	DEFINITION:	Sets the rotation of the specified entity in 3D space.
	ARGUMENTS:	Entity and x, y and z rotation.
	RETURNS:	None. '/
declare sub iTurnEntity(byval entity as iEntity,byval x as single,byval y as single,byval z as Single)
/'	DEFINITION:	Turns the specified entity in 3D space.
	ARGUMENTS:	Entity and x, y and z direction.
	RETURNS:	None. '/
declare sub iPointEntity(byval entity1 as iEntity,byval entity2 as iEntity)
/'	DEFINITION:	Points entity1 at entity2.
	ARGUMENTS:	Source entity and destination entity.
	RETURNS:	None. '/
declare sub iEntityPoint(byval entity as iEntity,byval x as single,byval y as single,byval z as single)
/'	DEFINITION:	Points entity to a specific 3D point.
	ARGUMENTS:	Entity and x, y and z of target point.
	RETURNS:	None. '/
declare sub iAlignToVector(byval entity as iENTITY, byval vector_x as single, byval vector_y as single, byval vector_z as single, byval axis as uinteger)
/'	DEFINITION:	Align specified entity with specified vector.
				*NOT YET IMPLEMENTED!
	ARGUMENTS:	Entity, vector and which axis to align with.
	RETURNS:	None. '/
	
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_EntitySpecial.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iCreateWater(byval texture1 as ZString ptr,byval texture2 as ZString ptr,byval height as single=2.0, byval speed as single=300.0,byval length as single=10.0,byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Creates a water surface entity.
	ARGUMENTS:	Textures, wave height, length speed and parent.
	RETURNS:	iENTITY pointer. '/
declare function iWaterHeight( byval Entity as iENTITY,byval selector as iTRI_SELECTOR,byval x as single, byval z as single) as single
/'	DEFINITION:	Gets the height of a point on the specified Water node.
	ARGUMENTS:	The water and parameters.
	RETURNS:	Water height. '/
declare function iCreateShaderWater(byval wdth as single,byval height as Single, _
                                    byval resourcePath as ZString ptr,byval rendersize as uinteger=512,byval parent as iENTITY=0) as iRealisticWaterEntity
/'	DEFINITION:	Creates a realistic shader water surface entity with reflection and refraction.
	ARGUMENTS:	Width, height and shader path.
	RETURNS:	iRealisticWaterEntity pointer. '/
declare function iFreeShaderWater(byval shaderwater as iRealisticWaterEntity) as boolean
/'	DEFINITION:	Free's a previously created shader water.
	ARGUMENTS:	Shader water.
	RETURNS:	True or False. '/
declare function iShaderWaterWindForce(byval shaderwater as iRealisticWaterEntity, byval windForce as single=10.0) as boolean
/'	DEFINITION:	Sets the wind force of the shader water surface.
	ARGUMENTS:	shader water and wind force.
	RETURNS:	True or False. '/
declare function iShaderWaterWindDirection(byval shaderwater as iRealisticWaterEntity,byval x as single=0.0,byval y as single=1.0) as boolean
/'	DEFINITION:	Sets the wind direction of the shader water surface.
	ARGUMENTS:	shader water and x,y direction.
	RETURNS:	True or False. '/
declare function iShaderWaterWaveHeight(byval shaderwater as iRealisticWaterEntity,byval waveheight as single=0.5) as boolean
/'	DEFINITION:	Sets the wave height of the shader water surface.
	ARGUMENTS:	shader water and wave height.
	RETURNS:	True or False. '/
declare function iShaderWaterColor(byval shaderwater as iRealisticWaterEntity, byval r as uinteger,byval g as uinteger,byval b as uinteger,byval a as uinteger=255) as boolean
/'	DEFINITION:	Sets the color of the shader water surface.
	ARGUMENTS:	shader water and RGBA. Default 25.5, 25.5, 153, 255
	RETURNS:	True or False. '/
declare function iShaderWaterColorBlendFactor(byval shaderwater as iRealisticWaterEntity,byval colorBlendFactor as single=0.2) as boolean
/'	DEFINITION:	Sets the color of the shader water surface.
	ARGUMENTS:	shader water and blend factor.
	RETURNS:	True or False. '/
declare function iCreateLensFlare(byval txture as iTexture,byval parent as iEntity=0 ) as iEntity
/'	DEFINITION:	Creates a lens flare entity.
	ARGUMENTS:	Texture and parent.
	RETURNS:	iENTITY pointer. '/
declare sub iLensFlareScale(byval flare as iEntity,byval source as Single,byval optics as Single)
/'	DEFINITION:	Sets the scale of the lens flare entity.
	ARGUMENTS:	The lens flare, source(starting source light scale) and optics(projection scale).
	RETURNS:	None. '/
declare function iCreateLaser(byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Creates a laser beam entity.
	ARGUMENTS:	Parent.
	RETURNS:	iENTITY pointer. '/
declare function iCreateSkybox(byval up as iTexture,byval down as iTexture, byval left as iTexture, byval right as iTexture,byval front as iTexture,byval back as iTexture, byval parent as iEntity = 0, byval id as integer = -1) as iEntity
/'	DEFINITION:	Creates a sky box entity.
	ARGUMENTS:	Textures and parent.
	RETURNS:	iENTITY pointer. '/
declare function iCreateSkydome(byval texture as iTexture,byval horiRes as Integer=16,byval vertRes as Integer=8, byval texturePercentage as Single=0.9,byval spherePercentage as single=2.0,byval domeRadius as single=1000.0,byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Creates a sky dome entity.
	ARGUMENTS:	Texture, parameters of dome and parent.
	RETURNS:	iENTITY pointer. '/
declare function iCreateMirror(byval camera as iCAMERA,byval mirrorOverlay as iTEXTURE,byval parent as iEntity=0) as iENTITY
/'	DEFINITION:	Creates a mirror plane entity.
	ARGUMENTS:	Camera, texture and parent.
	RETURNS:	iENTITY pointer. '/
declare sub iMirrorReflect(byval mirror as iENTITY)
/'	DEFINITION:	Renders the mirror entity.
	ARGUMENTS:	Mirror.
	RETURNS:	None. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_EntityState.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iMeshAnimTime(byval mesh as iMesh) as UInteger
/'	DEFINITION:	Animation time of the specified animated mesh.
	ARGUMENTS:	Animated mesh.
	RETURNS:	Animation time. '/
declare function iEntityX(byval entity as iEntity,byval global as boolean=false) as Single
/'	DEFINITION:	The world coordinates X position of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	X world coordinate. '/
declare function iEntityY(byval entity as iEntity,byval global as boolean=false) as Single
/'	DEFINITION:	The world coordinates Y position of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Y world coordinate. '/
declare function iEntityZ(byval entity as iEntity,byval global as boolean=false) as Single
/'	DEFINITION:	The world coordinates Z position of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Z world coordinate. '/
declare function iEntityPitch(byval entity as iEntity,byval global as boolean=false) as Single
/'	DEFINITION:	The pitch of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Pitch in degrees. '/
declare function iEntityYaw(byval entity as iEntity,byval global as boolean=false) as Single
/'	DEFINITION:	The yaw of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Yaw in degrees. '/
declare function iEntityRoll(byval entity as iEntity,byval global as boolean=false) as Single
/'	DEFINITION:	The roll of the specified entity.
	ARGUMENTS:	Entity.
	RETURNS:	Roll in degrees. '/
declare function iDeltaYaw(byval srcEntity as iEntity,byval destEntity as iEntity) as single
/'	DEFINITION:	The yaw difference of the 2 specified entities.
	ARGUMENTS:	Source and destination entity.
	RETURNS:	Difference in degrees. '/
declare function iDeltaPitch(byval srcEntity as iEntity,byval destEntity as iEntity) as single
/'	DEFINITION:	The pitch difference of the 2 specified entities.
	ARGUMENTS:	Source and destination entity.
	RETURNS:	Pitch in degrees. '/
declare function iEntityName(byval entity as iEntity) as ZString ptr
/'	DEFINITION:	Get the name of the specified entity.
	ARGUMENTS:	Entity.	
	RETURNS:	Name as string. '/
declare function iEntityVisible(byval srcEntity as iEntity,byval destEntity as iEntity,byval selector as iTRI_SELECTOR) as boolean
/'	DEFINITION:	Test if entity is visible.
	ARGUMENTS:	Source and destination entity and and collision selector.	
	RETURNS:	True or False. '/
declare function iEntityDistance(byval entity1 as iEntity,byval entity2 as iEntity) as Single
/'	DEFINITION:	Get the distance between 2 entities.
	ARGUMENTS:	The two entities.	
	RETURNS:	Distance as single. '/
'  CHILDREN
declare function iFindChild(byval mesh as iMesh,byval jointname as ZString ptr) as iEntity
/'	DEFINITION:	Find the child of the given mesh and joint name.
	ARGUMENTS:	Mesh and joint name.	
	RETURNS:	The entity if found. '/
declare function iCountChildren(byval mesh as iMesh,byval jointname as ZString ptr) as uinteger
/'	DEFINITION:	Child count of the specified mesh at the specified joint name.
	ARGUMENTS:	Mesh and joint name.	
	RETURNS:	Child count. '/
declare function iChildName(byval joint as iEntity) as ZString ptr
/'	DEFINITION:	The name of the specified joint.
	ARGUMENTS:	Joint name.	
	RETURNS:	Name as a string. '/
declare function iChildIndex(byval joint as iEntity) as uinteger
/'	DEFINITION:	The index value of the specified joint.
	ARGUMENTS:	Joint name.	
	RETURNS:	Index value. '/
declare sub iChildMode(byval mesh as iMesh,byval mode as UInteger)
/'	DEFINITION:	The chid mode of the specified mesh.
	ARGUMENTS:	Mesh name.	
	RETURNS:	None. '/
declare function iEntityClass(byval entity as iEntity) as UInteger
/'	DEFINITION:	The class value of the specified entity.
	ARGUMENTS:	Entity.	
	RETURNS:	Class value. '/
declare sub iEntityMaterialType(byval entity as iEntity,byval mtype as uinteger)
/'	DEFINITION:	The material type of the specified entity.
	ARGUMENTS:	Material type as EMT_MATERIAL_TYPES.	
	RETURNS:	None. '/
declare sub iEntityShaderMaterialType(byval entity as iEntity,byval mtype as uinteger)
/'	DEFINITION:	The shader material type of the specified entity.
	ARGUMENTS:	Material type.	
	RETURNS:	None. '/
declare sub iEntityMaterialFlag(byval entity as iEntity,byval flag as UInteger,byval mode as Boolean,byval index as integer=-1)
/'	DEFINITION:	The material flag of the specified entity.
	ARGUMENTS:	Material flag as EMF_MATERIAL_FLAG.	
	RETURNS:	None. '/
declare sub iEntityCullingType(byval entity as iENTITY, byval value as E_CULLING_TYPE)
/'	DEFINITION:	The culling type of the specified entity.
	ARGUMENTS:	Culling type as E_CULLING_TYPE.	
	RETURNS:	None. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Graphics.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iGraphicsWidth() as UInteger
/'	DEFINITION:	Current Graphics Width.
	ARGUMENTS:	None.	
	RETURNS:	Graphics Width. '/
declare function iGraphicsHeight() as UInteger
/'	DEFINITION:	Current Graphics Height.
	ARGUMENTS:	None.	
	RETURNS:	Graphics Height. '/
declare function iQueryFeature(byval feature as EVDF_VIDEO_FEATURE_QUERY ) as Boolean
/'	DEFINITION:	Query a graphics card feature.
	ARGUMENTS:	EVDF_VIDEO_FEATURE_QUERY feature type.	
	RETURNS:	True or False. '/
declare sub iDisableFeature(byval feature as EVDF_VIDEO_FEATURE_QUERY,byval flag as Boolean)
/'	DEFINITION:	Disable or enable the specified feature.
	ARGUMENTS:	EVDF_VIDEO_FEATURE_QUERY feature type and True or False.	
	RETURNS:	None. '/
declare sub iWritePixelFast(byval x as UInteger,byval y as UInteger,byval image as iImage=0)
/'	DEFINITION:	Write a pixel at X,Y of the specified image.
	ARGUMENTS:	X and Y location and image.	
	RETURNS:	None. '/
declare function iReadPixelFast(byval x as UInteger,byval y as UInteger,byval image as iImage=0) as UInteger
/'	DEFINITION:	Read a pixel at X,Y of the specified image.
	ARGUMENTS:	X and Y location and image.	
	RETURNS:	Pixel value. '/
declare sub iLine3D(byval xStart as Single,byval yStart as Single,byval zStart as Single,byval xEnd as Single,byval yEnd as Single,byval zEnd as Single)
/'	DEFINITION:	Draws a line in 3D space.
	ARGUMENTS:	Start X,Y,Z and End X,Y,Z location in world coordinates.	
	RETURNS:	None. '/
declare sub iPixel(byval x as UInteger,byval y as UInteger)
/'	DEFINITION:	Creates a pixel at X,Y of screen coordinates.
	ARGUMENTS:	X and Y location of the screen.	
	RETURNS:	None. '/
declare sub iRect(byval x as Integer,byval y as Integer,byval rWidth as Integer,byval rHeight as Integer,byval solid as boolean=false)
/'	DEFINITION:	Creates a Rectangle with specified dimensions.
	ARGUMENTS:	Dimensions and solid or not.	
	RETURNS:	None. '/
declare sub iLine(byval x1 as Integer,byval y1 as Integer,byval x2 as Integer,byval y2 as Integer)
/'	DEFINITION:	Draws a Line with specified dimensions.
	ARGUMENTS:	Dimensions.	
	RETURNS:	None. '/
declare sub iOval(byval x as Integer,byval y as Integer,byval radius as Single,byval solid as boolean = false)
/'	DEFINITION:	Creates an Oval with specified dimensions.
	ARGUMENTS:	Dimensions and solid or not.	
	RETURNS:	None. '/
declare sub iPoly(byval x as Integer,byval y as Integer,byval radius as Single,byval vertexCount as integer=10,byval solid as boolean=false)
/'	DEFINITION:	Creates a Polygon with specified dimensions.
	ARGUMENTS:	Dimensions and solid or not.	
	RETURNS:	None. '/
	
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_GUI.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare sub iGUIClear()
/'	DEFINITION:	Clears the GUI overlay.
	ARGUMENTS:	None.	
	RETURNS:	None. '/
declare sub iFreeGadget(byval gadget as iGadget)
/'	DEFINITION:	Deletes the specified gadget.
	ARGUMENTS:	Gadget.	
	RETURNS:	None. '/
declare function iGetGadgetText(byval gadget as iGadget) as WString ptr
/'	DEFINITION:	Returns the text of the specified gadget.
	ARGUMENTS:	Gadget.	
	RETURNS:	Text as string. '/
declare function iGetElementText(byval id as integer) as WString ptr
/'	DEFINITION:	Returns the text of the specified gadget element ID.
	ARGUMENTS:	Gadget element ID.	
	RETURNS:	Text as string. '/
declare Sub iSetGadgetText(byval gadget as iGadget,byval text as wstring ptr)
/'	DEFINITION:	Sets the text of the specified gadget.
	ARGUMENTS:	Gadget.	
	RETURNS:	None. '/
declare Sub iSetElementText(byval id as integer,byval text as wstring ptr)
/'	DEFINITION:	Sets the text of the specified gadget element ID.
	ARGUMENTS:	Gadget element.	
	RETURNS:	None. '/
declare function iCreateWindow(byval title as WString ptr,byval x as Integer,byval y as Integer, byval w as Integer,byval h as Integer,byval options as uinteger=1, byval parent as iGadget=0) as iGadget
/'	DEFINITION:	Creates a GUI window.
	ARGUMENTS:	Dimensions and options.
					1 - The window is modal
					2 - The window is dragable
					4 - The window close button is visible
					8 - The window maximize button is visible
				   16 - The window minimize button is visible	
	RETURNS:	Gadget handle. '/
declare sub iSetGadgetAlignment(byval element as iGadget,byval upperLeft as EGUI_ALIGNMENT,byval lowerRight as EGUI_ALIGNMENT,byval top as EGUI_ALIGNMENT,byval bottom as EGUI_ALIGNMENT)
/'	DEFINITION:	lets you control the automatic layout of a gadget when a window is resized by the user.
	ARGUMENTS:	Gadget and edge alignment mode.
					EGUIA_UPPERLEFT		Aligned to parent's top or left side (default)
					EGUIA_LOWERRIGHT	Aligned to parent's bottom or right side
					EGUIA_CENTER		Aligned to the center of parent
					EGUIA_SCALE			Aligned to scale of parent
	RETURNS:	None. '/
declare function iStaticText(byval text as WString ptr,byval x as Integer,byval y as integer, byval w as Integer,byval h as Integer,byval border as Boolean=FALSE,byval wordWrap as Boolean=FALSE, byval parent as iGadget=NULL) as iGadget
/'	DEFINITION:	Adds text to the GUI overlay.
	ARGUMENTS:	Dimensions and options.	
	RETURNS:	Gadget handle. '/
declare function iActivateGadget(byval element as iGadget) as boolean
/'	DEFINITION:	Sets the specified gadget as active.
	ARGUMENTS:	Gadget to activate.	
	RETURNS:	TRUE or FALSE. '/
declare function iCreateButton(byval label as WString ptr,byval x as Integer,byval y as Integer,byval w as Integer,byval h as Integer, byval id as Integer,byval tip as WString ptr=NULL, byval parent as iGadget=0) as iGadget
/'	DEFINITION:	Creates a button gadget.
	ARGUMENTS:	Dimensions and options.	
	RETURNS:	Gadget handle. '/
declare sub iSetButtonImage(byval button as iGadget,byval texture as iTexture,byval state as EGUI_BUTTON_IMAGE_STATE,byval tx as integer=0, byval ty as integer=0,byval bx as integer=0, byval by as integer=0)
/'	DEFINITION:	Assigns an image to the specified button gadget.
	ARGUMENTS:	Button gadget, the state and coordinates for image sheet.	
	RETURNS:	None. '/
declare sub iSetButtonSprite(byval button as iGadget, byval state as EGUI_BUTTON_STATE=EGBS_BUTTON_UP, byval index as integer, _loop as Boolean=false,byval scale as Boolean=false)
/'	DEFINITION:	*NOT YET IMPLEMENTED!
	ARGUMENTS:		
	RETURNS:	 '/
declare sub iButtonBorder(byval button as iGadget,byval border as Boolean)
/'	DEFINITION:	Adds a border to the specified button gadget.
	ARGUMENTS:	Button gadget and True or False.	
	RETURNS:	None. '/
declare function iButtonState(byval button as iGadget) as Boolean
/'	DEFINITION:	Returns the button state of the specified button gadget.
	ARGUMENTS:	Button gadget.	
	RETURNS:	True if pressed else False. '/
declare function iCreateScrollBar(byval horizontal as Boolean,byval x as Integer,byval y as Integer, byval w as Integer,byval h as Integer,byval id as Integer,byval spos as Integer, byval max as Integer,byval parent as iGadget=0 ) as iGadget
/'	DEFINITION:	Creates a scrollbar gadget.
	ARGUMENTS:	Scrollbar options.	
	RETURNS:	Gadget handle. '/
declare function iCreateListBox(byval x as Integer,byval y as Integer,byval w as Integer,byval h as Integer, byval id as Integer,byval AutoScroll as Boolean,byval background as Boolean,byval parent as iGadget=0) as iGadget
/'	DEFINITION:	Creates a listbox gadget.
	ARGUMENTS:	Listbox options.	
	RETURNS:	Gadget handle. '/
declare sub iGadgetSetAutoScroll(byval gadget as iGadget,byval AutoScroll as Boolean)
/'	DEFINITION:	Auto scroll text of specified gadget.
	ARGUMENTS:	Gadget and True or False.	
	RETURNS:	None. '/
declare sub iAddGadgetItem(byval gadget as iGadget,byval text as WString ptr)
/'	DEFINITION:	Adds a text item to the specified listbox gadget.
	ARGUMENTS:	Listbox gadget and text item.	
	RETURNS:	None. '/
declare sub iInsertGadgetItem(byval gadget as iGadget,byval text as WString ptr,byval index as UInteger)
/'	DEFINITION:	Adds a text item to the specified listbox gadget and specific index.
	ARGUMENTS:	Listbox gadget, text item and index.	
	RETURNS:	None. '/
declare sub iRemoveGadgetItem(byval gadget as iGadget,byval index as UInteger)
/'	DEFINITION:	Removes a text item from the specified listbox gadget.
	ARGUMENTS:	Listbox gadget and item index.	
	RETURNS:	None. '/
declare sub iSelectGadgetItem(byval gadget as iGadget,byval index as uinteger)
/'	DEFINITION:	Selects the specified text item, by index.
	ARGUMENTS:	Listbox gadget and item index.	
	RETURNS:	None. '/
declare function iSelectedGadgetItem(byval gadget as iGadget) as Integer
/'	DEFINITION:	Gets the specified text item, by index.
	ARGUMENTS:	Listbox gadget.	
	RETURNS:	Item index. '/
declare function iCountGadgetItems(byval gadget as iGadget) as Integer
/'	DEFINITION:	Gets the count of items in the listbox.
	ARGUMENTS:	Listbox gadget.	
	RETURNS:	Item count. '/
declare sub iClearGadgetItems(byval gadget as iGadget)
/'	DEFINITION:	Clears the specified listbox.
	ARGUMENTS:	Listbox gadget.	
	RETURNS:	None. '/
declare function iGadgetItemText(byval gadget as iGadget,byval index as uinteger) as CONST WString ptr 
/'	DEFINITION:	Gets the text of specified listbox item.
	ARGUMENTS:	Listbox gadget and item index.	
	RETURNS:	Text string. '/
declare function iCreateEditBox(byval text as WString ptr,byval x as Integer,byval y as Integer,byval w as Integer, byval h as Integer,byval id as Integer,byval border as Boolean,byval password as Boolean, byval parent as iGadget=0) as iGadget
/'	DEFINITION:	Creates an edit box with the specified parameters.
	ARGUMENTS:	Parameters.	
	RETURNS:	Gadget handle. '/
declare function iStaticImage(byval texture as iTexture,byval x as Integer,byval y as Integer,byval useAlpha as Boolean=TRUE, byval id as Integer=-1,byval parent as iGadget=NULL) as iGadget
/'	DEFINITION:	Adds a static image to the GUI template.
	ARGUMENTS:	Texture image and parameters.	
	RETURNS:	Gadget handle. '/
declare function iCreateCheckBox(byval text as WString ptr,byval x as Integer,byval y as Integer,byval w as Integer, byval h as Integer,byval id as Integer,byval checked as Boolean,byval parent as iGadget=0) as iGadget
/'	DEFINITION:	Creates a check box gadget.
	ARGUMENTS:	Check box parameters.	
	RETURNS:	Gadget handle. '/
declare sub iGadgetSetCheckBox(byval gadget as iGadget,byval checked as Boolean)
/'	DEFINITION:	Adds or removes a check in the specified check box.
	ARGUMENTS:	Check box gadget and true or false.	
	RETURNS:	None. '/
declare function iRequestFile(byval label as WString ptr,byval id as Integer,byval modal as Boolean, byval parent as iGadget=0) as iGadget
/'	DEFINITION:	Displays the file request GUI.
	ARGUMENTS:	Parameters.	
	RETURNS:	Gadget handle. '/
declare sub iSetGadgetFont(byval guifont as iFont)
/'	DEFINITION:	Sets the specified font active.
	ARGUMENTS:	Loaded xml font.	
	RETURNS:	None. '/
declare sub iSetElementColor(byval element as EGUI_DEFAULT_COLOR,byval r as integer,byval g as Integer,byval b as Integer,byval alpha as Integer)
/'	DEFINITION:	Sets the specified GUI elements color.
	ARGUMENTS:	The EGUI_DEFAULT_COLOR and RGBA.	
	RETURNS:	None. '/
declare function iNotify(byval mCaption as WString ptr, byval text as WString ptr, byval flag as EMBF_BUTTONS, byval parent as iGadget=0) as iGadget
/'	DEFINITION:	Text message and EMBF_BUTTONS buttons.
	ARGUMENTS:	The EGUI_DEFAULT_COLOR and RGBA.	
	RETURNS:	Gadget handle. '/
declare sub iShowGadget(byval gadget as iGadget)
/'	DEFINITION:	Shows the specified gadget.
	ARGUMENTS:	Gadget handle.	
	RETURNS:	None. '/
declare sub iHideGadget(byval gadget as iGadget)
/'	DEFINITION:	Hides the specified gadget.
	ARGUMENTS:	Gadget handle.	
	RETURNS:	None. '/
declare sub iEnableGadget(byval gadget as iGadget)
/'	DEFINITION:	Enables the specified gadget.
	ARGUMENTS:	Gadget handle.	
	RETURNS:	None. '/
declare sub iDisableGadget(byval gadget as iGadget)
/'	DEFINITION:	Disables the specified gadget.
	ARGUMENTS:	Gadget handle.	
	RETURNS:	None. '/
declare sub iWindowButtons(byval wind as iGadget, byval wclose as boolean=false, byval wmax as boolean=false, byval wmin as boolean=false)
/'	DEFINITION:	Sets which buttons are visible in a GUI Window.
	ARGUMENTS:	Window Gadget handle and True or False for close button, maximize button and minimize button.	
	RETURNS:	None. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Image.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iLoadImage(byval file as ZString ptr) as iImage
/'	DEFINITION:	Loads the specified image file.
	ARGUMENTS:	Image file.
	RETURNS:	Image handle. '/
declare function iCreateImage(byval x as UInteger,byval y as UInteger,byval format as ECF_COLOR_FORMAT) as iImage
/'	DEFINITION:	Loads the specified image file.
	ARGUMENTS:	Image file.
	RETURNS:	Image handle. '/
declare sub iFreeImage(byval image as iImage)
/'	DEFINITION:	Frees the specified image.
	ARGUMENTS:	Image.
	RETURNS:	None. '/
declare function iLockImage(byval image as iImage) as integer
/'	DEFINITION:	Locks the specified image.
	ARGUMENTS:	Image.
	RETURNS:	True on success. '/
declare sub iUnlockImage(byval image as iImage)
/'	DEFINITION:	Unlocks the specified image.
	ARGUMENTS:	Image.
	RETURNS:	None. '/
declare function iGrabImage(byval x as UInteger,byval y as uinteger,byval w as UInteger,byval h as UInteger) as iImage
/'	DEFINITION:	Grabs an image from the specified screen coordinates.
	ARGUMENTS:	Coordinates.
	RETURNS:	Image Handle. '/
declare function iImageWidth(byval image as iImage) as uinteger
/'	DEFINITION:	Gets the width of the specified image.
	ARGUMENTS:	Image.
	RETURNS:	Width as uinteger. '/
declare function iImageHeight(byval image as iImage) as uinteger
/'	DEFINITION:	Gets the height of the specified image.
	ARGUMENTS:	Image.
	RETURNS:	Height as uinteger. '/
declare function iImagePitch(byval image as iImage) as uinteger
/'	DEFINITION:	Gets the pitch of the specified image.
	ARGUMENTS:	Image.
	RETURNS:	Pitch as uinteger. '/
declare function iImageColorFormat(byval image as iImage) as uinteger
/'	DEFINITION:	Gets the color format of the specified image.
	ARGUMENTS:	Image.
	RETURNS:	Uinteger value of the color format. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Input.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iGetKey() as Integer
/'	DEFINITION:	Gets the last key pressed.
	ARGUMENTS:	None.
	RETURNS:	Value of last key pressed. '/
declare sub iWaitKey()
/'	DEFINITION:	Pauses until a key is pressed.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iKeyHit(byval key as integer) as integer
/'	DEFINITION:	The number of times the specified key has been hit.
	ARGUMENTS:	Key value.
	RETURNS:	Number of times. '/
declare function iKeyDown(byval key as integer) as integer
/'	DEFINITION:	Is the specified key down?
	ARGUMENTS:	Key value.
	RETURNS:	True if down. '/
declare sub iFlushKeys()
/'	DEFINITION:	Clears the keyboard buffer.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iMouseDown(byval button as integer) as integer
/'	DEFINITION:	Is the specified mouse button down?
	ARGUMENTS:	Button value.
	RETURNS:	True if down. '/
declare function iMouseHit(byval button as integer) as integer
/'	DEFINITION:	The number of times the specified button has been hit.
	ARGUMENTS:	Button value.
	RETURNS:	Number of times. '/
declare function iMouseXSpeed() as integer
/'	DEFINITION:	The speed at which the mouse traveled in the X direction.
	ARGUMENTS:	None.	*NOTE: NOT YET IMPLEMENTED!
	RETURNS:	Speed as float. '/
declare function iMouseYSpeed() as integer
/'	DEFINITION:	The speed at which the mouse traveled in the Y direction.
	ARGUMENTS:	None.	*NOTE: NOT YET IMPLEMENTED!
	RETURNS:	Speed as float. '/
declare function iMouseZSpeed() as single
/'	DEFINITION:	The speed at which the mouse wheel traveled.
	ARGUMENTS:	None.
	RETURNS:	Speed as float. '/
declare sub iFlushMouse()
/'	DEFINITION:	Clears the mouse buffer.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare sub iShowPointer()
/'	DEFINITION:	Shows the mouse pointer.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare sub iHidePointer()
/'	DEFINITION:	Hides the mouse pointer.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare sub iMoveMouse(byval x as integer, byval y as integer)
/'	DEFINITION:	Moves the mouse pointer to the X and Y screen position.
	ARGUMENTS:	X and Y coordinates.
	RETURNS:	None. '/
declare function iMouseX() as integer
/'	DEFINITION:	The current X coordinate of the mouse.
	ARGUMENTS:	None.
	RETURNS:	X screen coordinate. '/
declare function iMouseY() as integer
/'	DEFINITION:	The current Y coordinate of the mouse.
	ARGUMENTS:	None.
	RETURNS:	Y screen coordinate. '/
declare function iMouseZ() as integer
/'	DEFINITION:	The direction the mouse wheel is moving.
	ARGUMENTS:	None.
	RETURNS:	1 for forward, -1 for backwards or 0 for no movement. '/
'  GUI Input
declare function iGetLastSelectedFile() as wstring ptr
/'	DEFINITION:	Gets the last selected file from GUI window.
	ARGUMENTS:	None.
	RETURNS:	Stringname of file. '/
declare function iGUIEventAvailable() as Integer
/'	DEFINITION:	Checks for available GUI events.
	ARGUMENTS:	None.
	RETURNS:	True if events are buffered. '/
declare function iReadGUIEvent() as iGUI_EVENT PTR
/'	DEFINITION:	Reads the oldest GUI event from the event buffer.
	ARGUMENTS:	None.
	RETURNS:	iGUI_EVENT pointer. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Light.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare sub iAmbientLight(byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the ambient light of the 3D environment.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. '/
declare function iCreateVolumetricLight(byval footR as UInteger,byval footG as UInteger,byval footB as UInteger, byval tailR as UInteger,byval tailG as UInteger,byval tailB as UInteger, byval parent as iEntity=0) as iLIGHT
/'	DEFINITION:	Creates a volumetric light and adds it to the scene.
	ARGUMENTS:	Light foot and tail color.	
	RETURNS:	iLIGHT. '/
declare function iCreateLight(byval ltype as ELT_LIGHT_TYPE=ELT_POINT,byval parent as iEntity=0) as iLIGHT
/'	DEFINITION:	Creates the specified light type and adds it to the scene, default is ELT_POINT.
	ARGUMENTS:	Light type and parent.	
	RETURNS:	iLIGHT. '/
declare sub iLightColor(byval light as iLight,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the color of the specified light.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. '/
declare sub iLightAmbientColor(byval light as iLight,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the ambient color of the specified light.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. '/
declare sub iLightDiffuseColor(byval light as iLight,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the diffuse color of the specified light.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. '/
declare sub iLightSpecularColor(byval light as iLight,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Sets the specular color of the specified light.
	ARGUMENTS:	Red, green and blue values.
	RETURNS:	None. '/
declare sub iLightRange(byval light as iLight,byval constant as Single,byval linear as Single,byval quadratic as Single)
/'	DEFINITION:	Sets the range or distance of the specified light.
	ARGUMENTS:	Constant, linear and quadratic values default ( 0, 1.f/radius, 0 ).
	RETURNS:	None. '/
declare sub iLightFalloff(byval light as iLight,byval Falloff as Single)
/'	DEFINITION:	Sets the falloff rate of the specified light.
	ARGUMENTS:	Falloff values.
	RETURNS:	None. '/
declare sub iLightConeAngle(byval light as iLight,byval innercone as Single,byval outercone as Single)
/'	DEFINITION:	Sets the cone angle of the specified light.
	ARGUMENTS:	Inner and outer cone values.
	RETURNS:	None. '/
declare sub iLightRadius(byval light as iLight,byval Radius as single)
/'	DEFINITION:	Sets the radius of the specified light, default is 100.0.
				*NOTE: Setting the radius will also influence the attenuation, setting it to (0,1/radius,0).
						If you want to override this behavior, set the attenuation after the radius.
	ARGUMENTS:	Light type and new radius.	
	RETURNS:	None. '/
declare sub iLightType(byval light as iLight,byval ltype as UInteger)
/'	DEFINITION:	Sets the type of the specified light.
	ARGUMENTS:	Type value.
	RETURNS:	None. '/
declare function iLightCount() as UInteger
/'	DEFINITION:	Current count of light entities.
	ARGUMENTS:	None.
	RETURNS:	count of lights. '/
	
 '----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Materials.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare sub iMaterialVertexColorAffects(byval material as iMaterial,byval colorMaterial as ECM_COLOR_MATERIAL)
/'	DEFINITION:	Sets the material color affects.
	ARGUMENTS:	Material and ECM_COLOR_MATERIAL.
	RETURNS:	None. '/
declare sub iMaterialShininess(byval material as iMaterial,byval shininess as Single)
/'	DEFINITION:	Sets the material Shininess.
	ARGUMENTS:	Material and shininess level.
	RETURNS:	None. '/
declare sub iMaterialSpecularColor(byval material as iMaterial,byval r as UInteger, byval g as UInteger,byval b as UInteger,byval a as UInteger)
/'	DEFINITION:	Sets the material specular color.
	ARGUMENTS:	Material and RGBA color.
	RETURNS:	None. '/
declare sub iMaterialDiffuseColor(byval material as iMaterial,byval r as UInteger, byval g as UInteger,byval b as UInteger,byval a as UInteger)
/'	DEFINITION:	Sets the material diffuse color.
	ARGUMENTS:	Material and RGBA color.
	RETURNS:	None. '/
declare sub iMaterialAmbientColor(byval material as iMaterial,byval r as UInteger, byval g as UInteger,byval b as UInteger,byval a as UInteger)
/'	DEFINITION:	Sets the material ambient color.
	ARGUMENTS:	Material and RGBA color.
	RETURNS:	None. '/
declare sub iMaterialEmissiveColor(byval material as iMaterial,byval r as UInteger, byval g as UInteger,byval b as UInteger,byval a as UInteger)
/'	DEFINITION:	Sets the material emissive color.
	ARGUMENTS:	Material and RGBA color.
	RETURNS:	None. '/
declare sub iMaterialTypeParam(byval material as iMaterial,byval pvalue as single)
/'	DEFINITION:	Sets the material type parameter value.
	ARGUMENTS:	Material and value.
	RETURNS:	None. '/
declare sub iMaterialBlend(byval material as iMaterial,byval blendSrc as EBF_BLEND_FACTOR,byval blendDest as EBF_BLEND_FACTOR)
/'	DEFINITION:	Sets the material blend factor.
	ARGUMENTS:	Material and blend factor.
	RETURNS:	None. '/
declare sub iMaterialLineThickness(byval material as iMaterial,byval lineThickness as Single)
/'	DEFINITION:	Sets the material line thickness.
	ARGUMENTS:	Material and thickness as single.
	RETURNS:	None. '/
declare function iMaterialCount(byval entity as iEntity) as UInteger
/'	DEFINITION:	Material count of the specified entity.
	ARGUMENTS:	iENTITY.
	RETURNS:	Count as uinteger. '/
declare function iGetMaterial(byval entity as iEntity,byval index as UInteger) as iMaterial
/'	DEFINITION:	Grabs the material index of the specified iENTITY.
	ARGUMENTS:	iENTITY and index value.
	RETURNS:	iMATERIAL. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Math.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iCurveValue(byval nvalue as single,byval ovalue as Single,byval increment as Single) as Single
/'	DEFINITION:	Curves the value with the specified parameters.
	ARGUMENTS:	The new and old value and increment.
	RETURNS:	Value as single. '/
declare function iWrapValue(byval invalue as Single,byval min as Single,byval max as Single) as Single
/'	DEFINITION:	Wraps the value with the specified parameters.
	ARGUMENTS:	The min and max values.
	RETURNS:	Value as single. '/
declare function iClampValue(byval invalue as Single,byval low as Single,byval high as Single) as Single
/'	DEFINITION:	Clamps the value with the specified parameters.
	ARGUMENTS:	The low and high values.
	RETURNS:	Value as single. '/
declare function iMin(byval value1 as Single,byval value2 as Single) as Single
/'	DEFINITION:	The minimum of two values.
	ARGUMENTS:	Value one and value two.
	RETURNS:	Minimum value as single. '/
declare function iMax(byval value1 as Single,byval value2 as Single) as Single
/'	DEFINITION:	The maximum of two values.
	ARGUMENTS:	Value one and value two.
	RETURNS:	Maximum value as single. '/
declare function iDistance2D(byval x1 as Single,byval y1 as Single,byval x2 as Single,byval y2 as Single) as Single
/'	DEFINITION:	The distance between two 2D coordinates.
	ARGUMENTS:	The X and Y coordinates of both points.
	RETURNS:	Distance as single. '/
declare function iDistance3D(byval x1 as Single,byval y1 as Single,byval z1 as Single,byval x2 as Single, byval y2 as Single,byval z2 as Single) as Single
/'	DEFINITION:	The distance between two 3D coordinates.
	ARGUMENTS:	The X, Y and Z coordinates of both points.
	RETURNS:	Distance as single. '/
declare function iRand(byval min as Integer,byval max as Integer) as Integer
/'	DEFINITION:	Generates an integer random number.
	ARGUMENTS:	Minimum and maximum values.
	RETURNS:	Random integer. '/
declare function iRnd(byval min as single,byval max as single) as single
/'	DEFINITION:	Generates a float random number.
	ARGUMENTS:	Minimum and maximum values.
	RETURNS:	Random float. '/
declare sub iSeedRand(byval seed as Integer)
/'	DEFINITION:	Seeds the random number generator.
	ARGUMENTS:	Seed value.
	RETURNS:	None. '/
declare function iARGB(byval a as uinteger, byval r as uinteger, byval g as uinteger, byval b as uinteger) as uinteger
/'	DEFINITION:	Converts individual ARGB values to a single integer value.
	ARGUMENTS:	Alpha, red, green and blue values.
	RETURNS:	ARGB integer value. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_MD2.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iLoadMD2(byval cptrFile as ZString ptr,byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Loads an MD2 model from file.
	ARGUMENTS:	Filename of MD2 and optional parent.
	RETURNS:	iENTITY pointer. '/
declare sub iAnimateMD2(byval entity as iEntity,byval mode as uInteger,byval speed as Single,byval first_frame as Integer, byval last_frame as Integer,byval transition as Single)
/'	DEFINITION:	Animates an MD2 model.
	ARGUMENTS:	Entity, mode(0= 1 time, 1= Loop), speed, start frame, end frame and transition value.
	RETURNS:	None. '/
declare sub iPlayMD2Animation(byval entity as iEntity,byval animation as EMD2_ANIMATION_TYPE)
/'	DEFINITION:	Animates an MD2 model based on EMD2_ANIMATION_TYPE.
	ARGUMENTS:	Entity and EMD2_ANIMATION_TYPE.
	RETURNS:	None. '/
declare function iMD2AnimTime(byval entity as iEntity) as Single
/'	DEFINITION:	MD2 animation animation time.
	ARGUMENTS:	Entity.
	RETURNS:	Animation time as single. '/
declare function iMD2AnimLength(byval entity as iEntity) as UInteger
/'	DEFINITION:	MD2 animation animation length.
	ARGUMENTS:	Entity.
	RETURNS:	Animation length as single. '/
declare function iMD2Animating(byval entity as iEntity) as Boolean
/'	DEFINITION:	Checks if MD2 is currently animating.
	ARGUMENTS:	Entity.
	RETURNS:	True if animating. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Mesh.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iMeshHeight(byval entity as iEntity) as single
/'	DEFINITION:	The height of the specified mesh entity.
	ARGUMENTS:	iENTITY.
	RETURNS:	Height as single. '/
declare function iMeshWidth(byval entity as iEntity) as single
/'	DEFINITION:	The width of the specified mesh entity.
	ARGUMENTS:	iENTITY.
	RETURNS:	Width as single. '/
declare function iMeshDepth(byval entity as iEntity) as single
/'	DEFINITION:	The depth of the specified mesh entity.
	ARGUMENTS:	iENTITY.
	RETURNS:	Depth as single. '/
declare function iCreateCube(byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Creates a cube entity.
	ARGUMENTS:	Parent if needed.
	RETURNS:	iENTITY handle. '/
declare function iCreateSphere(byval polyCount as Integer=16,byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Creates a sphere entity.
	ARGUMENTS:	Poly count an parent if needed.
	RETURNS:	iENTITY handle. '/
declare function iCreateCylinder(byval tesselation as UInteger,byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Creates a cylinder entity.
	ARGUMENTS:	Tesselation and parent if needed.
	RETURNS:	iENTITY handle. '/
declare function iCreateCone(byval tesselation as UInteger,byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Creates a cone entity.
	ARGUMENTS:	Tesselation and parent if needed.
	RETURNS:	iENTITY handle. '/
declare function iCreatePlane(byval parent as iEntity=0,byval size as Single=10000.0,byval tileCount as UInteger=1) as iEntity
/'	DEFINITION:	Creates a plane entity.
	ARGUMENTS:	Parent if needed size and tile count.
	RETURNS:	iENTITY handle. '/
declare function iCreateQuad(byval size as single = 10.0,byval parent as iENTITY=0) as iENTITY
/'	DEFINITION:	Creates a quad entity.
	ARGUMENTS:	Size and parent if needed.
	RETURNS:	iENTITY handle. '/
declare function iWriteMesh(byval mesh as iMesh,byval mtype as UInteger,byval filename as ZString ptr) as UInteger
/'	DEFINITION:	Mesh writer, 0=IRR(.irrmesh),1=COLLADA(.dae or.xml),2=STL(.stl),3=OBJ(.obj),4=PLY(.ply),
				5=BLITZ(.b3d)
	ARGUMENTS:	Mesh Entity, save type and filename.
	RETURNS:	0 writer failed, 1 file failed, 2 no valid mesh, 3 success. '/
declare sub iClearUnusedMeshes()
/'	DEFINITION:	Clears all unused meshes from the mesh buffer.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare sub iFreeMesh(byval mesh as iMesh)
/'	DEFINITION:	Frees the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	None. '/
declare sub iMeshTexture(byval mesh as iMesh,byval texture as iTexture,byval index as uinteger,byval iBuffer as uinteger)
/'	DEFINITION:	Textures the specified mesh.
	ARGUMENTS:	Mesh, texture, index and buffer.
	RETURNS:	None. '/
declare sub iNameMesh(byval mesh as iMesh,byval mname as ZString ptr)
/'	DEFINITION:	Names the specified mesh.
	ARGUMENTS:	iMESH and name.
	RETURNS:	None. '/
declare function iCopyMesh(byval mesh as iMesh) as iMesh
/'	DEFINITION:	Copies the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	iMESH handle. '/
declare sub iOutlineMesh(byval mesh as iEntity,byval lWidth as single,byval red as uinteger,byval green as UInteger,byval blue as UInteger)
/'	DEFINITION:	Adds an outline to the specified mesh.
	ARGUMENTS:	iMesh, line width and line color.
	RETURNS:	None. '/
declare function iFlipMesh(byval mesh as iMesh) as boolean
/'	DEFINITION:	Flips the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	True on success. '/
declare function iFlipEntityMesh(byval entity as iEntity) as boolean
/'	DEFINITION:	Flips the mesh of the specified entity.
	ARGUMENTS:	iENTITY handle.
	RETURNS:	True on success. '/
declare sub iScaleMesh(byval mesh as iMesh,byval xScale as single,byval yScale as single,byval zScale as single,byval iMeshBuffer as UInteger=0,byval sourceMesh as iMesh=0)
/'	DEFINITION:	Set the scale of the specified mesh.
	ARGUMENTS:	iMESH handle and parameters.
	RETURNS:	None. '/
declare function iCreateMesh(byval cptrMeshName as ZString ptr,byval iVertexCount as UInteger,byval vVertices as iVERTEX, byval iIndicesCount as UInteger,byval usIndices as UInteger) as iMesh
/'	DEFINITION:	Creates a mesh with the specified parameters.
	ARGUMENTS:	iMESH parameters.
	RETURNS:	iMESH handle. '/
declare function iLoadMesh(byval cptrFile as ZString ptr) as iMesh
/'	DEFINITION:	Loads a mesh from the specified file.
	ARGUMENTS:	Mesh file.
	RETURNS:	iMESH handle. '/
declare function iLoadMeshEntity(byval cptrFile as ZString ptr,byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Loads a mesh entity from the specified file.
	ARGUMENTS:	Mesh file.
	RETURNS:	iENTITY handle. '/
declare function iGetEntityMesh(byval entity as iEntity) as iMesh
/'	DEFINITION:	Gets the mesh from the specified entity.
	ARGUMENTS:	iENTITY handle.
	RETURNS:	iMESH handle. '/
declare function iLoadAnimMesh(byval cptrFile as ZString ptr,byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Loads an animated mesh entity from the specified file.
	ARGUMENTS:	Mesh file.
	RETURNS:	iENTITY handle. '/
declare function iCreateHillPlaneMesh(byval meshname as ZString ptr,byval tileSizeX as single,byval tileSizeY as Single, byval tileCountX as UInteger,byval tileCountY as UInteger,byval material as iMaterial, byval hillHeight as single, byval countHillsX as single,byval countHillsY as single, byval textureRepeatCountX as single,byval textureRepeatCountY as Single) as iMesh
/'	DEFINITION:	Creates a hill plane mesh with the specified parameters.
	ARGUMENTS:	Hill plane mesh parameters.
	RETURNS:	iMESH handle. '/
declare function iAddMeshToScene(byval mesh as iMesh) as iEntity
/'	DEFINITION:	Adds the specified mesh to the secen as an entity.
	ARGUMENTS:	iMESH handle.
	RETURNS:	iENTITY handle. '/
declare function iStaticMeshForNormalMapping(byval mesh as iMesh) as iEntity
/'	DEFINITION:	Preps the specified mesh for normal mapping.
	ARGUMENTS:	iMESH handle.
	RETURNS:	iENTITY handle. '/
declare sub iHWAcceleratedMesh(byval mesh as iMesh,byval iFrame as Integer=0)
/'	DEFINITION:	Marks the specified mesh for hardware exceleration.
	ARGUMENTS:	iMESH handle and frame if needed.
	RETURNS:	None. '/
declare sub iHWAcceleratedMeshEntity(byval entity as iEntity,byval iFrame as Integer=0)
/'	DEFINITION:	Marks the specified mesh entity for hardware exceleration.
	ARGUMENTS:	iENTITY handle and frame if needed.
	RETURNS:	None. '/
declare function iMeshFrameCount(byval mesh as iMesh) as UInteger
/'	DEFINITION:	Gets the frame count of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	Frame count. '/
declare function iMeshBufferCount(byval mesh as iMesh,byval iFrame as Integer) as UInteger
/'	DEFINITION:	Gets the buffer count of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	Buffer count. '/
declare function iMeshIndexCount(byval mesh as iMesh,byval iFrame as Integer,byval iMeshBuffer as UInteger = 0) as UInteger
/'	DEFINITION:	Gets the index count of the specified mesh.
	ARGUMENTS:	iMESH handle, frame and mesh buffer.
	RETURNS:	Index count. '/
declare sub iGetMeshIndices( byval mesh as iMesh, byval frame as integer, byref indicies as ushort, byval meshBuffer as integer = 0 )
/'	DEFINITION:	Gets the mesh indices of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	None. '/
declare sub iSetMeshIndices( byval mesh as iMesh, byval frame as integer, byref indicies as ushort, byval meshBuffer as integer = 0 )
/'	DEFINITION:	Sets the mesh indices of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	As indicies. '/
declare function iMeshVertexCount(byval mesh as iMesh,byval iFrame as Integer,byval iMeshBuffer as UInteger = 0) as UInteger
/'	DEFINITION:	Gets the mesh vertex count of the specified mesh.
	ARGUMENTS:	iMESH handle, frame and buffer.
	RETURNS:	Vertex count. '/
declare function iGetMeshVertexMemory(byval mesh as iMesh,byval frame as integer = 0,byval meshBuffer as integer = 0 ) as any ptr
/'	DEFINITION:	Gets the vertex memory to the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	Pointer to vertex memory. '/
declare sub iGetMeshVertices(byval mesh as iMesh,byval frame as integer,byref verticies as iVERTEX,byval meshBuffer as integer = 0 )
/'	DEFINITION:	Gets the mesh vertices of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	As verticies. '/
declare sub iSetMeshVertices(byval mesh as iMesh,byval frame as integer,byref verticies as iVERTEX,byval meshBuffer as integer = 0 )
/'	DEFINITION:	Sets the mesh vertices of the specified mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	None. '/
declare sub iMeshBoundingBox(byval mesh as iMesh,byref minx as Single,byref miny as Single,byref minz as Single, byref maxx as Single,byref maxy as Single,byref maxz as single)
/'	DEFINITION:	Sets the specified mesh's bounding box.
	ARGUMENTS:	iMESH handle and dimensions.
	RETURNS:	None. '/
declare function iMeshCount() as UInteger
/'	DEFINITION:	Gets the current engine mesh count.
	ARGUMENTS:	None.
	RETURNS:	Mesh count. '/
declare function iLoadMeshBSP(byval cptrFile as ZString ptr) as iMesh
/'	DEFINITION:	Loads a mesh BSP from the specified file.
	ARGUMENTS:	BSP mesh file.
	RETURNS:	iMESH handle. '/
declare function iCreateEntityBSPfromMeshBSP(byval vptrMesh as iMesh) as iEntity
/'	DEFINITION:	Creates an entity mesh from a BSP mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	iENTITY handle. '/
declare sub iStaticCollisionsBSP(byval meshBSP as iMesh,byval entityBSP as iEntity,byval entity as iEntity, byval radiusx as Single,byval radiusy as Single,byval radiusz as Single,byval gravityx as Single, byval gravityy as Single,byval gravityz as Single,byval offsetx as single,byval offsety as Single, byval offsetz as Single)
/'	DEFINITION:	Creates static collision for specified BSP mesh.
	ARGUMENTS:	iMESH handle.
	RETURNS:	None. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Network.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iRN_Version() as ZString ptr
/'	DEFINITION:	Gets the Raknet version.
	ARGUMENTS:	None.
	RETURNS:	Version. '/
declare function iRN_Init() as Integer
/'	DEFINITION:	Initializes the Raknet interface.
	ARGUMENTS:	None.
	RETURNS:	True on success. '/
declare function iRN_StartServer(byval maxConnections as UInteger,byval localPort as UInteger,byval password as ZString ptr=NULL) as Integer
/'	DEFINITION:	Attempt to start Raknet as Server.
	ARGUMENTS:	Server parameters.
	RETURNS:	TRUE or FALSE. Will return -1 if Raknet itself fails to startup Server. '/
declare function iRN_StartClient() as Integer
/'	DEFINITION:	Attempt to start Raknet as client.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. Will return -1 if Raknet itself fails to startup Client. '/
declare function iRN_GetMyIP() as CONST zstring ptr
/'	DEFINITION:	Gets local IP.
	ARGUMENTS:	None.
	RETURNS:	Local IP as string. '/
declare function iRN_GetMyGUID() as CONST zstring ptr
/'	DEFINITION:	Gets local internal GUID.
	ARGUMENTS:	None.
	RETURNS:	Local GUID as string. '/
declare function iRN_Connect(byval host as ZString ptr,byval remotePort as UInteger,byval password as ZString ptr=NULL, byval blocking as Boolean=false) as Integer
/'	DEFINITION:	For Client, attempts to connect to a server, if blocking is TRUE, program
				will wait for connection message else you must process yourself.
	ARGUMENTS:	Connection parameters.
	RETURNS:	TRUE or FALSE, if blocking is FALSE, this will return TRUE always. '/
declare function iRN_CloseConnection(byval notify as Boolean=true) as boolean
/'	DEFINITION:	For Client, closes current connection.
	ARGUMENTS:	True to send disconnect message.
	RETURNS:	TRUE or FALSE. '/
declare function iRN_Shutdown(byval waitTimeMS as uInteger=100) as boolean
/'	DEFINITION:	Shutdown Raknet. *YOU MUST RUN THIS BEFORE EXITING YOUR APP IF YOU USED iRN_Init()! 
	ARGUMENTS:	Shutdown delay.
	RETURNS:	TRUE or FALSE. '/
declare function iRN_CheckMessages() as boolean
/'	DEFINITION:	Check Message Queue, returns True if messages are waiting.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. '/
declare function iRN_ClearMessage() as boolean
/'	DEFINITION:	Clears the current Message from the receive queue.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. '/
declare function iRN_ForwardMessage() as Boolean
/'	DEFINITION:	For Server only, forwards the active received Message.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. '/
declare function iRN_DisconnectPlayer(byval playerID as Integer,byval notify as Boolean=true) as boolean
/'	DEFINITION:	For Server only, disconnects a player.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. '/
declare function iRN_GetMyID() as Integer
/'	DEFINITION:	Returns my Player ID.
	ARGUMENTS:	None.
	RETURNS:	Player ID. '/
declare function iRN_GetPlayerID() as Integer
/'	DEFINITION:	For Server only, returns Player ID for current Message.
	ARGUMENTS:	None.
	RETURNS:	1 or greater for player ID or FALSE for failure. '/
declare function iRN_GetDisconnectID() as Integer
/'	DEFINITION:	For Server only, returns Player ID for last player disconnect.
	ARGUMENTS:	None.
	RETURNS:	Player ID. '/
declare function iRN_GetTotalConnections() as UInteger
/'	DEFINITION:	For Server only, returns current connected player count.
	ARGUMENTS:	None.
	RETURNS:	Current total connections. '/
declare function iRN_GetTime() as Integer
/'	DEFINITION:	Gets Raknet internal clock.
	ARGUMENTS:	None.
	RETURNS:	Clock value. '/
declare function iRN_Active() as Boolean
/'	DEFINITION:	Returns if Raknet is currently initialized.
	ARGUMENTS:	None.
	RETURNS:	TRUE or FALSE. '/
declare function iRN_PingHost(byval host as ZString ptr,byval remotePort as UInteger) as Integer
/'	DEFINITION:	*NOT YET IMPLEMENTED!
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iRN_GetAveragePing(byval playerID as Integer) as Integer
/'	DEFINITION:	For Server only, returns average ping for specified player.
	ARGUMENTS:	Player ID.
	RETURNS:	Ping value. '/
declare function iRN_GetLastPing(byval playerID as Integer) as Integer
/'	DEFINITION:	For Server only, returns last ping for specified player.
	ARGUMENTS:	Player ID.
	RETURNS:	Ping value. '/
declare function iRN_GetLowestPing(byval playerID as Integer) as Integer
/'	DEFINITION:	For Server only, returns specified players lowest ping.
	ARGUMENTS:	Player ID.
	RETURNS:	Ping value. '/
declare sub iRN_AddToBanList(byval ip as ZString ptr,byval milliseconds as Integer=60000)
/'	DEFINITION:	For Server only, Adds an IP Address to the BAN LIST.
	ARGUMENTS:	IP to add.
	RETURNS:	None. '/
declare sub iRN_RemoveFromBanList(byval ip as ZString ptr)
/'	DEFINITION:	For Server only, removes and IP Address from the BAN LIST.
	ARGUMENTS:	IP to remove.
	RETURNS:	None. '/
declare sub iRN_ClearBanList()
/'	DEFINITION:	For Server only, clears the internal BAN LIST.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare function iRN_IsBanned(byval ip as ZString ptr) as Boolean
/'	DEFINITION:	For Server only, check if a specific IP Address is currently BANNED.
	ARGUMENTS:	IP to check.
	RETURNS:	TRUE or FALSE. '/
declare function iRN_SendMessage(byval playerID as Integer,byval priority as Integer,byval reliability as Integer, byval orderingChannel as Integer=0,byval broadcast as Boolean=true) as Integer
/'	DEFINITION:	Send current message.
	ARGUMENTS:	PID and send parameters.
	RETURNS:	Raknet's Result. '/
declare sub iRN_SendTimeStamp()
/'	DEFINITION:	Add this immediately after Message Type (RN_SendByte) when you want a timestamped message.
	ARGUMENTS:	None.
	RETURNS:	None. '/
declare sub iRN_SendByte(byval bValue as Byte)
/'	DEFINITION:	Send a Byte of Data.
	ARGUMENTS:	Byte value.
	RETURNS:	None. '/
declare sub iRN_SendInt(byval iValue as integer)
/'	DEFINITION:	Send a Integer of Data.
	ARGUMENTS:	Integer value.
	RETURNS:	None. '/
declare sub iRN_SendFloat(byval fValue as Single)
/'	DEFINITION:	Send a Float(single) of Data.
	ARGUMENTS:	Float value.
	RETURNS:	None. '/
declare sub iRN_SendString(byval sValue as CONST zstring ptr)
/'	DEFINITION:	Send a string of data (* Max length of 254).
	ARGUMENTS:	String value.
	RETURNS:	None. '/
declare function iRN_GetTimeStamp() as integer
/'	DEFINITION:	Returns translated timestamp of current message, this is cleard with the message (RN_ClearMessage).
	ARGUMENTS:	None.
	RETURNS:	Timestamp value. '/
declare function iRN_GetByte() as Byte
/'	DEFINITION:	Returns a Byte of data from current message.
	ARGUMENTS:	None.
	RETURNS:	Byte value. '/
declare function iRN_GetInt() as Integer
/'	DEFINITION:	Returns a Integer of data from current message.
	ARGUMENTS:	None.
	RETURNS:	Integer value. '/
declare function iRN_GetFloat() as Single
/'	DEFINITION:	Returns a Float(single) of data from current message.
	ARGUMENTS:	None.
	RETURNS:	Float value. '/
declare function iRN_GetString() as CONST zstring ptr
/'	DEFINITION:	Returns a String of data from current message.
	ARGUMENTS:	None.
	RETURNS:	String value. '/
declare function iCreateSpline() as uinteger
/'	DEFINITION:	Initializes a new spline handle.
	ARGUMENTS:	None.
	RETURNS:	Spline ID. '/
declare function iFreeSpline(byval splineID as UInteger) as boolean
/'	DEFINITION:	Free's a spline handle and data.
	ARGUMENTS:	Spline ID.
	RETURNS:	TRUE on success. '/
declare function iGetSplineX(byval splineID as uinteger,byval timeMS as Single) as Single
/'	DEFINITION:	Gets the X value of the specified spline and time.
	ARGUMENTS:	Spline ID and ms value.
	RETURNS:	Value of X at the supplied time. '/
declare function iGetSplineY(byval splineID as uinteger,byval timeMS as Single) as Single
/'	DEFINITION:	Gets the Y value of the specified spline and time.
	ARGUMENTS:	Spline ID and ms value.
	RETURNS:	Value of Y at the supplied time. '/
declare function iGetSplineZ(byval splineID as uinteger,byval timeMS as Single) as Single
/'	DEFINITION:	Gets the Z value of the specified spline and time.
	ARGUMENTS:	Spline ID and ms value.
	RETURNS:	Value of Z at the supplied time. '/
declare sub iInit2DSpline(byval splineID as UInteger,byval StartX as Single,byval StartY as Single,byval Ctrl1X as Single, byval Ctrl1Y as Single,byval Ctrl2X as Single,byval Ctrl2Y as Single,byval EndX as Single,byval EndY as Single)
/'	DEFINITION:	Initialize a 2D spline with the supplied data.
	ARGUMENTS:	Spline ID, start, control and end values.
	RETURNS:	None. '/
declare sub iInit3DSpline(byval SplineID as UInteger,byval StartX as Single,byval StartY as Single,byval StartZ as Single, byval Ctrl1X as Single,byval Ctrl1Y as Single,byval Ctrl1Z as Single,byval Ctrl2X as Single,byval Ctrl2Y as Single,byval Ctrl2Z as Single, byval EndX as Single,byval EndY as Single,byval EndZ as Single)
/'	DEFINITION:	Initialize a 3D spline with the supplied data.
	ARGUMENTS:	Spline ID, start, control and end values.
	RETURNS:	None. '/
declare function iExtrapolatePoint(byval timeMS as single,byval initPos as Single,byval vel as Single,byval accel as Single=0, byval maxvel as Single=0) as Single
/'	DEFINITION:	Calculates where an object would be after the time specified.
	ARGUMENTS:	Time in ms and control values.
	RETURNS:	Point value. '/
declare function iGetTotalSplines() as UInteger
/'	DEFINITION:	Gets the total number of active splines.
	ARGUMENTS:	None.
	RETURNS:	Spline count. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Particles.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iCreateParticleSystem( ByVal add_emitter As Boolean=false, ByVal parent As iEntity = 0) As iPARTICLE_SYSTEM
/'	DEFINITION:	Creates a particle system.
	ARGUMENTS:	System parameters.
	RETURNS:	iPARTICLE_SYSTEM handle. '/
declare sub iParticleSize( byval particle_emitter as iEMITTER, byval x as single, byval y as single )
/'	DEFINITION:	Sets the X and Y size of the specified emitter.
	ARGUMENTS:	iEMITTER and X and Y size.
	RETURNS:	None. '/
declare sub iParticleMinSize( byval particle_emitter as iEMITTER, byval X as single, byval Y as single )
/'	DEFINITION:	Sets the minimum size of the specified emitter.
	ARGUMENTS:	iEMITTER and minimum X and Y size.
	RETURNS:	None. '/
declare sub iParticleMaxSize( byval particle_emitter as iEMITTER, byval X as single, byval Y as single )
/'	DEFINITION:	Sets the maximum size of the specified emitter.
	ARGUMENTS:	iEMITTER and maximum X and Y size.
	RETURNS:	None. '/
declare function iCreateParticleEmitter( byval particle_system as iPARTICLE_SYSTEM, byVAL settings as iPARTICLE_SETTINGS ) as iEMITTER
/'	DEFINITION:	Creates a particle emitter.
	ARGUMENTS:	Particle system and iPARTICLE_SETTINGS array.
	RETURNS:	iEMITTER handle. '/
declare function iCreateAnimatedEntityEmitter( byval particle_system as iPARTICLE_SYSTEM, byval entity as iEntity, byval use_normal_direction as uinteger, byval normal_direction_modifier as single, byval emit_from_every_vertex as integer, byval settings as iPARTICLE_SETTINGS ) as iEMITTER
/'	DEFINITION:	Creates a animated mesh entity particle emitter.
	ARGUMENTS:	Particle system, entity and iPARTICLE_SETTINGS array.
	RETURNS:	iEMITTER handle. '/
declare function iCreateFadeOutAffector( byval particle_system as iPARTICLE_SYSTEM, byval fade_speed as uinteger, byval fade_to_red as uinteger, byval fade_to_green as uinteger, byval fade_to_blue as uinteger ) as iAffector
/'	DEFINITION:	Creates a fading affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. '/
declare function iCreateGravityAffector( ByVal particle_system As iPARTICLE_SYSTEM, ByVal x As Single, ByVal y As Single, ByVal z As Single, ByVal timeForceLost As uInteger = 1000 ) as iAffector
/'	DEFINITION:	Creates a gravity affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. '/
declare function iCreateAttractionAffector( ByVal particle_system As iPARTICLE_SYSTEM, ByVal x As Single, ByVal y As Single, ByVal z As Single, ByVal speed As Single = 1.0, ByVal attract as uinteger = 1, ByVal affectX as uinteger = 1, ByVal affectY as uinteger = 1, ByVal affectZ as uinteger = 1 ) as iAffector
/'	DEFINITION:	Creates a attracting affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. '/
declare function iCreateRotationAffector( ByVal particle_system As iPARTICLE_SYSTEM, ByVal Speed_X As Single, ByVal Speed_Y As Single, ByVal Speed_Z As Single, ByVal pivot_X As Single, ByVal pivot_Y As Single, ByVal pivot_Z As Single ) as iAffector
/'	DEFINITION:	Creates a rotation affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. '/
declare function iCreateStopAffector( ByVal particle_system As iPARTICLE_SYSTEM,ByVal run_time as uinteger, ByVal target_emitter as iEMITTER ) as iAffector
/'	DEFINITION:	Creates a stop affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. '/
declare function iCreatePushAffector(ByVal particle_system as iPARTICLE_SYSTEM,ByVal x as single, ByVal y as single, ByVal z as single, ByVal speedX as single, ByVal speedY as single, ByVal speedZ as single, ByVal far as single, ByVal near as single, ByVal column as single, ByVal radial as integer ) as iAffector
/'	DEFINITION:	Creates a push affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. '/
declare function iCreateColorAffector(ByVal particle_system as iPARTICLE_SYSTEM, ByVal num as uinteger, ByVal particlecolors as uinteger ptr, ByVal particletimes as uinteger ptr, byVal smooth as uinteger ) as iAffector
/'	DEFINITION:	Creates a color affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. '/
declare function iCreateSplineAffector(ByVal particle_system as iPARTICLE_SYSTEM,ByVal VertexCount as uinteger, ByVal verticies as iVERTEX ptr,ByVal speed as single,ByVal tightness as single,ByVal attraction as single, ByVal deleteAtEnd as uinteger ) as iAffector
/'	DEFINITION:	Creates a spline affector on a particle system.
	ARGUMENTS:	Particle system and parameters.
	RETURNS:	iAFFECTOR handle. '/
declare sub iFreeAffectors( byval particle_system as iPARTICLE_SYSTEM )
/'	DEFINITION:	Free's all the Affectors applied to the specified iPARTICLE_SYSTEM.
	ARGUMENTS:	Particle system.
	RETURNS:	None. '/
declare sub iEmitterDirection( byval emitter As iEMITTER, byval x as single, byval y as single, byval z as single )
/'	DEFINITION:	Sets the direction of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. '/
declare sub iEmitterMinPPS( byval emitter As iEMITTER, byval minPPS as uinteger )
/'	DEFINITION:	Sets the minimum particles per second of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. '/
declare sub iEmitterMaxPPS( byval emitter As iEMITTER, byval maxPPS as uinteger )
/'	DEFINITION:	Sets the maximum particles per second of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. '/
declare sub iEmitterMinStartColor( byval emitter As iEMITTER, byval Red as uinteger, byval Green as uinteger, byval Blue as uinteger )
/'	DEFINITION:	Sets the minimum start color of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. '/
declare sub iEmitterMaxStartColor( byval emitter As iEMITTER, byval Red as uinteger, byval Green as uinteger, byval Blue as uinteger )
/'	DEFINITION:	Sets the maximum start color of the specified iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. '/
declare sub iAffectorEnable( byval affector as iAffector, byval enable as uinteger )
/'	DEFINITION:	Enables or disables the specified iAFFECTOR.
	ARGUMENTS:	iAFFECTOR and TRUE or FALSE.
	RETURNS:	None. '/
declare sub iFadeOutAffectorTime( byval affector as iAffector, byval fade_speed as single )
/'	DEFINITION:	Sets a fade affectors fade time.
	ARGUMENTS:	iAFFECTOR and speed.
	RETURNS:	None. '/
declare sub iFadeOutAffectorTargetColor( byval affector as iAffector, byval fade_to_red as uinteger, byval fade_to_green as uinteger, byval fade_to_blue as uinteger )
/'	DEFINITION:	Sets a fade affectors target fade color.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. '/
declare sub iGravityAffectorDirection( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
/'	DEFINITION:	Sets the direction of a gravity affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. '/
declare sub iGravityAffectorTimeForceLost( byval affector as iAffector, byval time_Force_Lost as single )
/'	DEFINITION:	Sets the fade of force of a gravity affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. '/
declare sub iAttractionAffectorAffectX( byval affector as iAffector, byval affect_x as uinteger )
/'	DEFINITION:	Sets an attraction affectors X value.
	ARGUMENTS:	iAFFECTOR and X value.
	RETURNS:	None. '/
declare sub iAttractionAffectorAffectY( byval affector as iAffector, byval affect_y as uinteger )
/'	DEFINITION:	Sets an attraction affectors Y value.
	ARGUMENTS:	iAFFECTOR and Y value.
	RETURNS:	None. '/
declare sub iAttractionAffectorAffectZ( byval affector as iAffector, byval affect_z as uinteger )
/'	DEFINITION:	Sets an attraction affectors Z value.
	ARGUMENTS:	iAFFECTOR and Z value.
	RETURNS:	None. '/
declare sub iAttractionAffectorAttract( byval affector as iAffector, byval attract as uinteger )
/'	DEFINITION:	Sets an attraction affectors attract value.
	ARGUMENTS:	iAFFECTOR and attract value.
	RETURNS:	None. '/
declare sub iAttractionAffectorPoint( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
/'	DEFINITION:	Sets an attraction affectors point value.
	ARGUMENTS:	iAFFECTOR and X,Y and Z point in 3D space.
	RETURNS:	None. '/
declare sub iRotationAffectorPivotPoint( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
/'	DEFINITION:	Sets the pivot point of the specified rotation affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. '/
declare sub iMaxDistanceOfEffect( byval affector as iAffector, byval NewDistance as single )
/'	DEFINITION:	Sets the maximum distance of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. '/
declare sub iMinDistanceOfEffect( byval affector as iAffector, byval NewDistance as single )
/'	DEFINITION:	Sets the minimum distance of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. '/
declare sub iColumnDistanceOfEffect( byval affector as iAffector, byval NewDistance as single )
/'	DEFINITION:	Sets the column distance of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. '/
declare sub iCenterOfEffect( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
/'	DEFINITION:	Sets the center of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. '/
declare sub iStrengthOfEffect( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
/'	DEFINITION:	Sets the strength of the specified PUSH Affector.
	ARGUMENTS:	iAFFECTOR and parameters.
	RETURNS:	None. '/
declare function iCreateBoxEmitter(byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER
/'	DEFINITION:	Creates a box style emitter for the specified particle system.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	iEMITTER handle. '/
declare sub iBoxEmitterSize(byval emitter as iEMITTER,byval sx as single,byval sy as Single,byval sz as Single)
/'	DEFINITION:	Sets the size of the specified BOX iEMITTER.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	None. '/
declare function iCreateCylinderEmitter(byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER
/'	DEFINITION:	Creates a cylinder style emitter for the specified particle system.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	iEMITTER handle. '/
declare sub iCylinderEmitterCenter(byval emitter as iEMITTER,byval x as Single,byval y as Single,byval z as Single)
/'	DEFINITION:	Sets the center point of the specified CYLINDER iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. '/
declare sub iCylinderEmitterRadius(byval emitter as iEMITTER,byval radius as Single)
/'	DEFINITION:	Sets the radius of the specified CYLINDER iEMITTER.
	ARGUMENTS:	iEMITTER and radius.
	RETURNS:	None. '/
declare sub iCylinderEmitterLength(byval emitter as iEMITTER,byval length as Single)
/'	DEFINITION:	Sets the length of the specified CYLINDER iEMITTER.
	ARGUMENTS:	iEMITTER and length.
	RETURNS:	None. '/
declare function iCreateMeshEmitter(byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER
/'	DEFINITION:	Creates a mesh style emitter for the specified particle system.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	iEMITTER handle. '/
declare sub iMeshEmitterMesh(byval emitter as iEMITTER,byval meshEntity as iEntity)
/'	DEFINITION:	Sets the for the specified MESH iEMITTER.
	ARGUMENTS:	iEMITTER and MESH iENTITY.
	RETURNS:	None. '/
declare sub iMeshEmitterEveryVertex(byval emitter as iEMITTER,byval allMeshVertex as Boolean)
/'	DEFINITION:	Enables an emitter at every vertex of the specified MESH iEMITTER.
	ARGUMENTS:	iEMITTER and TRUE or FALSE.
	RETURNS:	None. '/
declare function iCreateRingEmitter(byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER
/'	DEFINITION:	Creates a ring style emitter for the specified particle system.
	ARGUMENTS:	iPARTICLE_SYSTEM and parameters.
	RETURNS:	iEMITTER handle. '/
declare sub iRingEmitterCenter(byval emitter as iEMITTER,byval x as Single,byval y as Single,byval z as Single)
/'	DEFINITION:	Sets the center point of the specified RING iEMITTER.
	ARGUMENTS:	iEMITTER and parameters.
	RETURNS:	None. '/
declare sub iRingEmitterRadius(byval emitter as iEMITTER,byval radius as Single)
/'	DEFINITION:	Sets the radius of the specified RING iEMITTER.
	ARGUMENTS:	iEMITTER and radius.
	RETURNS:	None. '/
declare sub iRingEmitterThickness(byval emitter as iEMITTER,byval ringThickness as Single)
/'	DEFINITION:	Sets the ring thickness of the specified RING iEMITTER.
	ARGUMENTS:	iEMITTER and thickness.
	RETURNS:	None. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Pivot.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iCreatePivot(byval parent as iEntity=0) as iEntity
/'	DEFINITION:	Creates and empty iENTITY.
	ARGUMENTS:	Parent if needed.
	RETURNS:	iENTITY handle. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Shaders.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iCreateNamedVSC( byval shader as iSHADER ptr, byval const_name as zstring ptr, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer
/'	DEFINITION:	Create a named vertex shader constant.
	ARGUMENTS:	See definition.	
	RETURNS:	TRUE or FALSE. '/
declare function iCreateNamedPSC( byval shader as iSHADER ptr, byval const_name as zstring ptr, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer
/'	DEFINITION:	Create a named pixel shader constant.
	ARGUMENTS:	See definition.	
	RETURNS:	TRUE or FALSE. '/
declare function iCreateAddressedVSC( byval shader as iSHADER ptr, byval const_address as integer, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer
/'	DEFINITION:	Create an addressed vertex shader constant.
	ARGUMENTS:	See definition.	
	RETURNS:	TRUE or FALSE. '/
declare function iCreateAddressedPSC( byval shader as iSHADER ptr, byval const_address as integer, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer
/'	DEFINITION:	Create an addressed pixel shader constant.
	ARGUMENTS:	See definition.	
	RETURNS:	TRUE or FALSE. '/
declare function iAddHLSMaterial( byval vertex_program as zstring ptr, byval vertex_start_function as zstring ptr, byval vertex_prog_type as uinteger, byval pixel_program as zstring ptr, byval pixel_start_function as zstring ptr, byval pixel_prog_type as uinteger, byval material_type as uinteger ) as iSHADER ptr
/'	DEFINITION:	Adds a new material renderer to the VideoDriver, based on a high level shading language.
	ARGUMENTS:	See definition.	
	RETURNS:	Shader pointer. '/
declare function iLoadHLSMaterial( byval vertex_program_filename as zstring ptr, byval vertex_start_function as zstring ptr, byval vertex_prog_type as uinteger, byval pixel_program_filename as zstring ptr, byval pixel_start_function as zstring ptr, byval pixel_prog_type as uinteger, byval material_type as uinteger ) as iSHADER ptr
/'	DEFINITION:	Loads a new material renderer to the VideoDriver, based on a high level shading language.
	ARGUMENTS:	See definition.	
	RETURNS:	Shader pointer. '/
declare function iAddShaderMaterial( byval vertex_program as zstring ptr, byval pixel_program as zstring ptr, byval material_type as uinteger ) as iSHADER ptr
/'	DEFINITION:	Adds a new material renderer to the VideoDriver, using pixel and/or vertex shaders to render geometry.
	ARGUMENTS:	See definition.	
	RETURNS:	Shader pointer. '/
declare function iLoadShaderMaterial( byval vertex_program_filename as zstring ptr, byval pixel_program_filename as zstring ptr, byval material_type as uinteger ) as iSHADER ptr
/'	DEFINITION:	Loads a new material renderer to the VideoDriver, using pixel and/or vertex shaders to render geometry.
	ARGUMENTS:	See definition.	
	RETURNS:	Shader pointer. '/
declare sub iApplyShaderEntity(byval shader_reply as iSHADER ptr,byval entity as iEntity)
/'	DEFINITION:	Applies the specified shader to the specified entity.
	ARGUMENTS:	See definition.	
	RETURNS:	None. '/
declare sub iApplyShaderMaterial(byval shader_reply as iSHADER ptr,byval entity as iEntity,byval index as UInteger)
/'	DEFINITION:	Applies the specified shader to the specified entity at the specified material index.
	ARGUMENTS:	See definition.	
	RETURNS:	None. '/
	
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Shadows.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare sub iShadowColor(byval r as UInteger,byval g as UInteger,byval b as UInteger,byval alpha as UInteger)
/'	DEFINITION:	Sets the shadow color for the engine's stencile shadow system.
	ARGUMENTS:	RGBA of the shadows.	
	RETURNS:	None. '/
declare sub iLightCastShadows(byval light as iLight,byval castShadows as Boolean = true)
/'	DEFINITION:	Sets the specified iLIGHT to cast shadows.
	ARGUMENTS:	iLIGHT and TRUE or FALSE.	
	RETURNS:	None. '/
declare function iEntityCastShadow(byval entity as iEntity) as iSHADOW
/'	DEFINITION:	Sets the specified iENTITY to cast shadows.
	ARGUMENTS:	iENTITY.	
	RETURNS:	iSHADOW handle. '/
declare function iGetEntityShadow(byval entity as iEntity) as iSHADOW
/'	DEFINITION:	Gets the specified iENTITY shadow if it exists.
	ARGUMENTS:	iENTITY.	
	RETURNS:	iSHADOW handle or NULL. '/
declare function iEntityFreeShadow(byval entity as iEntity,byval shadowEntity as iSHADOW) as Boolean
/'	DEFINITION:	Frees the specified iENTITY's and iSHADOW.
	ARGUMENTS:	iENTITY and iSHADOW.	
	RETURNS:	TRUE on success. '/
declare sub iSetShadowMesh(byval shadowEntity as iSHADOW)
/'	DEFINITION:	Sets a default mesh shadow.
	ARGUMENTS:	iSHADOW.	
	RETURNS:	None. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Sprite.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iLoadSprite(byval file as ZString ptr,byval fixedpitch as boolean=false,byval parent as iEntity=0) as iSPRITE
/'	DEFINITION:	Loads a sprite entity.
	ARGUMENTS:	Sprite file, true or false for fixed pitch and parent.
	RETURNS:	iSPRITE. '/
declare function iCreateSprite(byval fixedpitch as boolean=false, byval parent as iEntity=0) as iSPRITE
/'	DEFINITION:	Creates a sprite entity.
	ARGUMENTS:	True or false for fixed pitch and parent.
	RETURNS:	iSPRITE. '/
declare sub iScaleSprite(byval sprite as iSPRITE,byval w as Single,byval h as Single)
/'	DEFINITION:	Scales a sprite entity.
	ARGUMENTS:	New width and height.
	RETURNS:	None. '/
declare sub iSpriteColor(byval sprite as iSPRITE,byval r as UInteger,byval g as UInteger,byval b as UInteger)
/'	DEFINITION:	Change color of a sprite entity.
	ARGUMENTS:	Red, blue and green.
	RETURNS:	None. '/
declare sub iRenderSprite(byval sprite as iSPRITE)
/'	DEFINITION:	Force renders a sprite entity.
	ARGUMENTS:	iSPRITE.
	RETURNS:	None. '/
	
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Terrain.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iCreateTiledTerrain( byval image as iIMAGE, byval tilesize as UInteger, byval datax as UInteger, byval datay as UInteger, byval parent as iEntity=0) as iTerrain
/'	DEFINITION:	Creates a tiled terrain.
	ARGUMENTS:	Tiled terrain parameters.
	RETURNS:	iTERRAIN handle. '/
declare sub iAttachTile(byval terrain as iTerrain,byval neighbor as iTerrain,byval edge as TERRAIN_EDGE)
/'	DEFINITION:	Attaches a tiled terrain.
	ARGUMENTS:	Tiled terrains and edge(TOP_EDGE 0, BOTTOM_EDGE 1, LEFT_EDGE 2, RIGHT_EDGE 3).
	RETURNS:	None. '/
declare sub iLoadTileStructure( byval terrain as iTerrain, byval image as iImage, byval dataX as integer = 0, byval dataY as integer = 0 )
/'	DEFINITION:	Load the height and UV data from an image.
	ARGUMENTS:	The terrain and parameters.
	RETURNS:	None. '/
declare sub iLoadTileColor( byval terrain as iTerrain, byval image as iImage, byval dataX as integer = 0, byval dataY as integer = 0 )
/'	DEFINITION:	Load the vertex color information of a tile.
	ARGUMENTS:	The terrain and parameters.
	RETURNS:	None. '/
declare function iLoadTerrain( byval path as zstring ptr, byval parent as iEntity=0 ) as iTERRAIN
/'	DEFINITION:	Load a terrain frome a heightmap file.
	ARGUMENTS:	Path to file and parent if needed.
	RETURNS:	iTERRAIN handle. '/
declare function iTerrainHeight( byval terrain as iTerrain,byval x as single, byval z as single) as single
/'	DEFINITION:	Gets the height of a point on the specified terrain.
	ARGUMENTS:	The terrain and parameters.
	RETURNS:	Terrain height. '/
declare function iCreateTerrain( byval parent as iEntity=0) as iTerrain
/'declare function iCreateTerrain( byval file as zstring ptr,byval patchSize as ETPS_TERRAIN_PATCH_SIZE=ETPS_17,byval parent as iEntity=0) as iTerrain
	DEFINITION:	Creates a terrain.
	ARGUMENTS:	Terrain parameters.
	RETURNS:	iTERRAIN handle. '/
declare sub iScaleTerrainTexture( byval terrain as iTerrain, byval X as single, byval Y as single, byval tType as TERRAIN_TYPE=TERRAIN_NORMAL )
/'	DEFINITION:	Scales the texture of the specified terrain.
	ARGUMENTS:	Terrain, scale and terrain type (TERRAIN_NORMAL, TERRAIN_SPHERICAL or TERRAIN_TILED).
				* TERRAIN TYPE MUST BE CORRECT OR WILL CRASH WITHOUT NOTICE!
	RETURNS:	None. '/
declare function iCreateSphericalTerrain( byval topPath as zstring ptr, byval frontPath as zstring ptr, byval backPath as zstring ptr, byval leftPath as zstring ptr, byval rightPath as zstring ptr, byval bottomPath as zstring ptr, byval parent as iEntity=0) as iTerrain
/'	DEFINITION:	Creates a spherical terrain.
	ARGUMENTS:	Paths to terrain faces and parent if needed.
	RETURNS:	iTERRAIN handle. '/
declare sub iSphericalTerrainTexture( byval terrain as iTerrain, byval topTexture as iTexture, byval frontTexture as iTexture, byval backTexture as iTexture, byval leftTexture as iTexture, byval rightTexture as iTexture, byval bottomTexture as iTexture, byval materialIndex as uinteger )
/'	DEFINITION:	Applies textures to a spherical terrains faces.
	ARGUMENTS:	Spherical terrain and patchs to textures.
	RETURNS:	None. '/
declare sub iSphericalTerrainVertexColor( byval terrain as iTerrain, byval topImage as iImage, byval frontImage as iImage, byval backImage as iImage, byval leftImage as iImage, byval rightImage as iImage, byval bottomImage as iImage )
/'	DEFINITION:	Applies textures to a spherical terrains faces.
	ARGUMENTS:	Spherical terrain and paths to textures.
	RETURNS:	None. '/
declare function iSphericalTerrainSurfaceX( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single
/'	DEFINITION:	Gets the X value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	X value. '/
declare function iSphericalTerrainSurfaceY( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single
/'	DEFINITION:	Gets the Y value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	Y value. '/
declare function iSphericalTerrainSurfaceZ( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single
/'	DEFINITION:	Gets the Z value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	Z value. '/
declare function iSphericalTerrainAngleRX( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single
/'	DEFINITION:	Gets the X rotation angle of a spherical terrain.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	X rotation angle value. '/
declare function iSphericalTerrainAngleRY( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single
/'	DEFINITION:	Gets the Y rotation angle of a spherical terrain.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	Y rotation angle value. '/
declare function iSphericalTerrainAngleRZ( byval terrain as iTerrain, byval face as TERRAIN_FACE, byval logicalX as single, byval logicalZ as single) as single
/'	DEFINITION:	Gets the Z rotation angle of a spherical terrain.
	ARGUMENTS:	Spherical terrain, face and X and Z.
	RETURNS:	Z rotation angle value. '/
declare function iSphericalSurfaceLogicalX( byval terrain as iTerrain, byval X as single, byval Y as single, byval Z as single, byref face as integer) as Single
/'	DEFINITION:	Gets the logical X value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X,Y and Z.
	RETURNS:	Logical X value. '/
declare function iSphericalSurfaceLogicalZ( byval terrain as iTerrain, byval X as single, byval Y as single, byval Z as single, byref face as integer) as Single
/'	DEFINITION:	Gets the logical Z value of a spherical surface.
	ARGUMENTS:	Spherical terrain, face and X,Y and Z.
	RETURNS:	Logical Z value. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Text&Font.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare function iLoadFont(byval fontfile as ZString ptr) as iFont
/'	DEFINITION:	Loads an XML font file.
	ARGUMENTS:	Path to XML file.
	RETURNS:	iFONT handle. '/
declare sub iSetFont(byval font as iFont)
/'	DEFINITION:	Sets the active font.
	ARGUMENTS:	iFONT handle.
	RETURNS:	None. '/
declare function iTextLen(byval text as ZString ptr) as UInteger
/'	DEFINITION:	Gets the lenght of the specified text.
	ARGUMENTS:	Text.
	RETURNS:	Length. '/
declare sub iText(byval x as UInteger,byval y as UInteger,byval text as zString ptr,byval hcenter as Boolean=false,byval vcenter as Boolean=false)
/'	DEFINITION:	Draws text to the backbuffer.
	ARGUMENTS:	Location, text and parameters.
	RETURNS:	None. '/
declare function iFontWidth() as UInteger
/'	DEFINITION:	Gets the width of the active font.
	ARGUMENTS:	None.
	RETURNS:	Font width. '/
declare function iFontHeight() as UInteger
/'	DEFINITION:	Gets the height of the active font.
	ARGUMENTS:	None.
	RETURNS:	Font height. '/
declare sub iColor(byval r as UInteger,byval g as uinteger,byval b as UInteger,byval a as UInteger=255)
/'	DEFINITION:	Sets the active color for text and drawing.
	ARGUMENTS:	RGBA.
	RETURNS:	None. '/

'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
'  bi_Texture.cpp
'----------------------------------------------------------------------------
'----------------------------------------------------------------------------
declare sub iTextureCreateFlag(byval flag as ETCF_TEXTURE_CREATION_FLAG,byval enable as Boolean)
/'	DEFINITION:	Modify the engine's texture creation flags.
	ARGUMENTS:	ETCF_TEXTURE_CREATION_FLAG and TRUE or FALSE.
	RETURNS:	None. '/
declare function iCreateTexture(byval tname as ZString ptr,byval x as uinteger,byval y as UInteger,byval format as ECF_COLOR_FORMAT=ECF_A8R8G8B8) as iTEXTURE
/'	DEFINITION:	Creates a new texture.
	ARGUMENTS:	Name, dimensions and ECF_COLOR_FORMAT.
	RETURNS:	iTEXTURE handle. '/
declare function iLoadTexture(byval file as ZString ptr) as iTEXTURE
/'	DEFINITION:	Loads a texture into memory.
	ARGUMENTS:	Path to texture.
	RETURNS:	iTEXTURE handle. '/
declare function iCreateRenderTexture(byval x as UInteger,byval y as UInteger) as iTEXTURE
/'	DEFINITION:	Creates a new texture capable of being rendered to.
	ARGUMENTS:	Dimensions.
	RETURNS:	iTEXTURE handle. '/
declare sub iDrawTexture(byval texture as iTEXTURE,byval iX as Integer,byval iY as Integer)
/'	DEFINITION:	Draws a texture to the screen.
	ARGUMENTS:	iTEXTURE handle and location.
	RETURNS:	None. '/
declare sub iDrawTextureScale(byval texture as iTEXTURE,byval dTX as Integer,byval dTY as Integer,byval dBX as Integer,byval dBY as Integer, byval TX as Integer,byval TY as Integer,byval BX as Integer,byval BY as Integer,byval useAlpha as Boolean)
/'	DEFINITION:	Draws and scales a texture to the screen.
	ARGUMENTS:	iTEXTURE handle and coordinates.
	RETURNS:	None. '/
declare sub iRenderToTexture(byval renderTarget as iTEXTURE,byval clearBackBuffer as Boolean=TRUE,byval clearZBuffer as Boolean=TRUE)
/'	DEFINITION:	Sets the specified texture as the render target, renders the scene then returns target to back buffer.
	ARGUMENTS:	Texture, clear back buffer and clear z buffer.	
	RETURNS:	None. '/
declare sub iRenderTargetTexture(byval renderTarget as iTEXTURE,byval alpha as UInteger=255,byval clearBackBuffer as Boolean=true,byval clearZBuffer as Boolean=true)
/'	DEFINITION:	Sets the specified texture as the render target.
				* MUST USE iRenderTargetTexture( NULL ) after operations to return render target to back buffer!
	ARGUMENTS:	Texture, alpha, clear back buffer and clear z buffer.	
	RETURNS:	None. '/
declare sub iFreeTexture(byval texture as iTEXTURE)
/'	DEFINITION:	Frees the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	None. '/
declare function iTextureBlend(byval texDest as iTEXTURE,byval texSrc as iTEXTURE,byval xoffset as Integer,byval yoffset as Integer, byval operation as integer) as UInteger
/'	DEFINITION:	Blends texturesrc to texturedest.
	ARGUMENTS:	Operation: BLEND_SCREEN, BLEND_ADD, BLEND_SUBTRACT, BLEND_MULTIPLY or BLEND_DIVIDE.	
	RETURNS:	0 on success, 1 Incompatible texture types or 2 Unsupported texture format. '/
declare sub iScaleEntityTexture(byval texture as iTEXTURE,byval sx as Single,byval sy as Single,byval index as uinteger=0)
/'	DEFINITION:	Scales a texture, globaly.
	ARGUMENTS:	iTEXTURE, size and index.	
	RETURNS:	None. '/
declare function iTextureWidth(byval texture as iTEXTURE) as UInteger
/'	DEFINITION:	Gets the width of the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	iTEXTURE width. '/
declare function iTextureHeight(byval texture as iTEXTURE) as UInteger
/'	DEFINITION:	Gets the height of the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	iTEXTURE height. '/
declare sub iMaskTexture(byval texture as iTEXTURE,byval r as UInteger,byval g as UInteger,byval b as UInteger,byval alpha as UInteger=0)
/'	DEFINITION:	Applies mask to specified texture and color.
	ARGUMENTS:	iTEXTURE and RGBA.	
	RETURNS:	None. '/
declare function iLockTexture(byval texture as iTEXTURE) as UInteger
/'	DEFINITION:	Locks a texture for manipulation.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	True on success. '/
declare sub iUnlockTexture(byval texture as iTEXTURE)
/'	DEFINITION:	Unlocks a texture for manipulation.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	None. '/
declare sub iNormalMapTexture(byval texture as iTEXTURE,byval amplitude as Single)
/'	DEFINITION:	Converts the specified texture to a normal texture.
	ARGUMENTS:	iTEXTURE and strength.	
	RETURNS:	None. '/
declare sub iPositionTexture(byval entity as iEntity,byval x as single,byval y as Single,byval matIndex as UInteger=0,byval texIndex as UInteger=0)
/'	DEFINITION:	Changes the position of the texture on the specified entity.
	ARGUMENTS:	iENTITY location and index.	
	RETURNS:	None. '/
declare sub iAngleTexture(byval entity as iEntity,byval radAngle as Single,byval matIndex as UInteger,byval texIndex as UInteger)
/'	DEFINITION:	Changes the rotation of the texture on the specified entity.
	ARGUMENTS:	iENTITY angle and index.	
	RETURNS:	None. '/
declare sub iScaleTexture(byval entity as iEntity,byval sx as single,byval sy as Single,byval matIndex as UInteger=0,byval texIndex as UInteger=0)
/'	DEFINITION:	Scales a texture of the specified entity.
	ARGUMENTS:	iENTITY, location and index.	
	RETURNS:	None. '/
declare function iFlipTexture(byval texture as iTEXTURE) as boolean
/'	DEFINITION:	Flips the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	TRUE on success. '/
declare function iCopyTexture(byval texture as iTEXTURE) as iTEXTURE
/'	DEFINITION:	Copies the specified texture.
	ARGUMENTS:	iTEXTURE.	
	RETURNS:	iTEXTURE handle. '/
declare function iSaveTexture(byval texture as iTEXTURE,byval filename as ZString ptr) as boolean
/'	DEFINITION:	Saves the specified texture to file.
	ARGUMENTS:	iTEXTURE and filename.	
	RETURNS:	TRUE on success. '/


'----------------------------------------------------------------------------
End Extern
