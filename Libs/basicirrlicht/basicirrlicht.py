#	.----.  .--.  .----.-.----.           
#	| {_} }/ {} \{ {__-{ | }`-'
#	| {_} /  /\  .-._} | | },-.           
#	.-.---..---..-.--.-.----.-. .-.-----. 
#	{ } }}_} }}_} |  { | }`-{ {_} `-' '-'
#	| | } \| } \} '--| | }, -| { } } } {
#	`-`-' - '`-' - '`----`-`----`-' `-' `-'
#----------------------------------------------------------------------------
#	Basic-Irrlicht Wrapper coded by EM ENGINEERING 2019-2026
#	Irrlicht3D 
#	IrrKlang
#	Raknet
#----------------------------------------------------------------------------
# This software is provided 'as - is', without any express Or implied
# warranty.  In no event will the author(s) be held liable For any damages
# arising from the use of this software.
# Permission is granted To anyone To use this software For any purpose,
# including commercial applications, And To alter it And redistribute it
# freely, subject To the following restrictions:
# 1. The Origin of this software must Not be misrepresented; you must Not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgement in the product documentation would be
#    appreciated but is Not required.
# 2. Altered source versions must be clearly marked as such, And must Not be
#    misrepresented as being the original software.
# 3. This notice may Not be removed Or altered from any source distribution.
#----------------------------------------------------------------------------
# TESTED WITH Python 3.10.7 win32

import ctypes

#import subprocess
#startupinfo = subprocess.STARTUPINFO()
#startupinfo.dwFlags |= subprocess.STARTF_USESHOWWINDOW
#startupinfo.wShowWindow = subprocess.SW_HIDE
#subprocess.Popen('program.py', startupinfo=startupinfo)

# mystruct_pointer = ctypes.POINTER(mystruct)
# _lib.mymethod.argtypes = (mystruct_pointer,)
# _lib.mymethod.restype = ctypes.c_int
# s = mystruct()
# _lib.mymethod(mystruct_pointer.from_address(ctypes.addressof(s)))
#
# To verify if this is the case, try assert(_lib.mymethod.argtypes[0]._type_ == type(s))
#  right before calling the external function.
FALSE = NULL = 0
TRUE    = 1
PI      = 3.141592653

#ENUM ELOG_LEVEL
ELL_DEBUG                                   = 0
ELL_INFORMATION                             = 1
ELL_WARNING                                 = 2
ELL_ERROR                                   = 3
ELL_NONE                                    = 4

#ENUM ESNT_NODE_TYPES
ESNT_NONE                                   = 0
ESNT_SCENE_MANAGER                          = 1
ESNT_CUBE                                   = 2
ESNT_SPHERE                                 = 3
ESNT_TEXT                                   = 4
ESNT_WATER_SURFACE                          = 5
ESNT_TERRAIN                                = 6
ESNT_SKY_BOX                                = 7
ESNT_SKY_DOME                               = 8
ESNT_SHADOW_VOLUME                          = 9
ESNT_OCTREE                                 = 10
ESNT_MESH                                   = 11
ESNT_LIGHT                                  = 12
ESNT_EMPTY                                  = 13
ESNT_DUMMY_TRANSFORMATION                   = 14
ESNT_CAMERA                                 = 15
ESNT_BILLBOARD                              = 16
ESNT_ANIMATED_MESH                          = 17
ESNT_PARTICLE_SYSTEM                        = 18
ESNT_Q3SHADER_SCENE_NOD                     = 19
ESNT_MD3_SCENE_NODE                         = 20
ESNT_VOLUME_LIGHT                           = 21
ESNT_CAMERA_MAYA                            = 22
ESNT_CAMERA_FPS                             = 23
ESNT_UNKNOWN                                = 24
ESNT_ANY                                    = 25
#ESNT_CLOUD_LAYER                            = 26
#ESNT_SHADER_WATER                           = 27

#ENUM EMF_MATERIAL_FLAG
EMF_WIREFRAME                               = 0
EMF_POINTCLOUD                              = 1
EMF_GOURAUD_SHADING                         = 2
EMF_LIGHTING                                = 3
EMF_ZBUFFER                                 = 4
EMF_ZWRITE_ENABLE                           = 5
EMF_BACK_FACE_CULLING                       = 6
EMF_FRONT_FACE_CULLING                      = 7
EMF_BILINEAR_FILTER                         = 8
EMF_TRILINEAR_FILTER                        = 9
EMF_ANISOTROPIC_FILTER                      = 10
EMF_FOG_ENABLE                              = 11
EMF_NORMALIZE_NORMALS                       = 12
EMF_TEXTURE_WRAP                            = 13
EMF_ANTI_ALIASING                           = 14
EMF_COLOR_MASK                              = 15
EMF_COLOR_MATERIAL                          = 16
EMF_USE_MIP_MAPS                            = 17
EMF_BLEND_OPERATION                         = 18
EMF_POLYGON_OFFSET                          = 19

#ENUM EMT_MATERIAL_TYPES
EMT_SOLID                                   = 0 
EMT_SOLID_2_LAYER                           = 1
EMT_LIGHTMAP                                = 2
EMT_LIGHTMAP_ADD                            = 3 
EMT_LIGHTMAP_M2                             = 4
EMT_LIGHTMAP_M4                             = 5
EMT_LIGHTMAP_LIGHTING                       = 6
EMT_LIGHTMAP_LIGHTING_M2                    = 7
EMT_LIGHTMAP_LIGHTING_M4                    = 8
EMT_DETAIL_MAP                              = 9
EMT_SPHERE_MAP                              = 10
EMT_REFLECTION_2_LAYER                      = 11
EMT_TRANSPARENT_ADD_COLOR                   = 12
EMT_TRANSPARENT_ALPHA_CHANNEL               = 13
EMT_TRANSPARENT_ALPHA_CHANNEL_REF           = 14
EMT_TRANSPARENT_VERTEX_ALPHA                = 15
EMT_TRANSPARENT_REFLECTION_2_LAYER          = 16
EMT_NORMAL_MAP_SOLID                        = 17
EMT_NORMAL_MAP_TRANSPARENT_ADD_COLOR        = 18
EMT_NORMAL_MAP_TRANSPARENT_VERTEX_ALPHA     = 19
EMT_PARALLAX_MAP_SOLID                      = 20
EMT_PARALLAX_MAP_TRANSPARENT_ADD_COLOR      = 21
EMT_PARALLAX_MAP_TRANSPARENT_VERTEX_ALPHA   = 22
EMT_ONE_TEXTURE_BLEND                       = 23
EMT_FORCE_32BIT                             = 0x7fffffff

#ENUM EBF_BLEND_FACTOR
EBF_ZERO                                    = 0
EBF_ONE                                     = 1
EBF_DST_COLOR                               = 2
EBF_ONE_MINUS_DST_COLOR                     = 3
EBF_SRC_COLOR                               = 4
EBF_ONE_MINUS_SRC_COLOR                     = 5
EBF_SRC_ALPHA                               = 6
EBF_ONE_MINUS_SRC_ALPHA                     = 7
EBF_DST_ALPHA                               = 8
EBF_ONE_MINUS_DST_ALPHA                     = 9
EBF_SRC_ALPHA_SATURATE                      = 10

#EMD2_ANIMATION_TYPE
EMAT_STAND                                  = 0
EMAT_RUN                                    = 1
EMAT_ATTACK                                 = 2
EMAT_PAIN_A                                 = 3
EMAT_PAIN_B                                 = 4
EMAT_PAIN_C                                 = 5
EMAT_JUMP                                   = 6
EMAT_FLIP                                   = 7
EMAT_SALUTE                                 = 8
EMAT_FALLBACK                               = 9
EMAT_WAVE                                   = 10
EMAT_POINT                                  = 11
EMAT_CROUCH_STAND                           = 12
EMAT_CROUCH_WALK                            = 13
EMAT_CROUCH_ATTACK                          = 14
EMAT_CROUCH_PAIN                            = 15
EMAT_CROUCH_DEATH                           = 16
EMAT_DEATH_FALLBACK                         = 17
EMAT_DEATH_FALLFORWARD                      = 18
EMAT_DEATH_FALLBACKSLOW                     = 19
EMAT_BOOM                                   = 20

#ENUM EMD3_ANIMATION_TYPE
EMD3_BOTH_DEATH_1                           = 0
EMD3_BOTH_DEAD_1                            = 1
EMD3_BOTH_DEATH_2                           = 2
EMD3_BOTH_DEAD_2                            = 3
EMD3_BOTH_DEATH_3                           = 4
EMD3_BOTH_DEAD_3                            = 5
EMD3_TORSO_GESTURE                          = 6
EMD3_TORSO_ATTACK_1                         = 7
EMD3_TORSO_ATTACK_2                         = 8
EMD3_TORSO_DROP                             = 9
EMD3_TORSO_RAISE                            = 10
EMD3_TORSO_STAND_1                          = 11
EMD3_TORSO_STAND_2                          = 12
EMD3_LEGS_WALK_CROUCH                       = 13
EMD3_LEGS_WALK                              = 14
EMD3_LEGS_RUN                               = 15
EMD3_LEGS_BACK                              = 16
EMD3_LEGS_SWIM                              = 17
EMD3_LEGS_JUMP_1                            = 18
EMD3_LEGS_LAND_1                            = 19
EMD3_LEGS_JUMP_2                            = 20
EMD3_LEGS_LAND_2                            = 21
EMD3_LEGS_IDLE                              = 22
EMD3_LEGS_IDLE_CROUCH	                    = 23
EMD3_LEGS_TURN                              = 24
EMD3_ANIMATION_COUNT                        = 25

#ENUM EMD3_MODELS
EEMD3_HEAD                                  = 0
EEMD3_UPPER                                 = 1
EEMD3_LOWER                                 = 2
EEMD3_WEAPON                                = 3
EEMD3_NUMMODELS                             = 4

#Enum ELT_LIGHT_TYPE
ELT_POINT                                   = 0
ELT_SPOT                                    = 1
ELT_DIRECTIONAL                             = 2

#Enum JOINT_MODE
JOINT_MODE_NONE                             = 0
JOINT_MODE_READ                             = 1
JOINT_MODE_CONTROL                          = 2

#Enum ESM_SHADOW_MODE
ESM_RECEIVE                                 = 0
ESM_CAST                                    = 1
ESM_BOTH                                    = 2
ESM_EXCLUDE                                 = 3
ESM_COUNT                                   = 4

#Enum EFT_FILTER_TYPE
EFT_NONE                                    = 0
EFT_4PCF                                    = 1
EFT_8PCF                                    = 2
EFT_12PCF                                   = 3
EFT_16PCF                                   = 4
EFT_COUNT                                   = 5

#Enum SHADER_CONSTANTS
NO_PRESET                                   = 0
INVERSE_WORLD                               = 1
WORLD_VIEW_PROJECTION                       = 2
CAMERA_POSITION                             = 3
TRANSPOSED_WORLD                            = 4

#Enum VERTEX_SHADER_VERSION
EVST_VS_1_1                                 = 0
EVST_VS_2_0                                 = 1
EVST_VS_2_a                                 = 2
EVST_VS_3_0                                 = 3

#Enum PIXEL_SHADER_VERSION
EPST_PS_1_1                                 = 0
EPST_PS_1_2                                 = 1
EPST_PS_1_3                                 = 2
EPST_PS_1_4                                 = 3
EPST_PS_2_0                                 = 4
EPST_PS_2_a                                 = 5
EPST_PS_2_b                                 = 6
EPST_PS_3_0                                 = 7

#Enum EVDF_VIDEO_FEATURE_QUERY
EVDF_RENDER_TO_TARGET                       = 0
EVDF_HARDWARE_TL                            = 1
EVDF_MULTITEXTURE                           = 2
EVDF_BILINEAR_FILTER                        = 3    
EVDF_MIP_MAP                                = 4
EVDF_MIP_MAP_AUTO_UPDATE                    = 5
EVDF_STENCIL_BUFFER                         = 6
EVDF_VERTEX_SHADER_1_1                      = 7
EVDF_VERTEX_SHADER_2_0                      = 8
EVDF_VERTEX_SHADER_3_0                      = 9
EVDF_PIXEL_SHADER_1_1                       = 10
EVDF_PIXEL_SHADER_1_2                       = 11
EVDF_PIXEL_SHADER_1_3                       = 12
EVDF_PIXEL_SHADER_1_4                       = 13
EVDF_PIXEL_SHADER_2_0                       = 14
EVDF_PIXEL_SHADER_3_0                       = 15
EVDF_ARB_VERTEX_PROGRAM_1                   = 16
EVDF_ARB_FRAGMENT_PROGRAM_1                 = 17
EVDF_ARB_GLSL                               = 18
EVDF_HLSL                                   = 19
EVDF_TEXTURE_NSQUARE                        = 20
EVDF_TEXTURE_NPOT                           = 21
EVDF_FRAMEBUFFER_OBJECT                     = 22
EVDF_VERTEX_BUFFER_OBJECT                   = 23
EVDF_ALPHA_TO_COVERAGE                      = 24
EVDF_COLOR_MASK                             = 25
EVDF_MULTIPLE_RENDER_TARGETS                = 26
EVDF_MRT_BLEND                              = 27
EVDF_MRT_COLOR_MASK                         = 28
EVDF_MRT_BLEND_FUNC                         = 29
EVDF_GEOMETRY_SHADER                        = 30

#Enum EMWT_MESH_FILE_FORMAT
EMWT_IRR_MESH                               = 0   
EMWT_COLLADA                                = 1
EMWT_STL                                    = 2
EMWT_OBJ                                    = 3
EMWT_PLY                                    = 4

#Enum ETPS_TERRAIN_PATCH_SIZE
ETPS_9                                      = 9  
ETPS_17                                     = 17 
ETPS_33                                     = 33  
ETPS_65                                     = 65  
ETPS_129                                    = 129 

#Enum ETCF_TEXTURE_CREATION_FLAG
ETCF_ALWAYS_16_BIT                          = 0x1
ETCF_ALWAYS_32_BIT                          = 0x2
ETCF_OPTIMIZED_FOR_QUALITY                  = 0x4
ETCF_OPTIMIZED_FOR_SPEED                    = 0x8
ETCF_CREATE_MIP_MAPS                        = 0x10  
ETCF_NO_ALPHA_CHANNEL                       = 0x20 
ETCF_ALLOW_NON_POWER_2                      = 0x40

#Enum ECF_COLOR_FORMAT
ECF_A1R5G5B5                                = 0 
ECF_R5G6B5                                  = 1
ECF_R8G8B8                                  = 2
ECF_A8R8G8B8                                = 3

#Enum TEXTURE_BLEND
BLEND_SCREEN                                = 0
BLEND_ADD                                   = 1
BLEND_SUBTRACT                              = 2
BLEND_MULTIPLY                              = 3
BLEND_DIVIDE                                = 4

#Enum ECM_COLOR_MATERIAL
ECM_NONE                                    = 0 
ECM_DIFFUSE                                 = 1  
ECM_AMBIENT                                 = 2
ECM_EMISSIVE                                = 3
ECM_SPECULAR                                = 4
ECM_DIFFUSE_AND_AMBIENT                     = 5

#Enum EDS_DEBUG
EDS_OFF                                     = 0
EDS_BBOX                                    = 1
EDS_NORMALS                                 = 2
EDS_SKELETON                                = 4
EDS_MESH_WIRE_OVERLAY                       = 8
EDS_HALF_TRANSPARENCY                       = 16
EDS_BBOX_BUFFERS                            = 32
EDS_FULL                                    = 0xffffffff

#enum EMBF_BUTTONS
EMBF_OK                                     = 1
EMBF_CANCEL                                 = 2
EMBF_YES                                    = 4
EMBF_NO                                     = 8

#Enum EGDC_GUI_COLOR_ELEMENT
EGDC_3D_DARK_SHADOW                         = 0 
EGDC_3D_SHADOW                              = 1
EGDC_3D_FACE                                = 2
EGDC_3D_HIGH_LIGHT                          = 3
EGDC_3D_LIGHT                               = 4
EGDC_ACTIVE_BORDER                          = 5
EGDC_ACTIVE_CAPTION                         = 6
EGDC_APP_WORKSPACE                          = 7
EGDC_BUTTON_TEXT                            = 8
EGDC_GRAY_TEXT                              = 9
EGDC_HIGH_LIGHT                             = 10
EGDC_HIGH_LIGHT_TEXT                        = 11 
EGDC_INACTIVE_BORDER                        = 12
EGDC_INACTIVE_CAPTION                       = 13
EGDC_TOOLTIP                                = 14
EGDC_TOOLTIP_BACKGROUND                     = 15
EGDC_SCROLLBAR                              = 16
EGDC_WINDOW                                 = 17
EGDC_WINDOW_SYMBOL                          = 18
EGDC_ICON                                   = 19
EGDC_ICON_HIGH_LIGHT                        = 20
EGDC_COUNT                                  = 21
   
# EFT_FOG_TYPE
EFT_FOG_EXP                                 = 0
EFT_FOG_LINEAR                              = 1
EFT_FOG_EXP2                                = 2

#num EKEY_CODE
KEY_LBUTTON                                 = 0x01 
KEY_RBUTTON                                 = 0x02 
KEY_CANCEL                                  = 0x03  
KEY_MBUTTON                                 = 0x04 
KEY_XBUTTON1                                = 0x05 
KEY_XBUTTON2                                = 0x06 
KEY_BACK                                    = 0x08 
KEY_TAB                                     = 0x09
KEY_CLEAR                                   = 0x0C 
KEY_RETURN                                  = 0x0D 
KEY_SHIFT                                   = 0x10  
KEY_CONTROL                                 = 0x11   
KEY_MENU                                    = 0x12 
KEY_PAUSE                                   = 0x13 
KEY_CAPITAL                                 = 0x14  
KEY_KANA                                    = 0x15 
KEY_HANGUEL                                 = 0x15  
KEY_HANGUL                                  = 0x15 
KEY_JUNJA                                   = 0x17 
KEY_FINAL                                   = 0x18 
KEY_HANJA                                   = 0x19  
KEY_KANJI                                   = 0x19 
KEY_ESCAPE                                  = 0x1B 
KEY_CONVERT                                 = 0x1C 
KEY_NONCONVERT                              = 0x1D 
KEY_ACCEPT                                  = 0x1E 
KEY_MODECHANGE                              = 0x1F  
KEY_SPACE                                   = 0x20 
KEY_PRIOR                                   = 0x21 
KEY_NEXT                                    = 0x22
KEY_END                                     = 0x23 
KEY_HOME                                    = 0x24 
KEY_LEFT                                    = 0x25  
KEY_UP                                      = 0x26  
KEY_RIGHT                                   = 0x27 
KEY_DOWN                                    = 0x28   
KEY_SELECT                                  = 0x29   
KEY_PRINT                                   = 0x2A  
KEY_EXECUT                                  = 0x2B  
KEY_SNAPSHOT                                = 0x2C  
KEY_INSERT                                  = 0x2D 
KEY_DELETE                                  = 0x2E 
KEY_HELP                                    = 0x2F  
KEY_KEY_0                                   = 0x30  
KEY_KEY_1                                   = 0x31  
KEY_KEY_2                                   = 0x32  
KEY_KEY_3                                   = 0x33 
KEY_KEY_4                                   = 0x34  
KEY_KEY_5                                   = 0x35  
KEY_KEY_6                                   = 0x36   
KEY_KEY_7                                   = 0x37 
KEY_KEY_8                                   = 0x38 
KEY_KEY_9                                   = 0x39 
KEY_KEY_A                                   = 0x41 
KEY_KEY_B                                   = 0x42 
KEY_KEY_C                                   = 0x43 
KEY_KEY_D                                   = 0x44  
KEY_KEY_E                                   = 0x45 
KEY_KEY_F                                   = 0x46 
KEY_KEY_G                                   = 0x47 
KEY_KEY_H                                   = 0x48   
KEY_KEY_I                                   = 0x49 
KEY_KEY_J                                   = 0x4A    
KEY_KEY_K                                   = 0x4B 
KEY_KEY_L                                   = 0x4C  
KEY_KEY_M                                   = 0x4D   
KEY_KEY_N                                   = 0x4E   
KEY_KEY_O                                   = 0x4F 
KEY_KEY_P                                   = 0x50 
KEY_KEY_Q                                   = 0x51  
KEY_KEY_R                                   = 0x52  
KEY_KEY_S                                   = 0x53  
KEY_KEY_T                                   = 0x54  
KEY_KEY_U                                   = 0x55 
KEY_KEY_V                                   = 0x56 
KEY_KEY_W                                   = 0x57 
KEY_KEY_X                                   = 0x58 
KEY_KEY_Y                                   = 0x59 
KEY_KEY_Z                                   = 0x5A 
KEY_LWIN                                    = 0x5B   
KEY_RWIN                                    = 0x5C  
KEY_APPS                                    = 0x5D  
KEY_SLEEP                                   = 0x5F 
KEY_NUMPAD0                                 = 0x60 
KEY_NUMPAD1                                 = 0x61 
KEY_NUMPAD2                                 = 0x62 
KEY_NUMPAD3                                 = 0x63 
KEY_NUMPAD4                                 = 0x64   
KEY_NUMPAD5                                 = 0x65   
KEY_NUMPAD6                                 = 0x66   
KEY_NUMPAD7                                 = 0x67  
KEY_NUMPAD8                                 = 0x68   
KEY_NUMPAD9                                 = 0x69   
KEY_MULTIPLY                                = 0x6A   
KEY_ADD                                     = 0x6B  
KEY_SEPARATOR                               = 0x6C    
KEY_SUBTRACT                                = 0x6D  
KEY_DECIMAL                                 = 0x6E  
KEY_DIVIDE                                  = 0x6F  
KEY_F1                                      = 0x70  
KEY_F2                                      = 0x71  
KEY_F3                                      = 0x72  
KEY_F4                                      = 0x73  
KEY_F5                                      = 0x74  
KEY_F6                                      = 0x75   
KEY_F7                                      = 0x76  
KEY_F8                                      = 0x77  
KEY_F9                                      = 0x78   
KEY_F10                                     = 0x79   
KEY_F11                                     = 0x7A  
KEY_F12                                     = 0x7B   
KEY_F13                                     = 0x7C  
KEY_F14                                     = 0x7D   
KEY_F15                                     = 0x7E   
KEY_F16                                     = 0x7F  
KEY_F17                                     = 0x80   
KEY_F18                                     = 0x81  
KEY_F19                                     = 0x82  
KEY_F20                                     = 0x83  
KEY_F21                                     = 0x84   
KEY_F22                                     = 0x85  
KEY_F23                                     = 0x86   
KEY_F24                                     = 0x87 
KEY_NUMLOCK                                 = 0x90  
KEY_SCROLL                                  = 0x91 
KEY_LSHIFT                                  = 0xA0
KEY_RSHIFT                                  = 0xA1 
KEY_LCONTROL                                = 0xA2 
KEY_RCONTROL                                = 0xA3 
KEY_LMENU                                   = 0xA4 
KEY_RMENU                                   = 0xA5 
KEY_PLUS                                    = 0xBB 
KEY_COMMA                                   = 0xBC 
KEY_MINUS                                   = 0xBD 
KEY_PERIOD                                  = 0xBE 
KEY_ATTN                                    = 0xF6
KEY_CRSEL                                   = 0xF7
KEY_EXSEL                                   = 0xF8 
KEY_EREOF                                   = 0xF9
KEY_PLAY                                    = 0xFA 
KEY_ZOOM                                    = 0xFB 
KEY_PA1                                     = 0xFD
KEY_OEM_CLEAR                               = 0xFE
KEY_KEY_CODES_COUNT                         = 0xFF

##############################################################
#	CLASS DEFINITIONS
##############################################################
'''class iPARTICLE_SETTINGS(ctypes.Structure):
    _fields_ = [("self.min_box_x", ctypes.c_float),
                ("self.min_box_y", ctypes.c_float),
                ("self.min_box_z", ctypes.c_float),
                ("self.max_box_x", ctypes.c_float),
                ("self.max_box_y", ctypes.c_float),
                ("self.max_box_z", ctypes.c_float)]

    def __init__(self):
        self.min_box_x = 0.0
        self.min_box_y = 0.0
        self.min_box_z = 0.0
        self.max_box_x = 0.0
        self.max_box_y = 0.0
        self.max_box_z = 0.0
        self.direction_x = 0.0
        self.direction_y = 0.0
        self.direction_z = 0.0
        self.min_paritlcles_per_second = 0
        self.max_paritlcles_per_second = 0
        self.min_start_color_red = 0
        self.min_start_color_green = 0
        self.min_start_color_blue = 0
        self.max_start_color_red = 0
        self.max_start_color_green = 0
        self.max_start_color_blue = 0
        self.min_lifetime = 0
        self.max_lifetime = 0
        self.min_start_sizeX = 0.0
        self.min_start_sizeY = 0.0
        self.max_start_sizeX = 0.0
        self.max_start_sizeY = 0.0
        self.max_angle_degrees = 0
'''   
class iPARTICLE_SETTINGS:
    def __init__(self):
        self.min_box_x = 0.0
        self.min_box_y = 0.0
        self.min_box_z = 0.0
        self.max_box_x = 0.0
        self.max_box_y = 0.0
        self.max_box_z = 0.0
        self.direction_x = 0.0
        self.direction_y = 0.0
        self.direction_z = 0.0
        self.min_paritlcles_per_second = 0
        self.max_paritlcles_per_second = 0
        self.min_start_color_red = 0
        self.min_start_color_green = 0
        self.min_start_color_blue = 0
        self.max_start_color_red = 0
        self.max_start_color_green = 0
        self.max_start_color_blue = 0
        self.min_lifetime = 0
        self.max_lifetime = 0
        self.min_start_sizeX = 0.0
        self.min_start_sizeY = 0.0
        self.max_start_sizeX = 0.0
        self.max_start_sizeY = 0.0
        self.max_angle_degrees = 0

class iVERT:
    x = 0.0 
    y = 0.0  
    z = 0.0   
    normal_x = 0.0  
    normal_y = 0.0   
    normal_z = 0.0 
    vcolor = 0  
    texture_x = 0.0 
    texture_y = 0.0

class iVECTOR:
    x = 0.0
    y = 0.0
    z = 0.0

class iSHADER:
    material_type = 0
    material_object = 0
    next_shader  = 0


##############################################################
#	LOAD DLL LIBRARY
##############################################################
lib = ctypes.cdll.LoadLibrary("./BasicIrrlicht.dll")

##############################################################
#	FUNCTIONS
##############################################################
##############################################################
# 	Global
##############################################################
lib.iGetVersion.restype = ctypes.c_char_p
def iGetVersion():
    '''Gets the version of the BasicIrrlicht Library
    Args:
      NONE
    Returns:
      Library Version.
    '''
    return lib.iGetVersion().decode('UTF-8')
def iGraphics3D( x, y, bits, fullscreen = FALSE ):
    return lib.iGraphics3D(ctypes.c_int(x),ctypes.c_int(y),ctypes.c_int(bits),ctypes.c_int(fullscreen))
def iRun():
    return lib.iRun()
def iUpdateScene( clearBackBuffer = TRUE, clearZBuffer = TRUE):
    lib.iUpdateScene(ctypes.c_int(clearBackBuffer),ctypes.c_int(clearZBuffer))
def iRenderScene():
    lib.iRenderScene()
def iRenderGUI():
	lib.iRenderGUI()
def iFlip():
    return lib.iFlip()
def iEndGraphics():
    lib.iEndGraphics()
def iVSync( enable = FALSE):
    lib.iVSync(ctypes.c_int(enable))
def iAntialias( level ):
    lib.iAntialias(ctypes.c_uint(level))
def iFrameLimit( limit ):
    lib.iFrameLimit(ctypes.c_uint(limit))
def iFPS():
    return lib.iFPS()
def iTrisRendered():
    return lib.iTrisRendered()
def iAppTitle( string ):
    lib.iAppTitle(string)
def iMilliSecs():
    return lib.iMilliSecs()
def iRunTime():
    return lib.iRunTime()
def iClearScene():
	lib.iClearScene()
def iLoadScene( filename ):
    return lib.iLoadScene(str.encode(filename,'utf-8'))
def iSaveScene( filename ):
    return lib.iSaveScene(str.encode(filename,'utf-8'))
def iTransparentZWrite( enable = FALSE ):
    lib.iTransparentZWrite(ctypes.c_int(enable))
def iAddArchive( filename, ignore_case, ignore_paths, password = ""):
    return lib.iAddArchive(str.encode(filename,'utf-8'),ctypes.c_int(ignore_case),ctypes.c_int(ignore_paths),str.encode(password,'utf-8'))
def iFreeArchive( archive ): # RETURNS Bool TRUE or FALSE
    return lib.iFreeArchive(ctypes.c_int(archive))
def iScreenShot( folder = "."):
    lib.iScreenShot(str.encode(folder,'utf-8'))
def iEngineSleep( time_ms ):
    lib.iEngineSleep(ctypes.c_uint(time_ms))
def iSupportStencilBuffer():
    return lib.iSupportStencilBuffer()
def iSupportMultiTexture():
    return lib.iSupportMultiTexture()
def iSupportHardwareTL():
    return lib.iSupportHardwareTL()
def iSupportGLSL():
    return lib.iSupportGLSL()
def iSupportARB():
    return lib.iSupportARB()
def iProcessorSpeed():
    return lib.iProcessorSpeed()
def iTotalMemory():
    return lib.iTotalMemory()
def iAvailableMemory():
    return lib.iAvailableMemory()
def iVideoModeCount():
    return lib.iVideoModeCount()
def iVideoModeDepth():
    return lib.iVideoModeDepth()
def iVideoModeResolutionWidth():
    return lib.iVideoModeResolutionWidth()
def iVideoModeResolutionHeight():
    return lib.iVideoModeResolutionHeight()
def iSetLogLevel( level = ELL_ERROR ):
    lib.iSetLogLevel(ctypes.c_int(level))
def iFullscreen(): # RETURNS boolean    
    return lib.iFullscreen()
def iWindowActive(): # RETURNS boolean    
    return lib.iWindowActive()
def iWindowFocused(): # RETURNS boolean    
    return lib.iWindowFocused()
def iWindowMinimized(): # RETURNS boolean    
    return lib.iWindowMinimized()
def iEntityDebug( entity, visible = EDS_OFF ):
    lib.iEntityDebug(ctypes.c_int(entity),ctypes.c_uint(visible))
    
##############################################################
# 	Audio
##############################################################
#def iUpdateListener():
#    lib.iUpdateListener()
def iDopplerEffect( doppler = 1.0, distance = 1.0 ):
    lib.iDopplerEffect(ctypes.c_float(doppler),ctypes.c_float(distance))
def iEmitSound( iSoundSource, parent = NULL, looped = FALSE ):
    return lib.iEmitSound(ctypes.c_int(iSoundSource),ctypes.c_int(parent),ctypes.c_int(looped))
def iLoadSound( path ): # RETURNS iSoundSource
    return lib.iLoadSound(str.encode(path,'utf-8'))
def iFreeSound( iSound ):
    lib.iFreeSound(ctypes.c_int(iSound))
def iSoundLoop( iSound ):
    lib.iSoundLoop(ctypes.c_int(iSound))
def iPlaySound( iSoundSource ): # RETURNS iSound
    return lib.iPlaySound(ctypes.c_int(iSoundSource))
def iPlayMusic( file ): # RETURNS iSound
    return lib.iPlayMusic(str.encode(file,'utf-8'))
def iStopSound( sound ):
    lib.iStopSound(ctypes.c_int(sound))
def iPauseSound( sound ):
    lib.iPauseSound(ctypes.c_int(sound))
def iResumeSound( sound ):
    lib.iResumeSound(ctypes.c_int(sound))
def iSoundPitch( sound, pitch ):
    lib.iSoundPitch(ctypes.c_int(sound),ctypes.c_float(pitch))
def iSoundVolume( sound, volume ):
    lib.iSoundVolume(ctypes.c_int(sound),ctypes.c_float(volume))
def iSoundPan( sound, pan ):
    lib.iSoundPan(ctypes.c_int(sound),ctypes.c_float(pan))
def iSoundPlaying( sound ):
    return lib.iSoundPlaying(ctypes.c_int(sound))
def iMasterVolume( volume ):
    lib.iMasterVolume(ctypes.c_float(volume))
def iPauseAllSounds( pause ):
    lib.iPauseAllSounds(ctypes.c_int(pause))
def iStopAllSounds():
    lib.iStopAllSounds()
def iFreeAllSounds():
    lib.iFreeAllSounds()
def iSoundLength( sound ):
    return lib.iSoundLength(ctypes.c_int(sound))
def iGetPlayPosition( sound ):
    return lib.iGetPlayPosition(ctypes.c_int(sound))
def iSetPlayPosition( sound, position ):
    lib.iSetPlayPosition(ctypes.c_int(sound),ctypes.c_uint(position))
def iSetSoundDistance( sound, distance ):
    lib.iSetSoundDistance(ctypes.c_int(sound),ctypes.c_float(distance))
def iPositionSound( sound, x, y, z ):
    lib.iPositionSound(ctypes.c_int(sound),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iSoundSourceCount():
    return lib.iSoundSourceCount()

##############################################################
# 	Camera
##############################################################
def iCreateCamera( parent = NULL, bind = TRUE ):
    return lib.iCreateCamera(ctypes.c_int(parent),ctypes.c_int(bind) )
def iCreateIsometricCamera( vWidth, vHeight, vNear, vFar, parent = NULL):
    return lib.iCreateIsometricCamera(ctypes.c_float(vWidth),ctypes.c_float(vHeight),ctypes.c_float(vNear),ctypes.c_float(vFar),ctypes.C_int(parent))
def iCreateMayaCamera( rots, zoos, tras, parent = NULL):
    return lib.iCreateMayaCamera(ctypes.c_float(rots),ctypes.c_float(zoos),ctypes.c_float(tras),ctypes.c_int(parent))
def iCreateFPSCamera( lookspeed = 100.0, movespeed = 0.5, parent = NULL, recv = TRUE ):
    return lib.iCreateFPSCamera(ctypes.c_float(lookspeed),ctypes.c_float(movespeed,),ctypes.c_int(parent),ctypes.c_int(recv))
def iCameraInput( camera, enable = TRUE ):
    lib.iCameraInput(ctypes.c_int(camera),ctypes.c_int(enable))
def iCamInputEnabled( camera ): #RETURNS boolean
    return lib.iCamInputEnabled(ctypes.c_int(camera))
def iCameraViewPort( x, y, w, h ):
    lib.iCameraViewPort(ctypes.c_uint(x),ctypes.c_uint(y),ctypes.c_uint(w),ctypes.c_uint(h))
def iCLSColor( r, g, b, a = 255 ):
    return lib.iCLSColor(ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b),ctypes.c_uint(a))
def iFogType( fogtype = EFT_FOG_EXP ):
    lib.iFogType(ctypes.c_int(fogtype))
def iFogColor( r, g, b):
    lib.iFogColor(ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iFogRange( start = 50.0, end = 100.0 ):
    lib.iFogRange(ctypes.c_float(start),ctypes.c_float(end))
def iPixelFog( enable ):
    lib.iPixelFog(ctypes.c_int(enable))
def iEnableRangeFog( enable ):
    lib.iEnableRangeFog(ctypes.c_int(enable))
def iFogDensity( density = 0.01 ):
    lib.iFogDensity(ctypes.c_float(density))
def iCameraRange( camera, near = 1.0, far = 2000.0 ):
    return lib.iCameraRange(ctypes.c_int(camera),ctypes.c_float(near),ctypes.c_float(far))
def iSetActiveCamera( camera ):
    lib.iSetActiveCamera(ctypes.c_int(camera))
def iSetCameraFOV( camera, fov ):   # (Default: PI / 2.5f)
    lib.iSetCameraFOV(ctypes.c_int(camera),ctypes.c_float(fov))
lib.iGetCameraFOV.restype = ctypes.c_float
def iGetCameraFOV( camera ):
    return lib.iGetCameraFOV(ctypes.c_int(camera))
def iSetCameraAspectRatio( camera, aspectRatio): # (default: 4.0f / 3.0f)
    lib.iSetCameraAspectRatio(ctypes.c_int(camera),ctypes.c_float(aspectRatio))
def iCameraTarget( camera, x, y, z):
    lib.iCameraTarget(ctypes.c_int(camera),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iCamTargetX( camera ): # RETURNS single
    return lib.iCamTargetX(ctypes.c_int(camera))
def iCamTargetY( camera ): # RETURNS single
    return lib.iCamTargetY(ctypes.c_int(camera))
def iCamTargetZ( camera ): # RETURNS single
    return lib.iCamTargetZ(ctypes.c_int(camera))
def iFadeIn( ms ):
    lib.iFadeIn(ctypes.c_uint(ms))
def iFadeOut( ms ):
    lib.iFadeOut(ctypes.c_uint(ms))
def iFadeColor( r, g, b, a = 0 ):
    lib.iFadeColor(ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b),ctypes.c_uint(a))
def iFadeReady():
    return lib.iFadeReady()
##############################################################
# 	EntityAnimation
##############################################################
def iSetLoopAnimation( entity, enable = FALSE ):
    lib.iSetLoopAnimation(ctypes.c_int(entity),ctypes.c_int(enable))
def iAnimationLooped( entity ):
    return lib.iAnimationLooped(ctypes.c_int(entity))
def iSetAnimationSpeed( entity , speed ):
    lib.iSetAnimationSpeed(ctypes.c_int(entity),ctypes.c_float(speed))
def iSetAnimationFrame( entity, frame ):
    lib.iSetAnimationFrame(ctypes.c_int(entity),ctypes.c_float(frame))
def iSetTransitionTime( entity , ftime ):
    lib.iSetTransitionTime(ctypes.c_int(entity),ctypes.c_float(ftime))
def iAnimate( entity , looped, speed , sframe, eframe, ftime ):
    lib.iAnimate(ctypes.c_int(entity),ctypes.c_int(looped),ctypes.c_float(speed),ctypes.c_int(sframe),ctypes.c_int(eframe),ctypes.c_float(ftime))
def iAnimateJoint( joint ):
    lib.iAnimateJoint(ctypes.c_int(joint))
def iSetJointMode( joint, mode ):
    lib.iSetJointMode(ctypes.c_int(joint),ctypes.c_uint(mode))
# ANIMATORS
def iDeleteAnimator( entity, ms_delay ):
    return lib.iDeleteAnimator(ctypes.c_int(entity),ctypes.c_uint(ms_delay))
def iFlyCircleAnimator( entity, x, y, z, radius = 100.0, speed = 0.001 ):
    return lib.iFlyCircleAnimator(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z),ctypes.c_float(radius),ctypes.c_float(speed))
def iFlyStraightAnimator( entity, sx, sy, sz, ex, ey, ez, uitime, looped ):
    return lib.iFlyStraightAnimator(ctypes.c_int(entity),ctypes.c_float(sx),ctypes.c_float(sy),ctypes.c_float(sz),ctypes.c_float(ex),ctypes.c_float(ey),ctypes.c_float(ez),ctypes.c_uint(uitime),ctypes.c_int(looped))
def iRotationAnimator( entity, p, y, r ):
    return lib.iRotationAnimator(ctypes.c_int(entity),ctypes.c_float(p),ctypes.c_float(y),ctypes.c_float(r))
def iFollowSplineAnimator( entity, iPoints, x, y, z, ttime, speed, tightness, looped = TRUE, pingpong = FALSE, steer = FALSE ):
    return lib.iFollowSplineAnimator(ctypes.c_int(entity),ctypes.c_int(iPoints),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z),ctypes.c_int(ttime),ctypes.c_float(speed),ctypes.c_float(tightness),ctypes.c_int(looped),ctypes.c_int(pingpong),ctypes.c_int(steer))
def iFadeAnimator( entity, ms_delay, scale ):
    return lib.iFadeAnimator(ctypes.c_int(entity),ctypes.c_uint(ms_delay),ctypes.c_float(scale))
def iFreeAnimator( entity, anim ):
    lib.iFreeAnimator(ctypes.c_int(entity),ctypes.c_int(anim))
def iTextureAnimator( entity, texture_name, ext, frame_count, frame_time, looped = TRUE ):
    return lib.iTextureAnimator(ctypes.c_int(entity),texture_name,ext,ctypes.c_int(frame_count),ctypes.c_int(frame_time),ctypes.c_int(looped))

##############################################################
# 	EntityCollision
##############################################################
def iAddCollisionAnimator( selector, entity, recursive = FALSE, sliding = 0.0005 ):
    return lib.iAddCollisionAnimator(ctypes.c_int(selector),ctypes.c_int(entity),ctypes.c_int(recursive),ctypes.c_float(sliding))
def iEntityRadius( entity, x, y, z ):
    lib.iEntityRadius(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iEntityGravity( entity, x, y, z ):
    lib.iEntityGravity(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iEntityOffset( entity, x, y, z ):
    lib.iEntityOffset(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iCreateTriSelector( entity, iframe = 0 ): #RETURNS iTRI_SELECTOR
    return lib.iCreateTriSelector(ctypes.c_int(entity),ctypes.c_int(iframe))
def iCreateOctreeSelector( entity, iframe = 0 ): #RETURNS iTRI_SELECTOR
    return lib.iCreateOctreeSelector(ctypes.c_int(entity),ctypes.c_int(iframe)) 
def iCreateBoxSelector( entity, recurse = FALSE ): #RETURNS iTRI_SELECTOR
    return lib.iCreateBoxSelector(ctypes.c_int(entity),ctypes.c_int(recurse))
def iCreateTerrainSelector( terrain, level_of_detail = 0 ): #RETURNS iTRI_SELECTOR #0 to 3 else crash!
    return lib.iCreateTerrainSelector(ctypes.c_int(terrain),ctypes.c_int(level_of_detail))
def iCreateMetaSelector(): #RETURNS iMETA_SELECTOR
    return lib.iCreateMetaSelector()
def iRemoveEntitySelector( entity, selector = NULL ): #RETURNS Boolean
    return lib.iRemoveEntitySelector(ctypes.c_int(entity),ctypes.c_int(selector))
def iMetaAddSelector( ms, ts ):
    lib.iMetaAddSelector(ctypes.c_int(ms),ctypes.c_int(ts))
def iMetaRemoveSelector( ms, ts ):
    lib.iMetaRemoveSelector(ctypes.c_int(ms),ctypes.c_int(ts))
def iMetaRemoveEntitySelector( ms, entity ):
    lib.iMetaRemoveEntitySelector(ctypes.c_int(ms),ctypes.c_int(entity))
def iClearMetaSelector( ms ):
    lib.iClearMetaSelector(ctypes.c_int(ms))
def iSetEntitySelector( entity, selector ):
    lib.iSetEntitySelector(ctypes.c_int(entity),ctypes.c_int(selector))
def iDeleteMetaSelector( ms ): #RETURNS Boolean
    return lib.iDeleteMetaSelector(ctypes.c_int(ms))
def iEntityCollided( entity ): #RETURNS Boolean
    return lib.iEntityCollided(ctypes.c_int(entity))
lib.iCountCollisions.restype = ctypes.c_uint
def iCountCollisions( entity ): #RETURNS uinteger
    return lib.iCountCollisions(ctypes.c_int(entity))
def iEntityFalling( entity ): #RETURNS Boolean
    return lib.iEntityFalling(ctypes.c_int(entity))
def iCollidedEntity( entity, index = 1 ): #RETURNS iENTITY
    return lib.iCollidedEntity(ctypes.c_int(entity),ctypes.c_int(index))
lib.iCollidedPointX.restype = ctypes.c_float
def iCollidedPointX( entity, index = 1): #RETURNS single
    return lib.iCollidedPointX(ctypes.c_int(entity),ctypes.c_int(index))
lib.iCollidedPointY.restype = ctypes.c_float
def iCollidedPointY( entity, index = 1): #RETURNS single
    return lib.iCollidedPointY(ctypes.c_int(entity),ctypes.c_int(index))
lib.iCollidedPointZ.restype = ctypes.c_float
def iCollidedPointZ( entity, index = 1): #RETURNS single
    return lib.iCollidedPointZ(ctypes.c_int(entity),ctypes.c_int(index))    
lib.iCollidedPointNX.restype = ctypes.c_float
def iCollidedPointNX( entity, index = 1): #RETURNS single
    return lib.iCollidedPointNX(ctypes.c_int(entity),ctypes.c_int(index))
lib.iCollidedPointNY.restype = ctypes.c_float
def iCollidedPointNY( entity, index = 1): #RETURNS single
    return lib.iCollidedPointNY(ctypes.c_int(entity),ctypes.c_int(index))
lib.iCollidedPointNZ.restype = ctypes.c_float
def iCollidedPointNZ( entity, index = 1): #RETURNS single
    return lib.iCollidedPointNZ(ctypes.c_int(entity),ctypes.c_int(index))    
def iAlignToVector( entity, vector_x, vector_y, vector_z, axis ):
    lib.iAlignToVector(ctypes.c_int(entity),ctypes.c_float(vector_x),ctypes.c_float(vector_y),ctypes.c_float(vector_z),ctypes.c_uint(axis))
def iEntitiesCollided( entityA, entityB, buffer = 0.0 ): #RETURNS Boolean
    return lib.iEntitiesCollided(ctypes.c_int(entityA),ctypes.c_int(entityB),ctypes.c_float(buffer))
def iBoundingBoxSize( entity, x, y, z ):
    lib.iBoundingBoxSize(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iGetRayCollision( entityS, entityE, z = 1.0 ): #RETURNS Boolean
    return lib.iGetRayCollision(ctypes.c_int(entityS),ctypes.c_int(entityE),ctypes.c_float(z))
def iVectorInsideEntity( entity, x, y, z ): #RETURNS Boolean
    return lib.iVectorInsideEntity(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iCollisionEntity( selector, ellipsoidX, ellipsoidY, ellipsoidZ, ellipsoidRadius, velocityX, velocityY, velocityZ, gravityX, gravityY, gravityZ, slidingSpeed = 0.0005 ): #RETURNS iENTITY
    return lib.iCollisionEntity(ctypes.c_int(selector),ctypes.c_float(ellipsoidX),ctypes.c_float(ellipsoidY),ctypes.c_float(ellipsoidZ),ctypes.c_float(ellipsoidRadius),ctypes.c_float(velocityX),ctypes.c_float(velocityY),ctypes.c_float(velocityZ),ctypes.c_float(gravityX),ctypes.c_float(gravityY),ctypes.c_float(gravityZ),ctypes.c_float(slidingSpeed))
def iGetCameraCollisionEntity( camera, idBitMask = 0 ): #RETURNS iEntity
    return lib.iGetCameraCollisionEntity(ctypes.c_int(camera),ctypes.c_int(idBitMask))
def iCollFalling(): #RETURNS Boolean
    return lib.iCollFalling()
lib.iCollHitPositionX.restype = ctypes.c_float
def iCollHitPositionX(): #RETURNS single
    return lib.iCollHitPositionX()
lib.iCollHitPositionY.restype = ctypes.c_float
def iCollHitPositionY(): #RETURNS single
    return lib.iCollHitPositionY()
lib.iCollHitPositionZ.restype = ctypes.c_float
def iCollHitPositionZ(): #RETURNS single
    return lib.iCollHitPositionZ()
lib.iCollNewPositionX.restype = ctypes.c_float
def iCollNewPositionX(): #RETURNS single
    return lib.iCollNewPositionX()
lib.iCollNewPositionY.restype = ctypes.c_float
def iCollNewPositionY(): #RETURNS single
    return lib.iCollNewPositionY()
lib.iCollNewPositionZ.restype = ctypes.c_float
def iCollNewPositionZ(): #RETURNS single
    return lib.iCollNewPositionZ() 
def iCameraPick( x, y ): #RETURNS iENTITY
    return lib.iCameraPick(ctypes.c_int(x),ctypes.c_int(y))
def iLinePick( sx, sy, sz, dx, dy, dz ): #RETURNS iEntity
    return lib.iLinePick(ctypes.c_float(sx),ctypes.c_float(sy),ctypes.c_float(sz),ctypes.c_float(dx),ctypes.c_float(dy),ctypes.c_float(dz))
lib.iPickedX.restype = ctypes.c_float
def iPickedX(): #RETURNS single
    return lib.iPickedX()
lib.iPickedY.restype = ctypes.c_float
def iPickedY(): #RETURNS single
    return lib.iPickedY()
lib.iPickedZ.restype = ctypes.c_float
def iPickedZ(): #RETURNS single
    return lib.iPickedZ()
lib.iPickedNX.restype = ctypes.c_float
def iPickedNX(): #RETURNS single
    return lib.iPickedNX()
lib.iPickedNY.restype = ctypes.c_float
def iPickedNY(): #RETURNS single
    return lib.iPickedNY()
lib.iPickedNZ.restype = ctypes.c_float
def iPickedNZ(): #RETURNS single
    return lib.iPickedNZ()

##############################################################
# 	EntityControl
##############################################################
def iNameEntity( entity, name ):
    lib.iNameEntity(ctypes.c_int(entity),str.encode(name,'utf-8'))
def iFreeEntity( entity ):
    lib.iFreeEntity(ctypes.c_int(entity))
def iEntityParent( entity, parent ):
    lib.iEntityParent(ctypes.c_int(entity),ctypes.c_int(parent))
def iShowEntity( entity ):
    lib.iShowEntity(ctypes.c_int(entity))
def iHideEntity( entity ):
    lib.iHideEntity(ctypes.c_int(entity))
def iCopyEntity( entity, parent = 0 ):
    return lib.iCopyEntity(ctypes.c_int(entity),ctypes.c_int(parent))
def iEntityShininess( entity, shininess = 128.0 ): # 0.5-128.0
    lib.iEntityShininess(ctypes.c_int(entity),ctypes.c_float(shininess))
def iEntityAlpha( entity, alpha = 255 ):
    lib.iEntityAlpha(ctypes.c_int(entity),ctypes.c_int(alpha))
def iEntityTexture( entity, texture, index = 0 ):
    return lib.iEntityTexture(ctypes.c_int(entity),ctypes.c_int(texture),ctypes.c_int(index))
def iEntityColor( entity, r, g, b ):
    lib.iEntityColor(ctypes.c_int(entity),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iEntityDiffuseColor( entity, r, g, b):
    lib.iEntityDiffuseColor(ctypes.c_int(entity),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iEntityAmbientColor( entity, r, g, b):
    lib.iEntityAmbientColor(ctypes.c_int(entity),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iEntityEmissiveColor( entity, r, g, b):
    lib.iEntityEmissiveColor(ctypes.c_int(entity),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iEntitySpecularColor( entity, r, g, b):
    lib.iEntitySpecularColor(ctypes.c_int(entity),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iEntityColorByVertex( entity, ECM_COLOR_MATERIAL ):
    lib.iEntityColorByVertex(ctypes.c_int(entity),ctypes.c_int(ECM_COLOR_MATERIAL))

##############################################################
# 	EntityMovement
##############################################################
def iScaleEntity( entity, x, y, z ):
    lib.iScaleEntity(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iPositionEntity( entity, x, y, z ):#, isGlobal = FALSE ):
    lib.iPositionEntity(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))#,ctypes.c_int(isGlobal))
def iMoveEntity( entity, x, y, z ):#, isGlobal = FALSE ):
    lib.iMoveEntity(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))#,ctypes.c_int(isGlobal))
def iTranslateEntity( entity, x, y, z ):#, isGlobal = FALSE ):
    lib.iTranslateEntity(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iRotateEntity( entity, p, y, r ):
    lib.iRotateEntity(ctypes.c_int(entity),ctypes.c_float(p),ctypes.c_float(y),ctypes.c_float(r))
def iTurnEntity( entity, p, y, r ):
    lib.iTurnEntity(ctypes.c_int(entity),ctypes.c_float(p),ctypes.c_float(y),ctypes.c_float(r))
def iPointEntity( entity1, entity2 ):
    lib.iPointEntity(ctypes.c_int(entity1),ctypes.c_int(entity2))
def iEntityPoint( entity, x, y, z ):
    lib.iEntityPoint(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
    
##############################################################
# 	EntitySpecial
##############################################################
def iCreateWater( texture1, texture2, height = 2.0, speed = 300.0, length = 10.0, parent = NULL): # RETURNS iEntity
    return lib.iCreateWater(str.encode(texture1,'utf-8'),str.encode(texture2,'utf-8'),ctypes.c_float(height),ctypes.c_float(speed),ctypes.c_float(length),ctypes.c_float(parent))
def iCreateLensFlare( Texture, parent = 0 ): # RETURNS iEntity
    return lib.iCreateLensFlare(str.encode(Texture,'utf-8'),ctypes.c_float(parent) )
def iLensFlareScale( flare, source, optics ):
    lib.iLensFlareScale(ctypes.c_int(flare),ctypes.c_float(source),ctypes.c_float(optics))
def iCreateLaser( parent = 0 ): #RETURNS iEntity
    return lib.iCreateLaser(ctypes.c_int(parent))
def iCreateSkybox( top, bottom, left, right, front, back, parent = NULL, id = -1 ): # RETURNS iEntity
    return lib.iCreateSkybox(ctypes.c_int(top),ctypes.c_int(bottom),ctypes.c_int(left),ctypes.c_int(right),ctypes.c_int(front),ctypes.c_int(back),ctypes.c_int(parent),ctypes.c_int(id))
def iCreateSkydome( iTexture, horiRes = 16, vertRes = 8, texturePercentage = 0.9, spherePercentage = 2.0, domeRadius = 1000.0, parent = NULL, id = -1 ): # RETURNS iEntity
    return lib.iCreateSkydome(ctypes.c_int(iTexture),ctypes.c_int(horiRes),ctypes.c_int(vertRes),ctypes.c_float(texturePercentage),ctypes.c_float(spherePercentage),ctypes.c_float(domeRadius),ctypes.c_int(parent),ctypes.c_int(id))
def iCreateMirror( camera, mirrorOverlay, parent = 0 ): #RETURNS iENTITY
    return lib.iCreateMirror(ctypes.c_int(camera),ctypes.c_int(mirrorOverlay),ctypes.c_int(parent))
def iMirrorReflect( mirror ):
    lib.iMirrorReflect(ctypes.c_int(mirror))

##############################################################
# 	EntityState
##############################################################
def iMeshAnimTime( mesh ):
    return lib.iMeshAnimTime(ctypes.c_int(emesh))
lib.iEntityX.restype = ctypes.c_float
def iEntityX( entity, isGlobal = FALSE ):
    return lib.iEntityX(ctypes.c_int(entity),ctypes.c_int(isGlobal))
lib.iEntityY.restype = ctypes.c_float
def iEntityY( entity, isGlobal = FALSE ):
    return lib.iEntityY(ctypes.c_int(entity),ctypes.c_int(isGlobal))
lib.iEntityZ.restype = ctypes.c_float
def iEntityZ( entity, isGlobal = FALSE ):
    return lib.iEntityZ(ctypes.c_int(entity),ctypes.c_int(isGlobal))
lib.iEntityPitch.restype = ctypes.c_float
def iEntityPitch( entity, isGlobal = FALSE ):
    return lib.iEntityPitch(ctypes.c_int(entity),ctypes.c_int(isGlobal))
lib.iEntityYaw.restype = ctypes.c_float
def iEntityYaw( entity, isGlobal = FALSE ):
    return lib.iEntityYaw(ctypes.c_int(entity),ctypes.c_int(isGlobal))
lib.iEntityRoll.restype = ctypes.c_float
def iEntityRoll( entity, isGlobal = FALSE ):
    return lib.iEntityRoll(ctypes.c_int(entity),ctypes.c_int(isGlobal))
lib.iEntityName.restype = ctypes.c_char_p
def iEntityName( entity ):
    '''Gets the specified entity name.
    Args:
      Entity
    Returns:
      Name as a String.
    '''
    return lib.iEntityName(ctypes.c_int(entity)).decode('UTF-8')
lib.iEntityDistance.restype = ctypes.c_float
def iEntityDistance( entity1, entity2 ):
    return lib.iEntityDistance(ctypes.c_int(entity1),ctypes.c_int(entity2))
# CHILDREN
def iFindChild( mesh, jointname = "" ):
    return lib.iFindChild(ctypes.c_int(mesh),str.encode(jointname,'utf-8'))
def iCountChildren( mesh ):
    return lib.iCountChildren(ctypes.c_int(mesh))
lib.iChildName.restype = ctypes.c_char_p
def iChildName( joint ):
    return lib.iChildName(ctypes.c_int(joint)).decode('UTF-8')
def iChildIndex( joint ):
    return lib.iChildIndex(ctypes.c_int(joint))
def iChildMode( mesh, mode ):
    lib.iChildMode(ctypes.c_int(mesh),ctypes.c_uint(mode))
def iGetChild( iEntity, index ):
    return lib.iGetChild(ctypes.c_int(iEntity),ctypes.c_uint(index))
def iEntityClass( entity ):
    return lib.iEntityClass(ctypes.c_int(entity))
def iEntityMaterialType( entity, EMT_MATERIAL_TYPES ):
    lib.iEntityMaterialType(ctypes.c_int(entity),ctypes.c_uint(EMT_MATERIAL_TYPES))
def iEntityMaterialFlag( entity, flag, mode, index = -1 ):
    lib.iEntityMaterialFlag(ctypes.c_int(entity),ctypes.c_uint(flag),ctypes.c_int(mode),ctypes.c_int(index))
def iEntityCullingType( entity, value ): #value as E_CULLING_TYPE
    lib.iEntityCullingType(ctypes.c_int(entity),ctypes.c_int(value))
##** HERE
##############################################################
# 	Graphics
##############################################################
def iGraphicsWidth():
    return lib.iGraphicsWidth()
def iGraphicsHeight():
    return lib.iGraphicsHeight()
def iQueryFeature( EVDF_VIDEO_FEATURE_QUERY ):
    return lib.iQueryFeature(ctypes.c_uint(EVDF_VIDEO_FEATURE_QUERY))
def iDisableFeature( EVDF_VIDEO_FEATURE_QUERY, flag ):
    lib.iDisableFeature(ctypes.c_uint(EVDF_VIDEO_FEATURE_QUERY),ctypes.c_int(flag))
def iWritePixelFast( x, y, image = 0 ):
    lib.iWritePixelFast(ctypes.c_uint(x),ctypes.c_uint(y),ctypes.c_int(image))
def iReadPixelFast( x, y, image = 0 ):
    return lib.iReadPixelFast(ctypes.c_uint(x),ctypes.c_uint(y),ctypes.c_int(image))
def iLine3D( xStart, yStart, zStart, xEnd, yEnd, zEnd ):
    lib.iLine3D(ctypes.c_float(xStart),ctypes.c_float(yStart),ctypes.c_float(zStart),ctypes.c_float(xEnd),ctypes.c_float(yEnd),ctypes.c_float(zEnd))
def iPixel( x, y ):
    lib.iPixel(ctypes.c_uint(x),ctypes.c_uint(y))
def iRect( x, y, width, height ):
    lib.iRect(ctypes.c_int(x),ctypes.c_int(y),ctypes.c_int(width),ctypes.c_int(height))
def iLine( x1, y1, x2, y2 ):
    lib.iLine(ctypes.c_int(x1),ctypes.c_int(y1),ctypes.c_int(x2),ctypes.c_int(y2))
def iOval( x, y, radius ):
    lib.iOval(ctypes.c_int(x),ctypes.c_int(y),ctypes.c_float(radius))

##############################################################
# 	GUI
##############################################################
def iGUIClear():
    lib.iGUIClear()
def iFreeGadget( iGadget ):
    lib.iFreeGadget(ctypes.c_int(iGadget))
lib.iGetGadgetText.restype = ctypes.c_char_p
def iGetGadgetText( iGadget ):
    return lib.iGetGadgetText(ctypes.c_int(iGadget)).decode('UTF-8')
def iSetGadgetText( iGadget, text ):
    lib.iSetGadgetText(ctypes.c_int(iGadget),str.encode(text,'utf-8'))
def iCreateWindow( title, iTopX, iTopY, iBotX, iBotY, modal, parent = 0 ): # RETURNS iGadget
    return lib.iCreateWindow(str.encode(title,'utf-8'),ctypes.c_int(iTopX),ctypes.c_int(iTopY),ctypes.c_int(iBotX),ctypes.c_int(iBotY),ctypes.c_int(modal),ctypes.c_int(parent))
def iGadgetStaticText( text, iTopX, iTopY, iBotX, iBotY, border, wordWrap, parent ): # RETURNS iGadget
    return lib.iGadgetStaticText(str.encode(text,'utf-8'),ctypes.c_int(iTopX),ctypes.c_int(iTopY),ctypes.c_int(iBotX),ctypes.c_int(iBotY),ctypes.c_int(border),ctypes.c_int(wordWrap),ctypes.c_int(parent))
def iGadgetCreateButton( label, x, y, w, h, id, tip, parent ): # RETURNS iGadget
    return lib.iGadgetCreateButton(str.encode(label,'utf-8'),ctypes.c_int(x),ctypes.c_int(y),ctypes.c_int(w),ctypes.c_int(h),ctypes.c_int(id),str.encode(tip,'utf-8'),ctypes.c_int(parent))
def iGadgetSetButtonImage( button, texture, x, y ):
    lib.iGadgetSetButtonImage(ctypes.c_int(button),ctypes.c_int(iTexture),ctypes.c_int(x),ctypes.c_int(y))
def iGadgetButtonBorder( button, opt ):
    lib.iGadgetButtonBorder(ctypes.c_int(button),ctypes.c_int(opt))
def iGadgetButtonState( button ): # RETURNS Boolean
    return lib.iGadgetButtonState(ctypes.c_int(button))
def iGadgetCreateScrollBar( horizontal, xt, yt, xb, yb, id, spos, max, parent ): # RETURNS iGadget
    return lib.iGadgetCreateScrollBar(ctypes.c_int(horizontal),ctypes.c_int(xt),ctypes.c_int(yt),ctypes.c_int(xb),ctypes.c_int(yb),ctypes.c_int(id),ctypes.c_int(spos),ctypes.c_int(max),ctypes.c_int(parent))
def iGadgetCreateListBox( xt, yt, xb, yb, id, background, parent ): # RETURNS iGadget
    return lib.iGadgetCreateListBox(ctypes.c_int(xt),ctypes.c_int(yt),ctypes.c_int(xb),ctypes.c_int(yb),ctypes.c_int(id),ctypes.c_int(background),ctypes.c_int(parent))
def iAddGadgetItem( iGadget, text ):
    lib.iAddGadgetItem(ctypes.c_int(iGadget),str.encode(text,'utf-8'))
def iInsertGadgetItem( iGadget, text, index ):
    lib.iInsertGadgetItem(ctypes.c_int(iGadget),str.encode(text,'utf-8'),ctypes.c_uint(index))
def iRemoveGadgetItem( iGadget, index ):
    lib.iRemoveGadgetItem(ctypes.c_int(iGadget),ctypes.c_uint(index))
def iSelectGadgetItem( iGadget, index ):
    lib.iSelectGadgetItem(ctypes.c_int(iGadget),ctypes.c_uint(index))
def iGadgetCreateEditBox( text, xt, yt, xb, yb, id, border, password, parent ): # RETURNS iGadget
    return lib.iGadgetCreateEditBox(str.encode(text,'utf-8'),ctypes.c_int(xt),ctypes.c_int(yt),ctypes.c_int(xb),ctypes.c_int(yb),ctypes.c_int(id),ctypes.c_int(border),ctypes.c_int(password),ctypes.c_int(parent))
def iGadgetStaticImage( iTexture, x, y, useAlpha, id, parent ): # RETURNS iGadget
    return lib.iGadgetStaticImage(ctypes.c_int(iTexture),ctypes.c_int(x),ctypes.c_int(y),ctypes.c_int(useAlpha),ctypes.c_int(id),ctypes.c_int(parent))
def iGadgetCreateCheckBox( text, xt, yt, xb, yb, id, checked, parent ): # RETURNS iGadget
    return lib.iGadgetCreateCheckBox(str.encode(text,'utf-8'),ctypes.c_int(xt),ctypes.c_int(yt),ctypes.c_int(xb),ctypes.c_int(yb),ctypes.c_int(id),ctypes.c_int(checked),ctypes.c_int(parent))
def iGadgetCheckCheckBox( iGadget, checked ):
    lib.iGadgetCheckCheckBox(ctypes.c_int(iGadget),ctypes.c_int(checked))
def iGadgetAddFileOpen( label, id, modal, parent ): # RETURNS iGadget
    return lib.iGadgetAddFileOpen(str.encode(label,'utf-8'),ctypes.c_int(id),ctypes.c_int(modal),ctypes.c_int(parent))
def iSetGadgetFont( iFont ):
    lib.iSetGadgetFont(ctypes.c_int(iFont))
def iSetGadgetColor( iGadget, r, g, b, alpha ):
    lib.iSetGadgetColor(ctypes.c_int(iGadget),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b),ctypes.c_uint(alpha))
def iNotify( mCaption, EMBF_BUTTONS, text, parent = 0 ): # RETURNS iGadget
    return lib.iNotify(mCaption,ctypes.c_int(EMBF_BUTTONS),text,ctypes.c_int(parent))
def iShowGadget( iGadget ):
    lib.iShowGadget(ctypes.c_int(iGadget))
def iHideGadget( iGadget ):
    lib.iHideGadget(ctypes.c_int(iGadget))
def iEnableGadget( iGadget ):
    lib.iEnableGadget(ctypes.c_int(iGadget))
def iDisableGadget( iGadget ):
    lib.iDisableGadget(ctypes.c_int(iGadget))
    
##############################################################
# 	Image
##############################################################
def iLoadImage( file ): # RETURNS iImage
    return lib.iLoadImage(str.encode(file,'utf-8'))
def iCreateImage( x, y, ECF_COLOR_FORMAT ): # RETURNS iImage
    return lib.iCreateImage(ctypes.c_uint(x),ctypes.c_uint(y),ctypes.c_int(ECF_COLOR_FORMAT))
def iFreeImage( iImage ):
    lib.iFreeImage(ctypes.c_int(iImage))
def iLockImage( iImage ): # RETURNS iImage
    return lib.iLockImage(ctypes.c_int(iImage))
def iUnlockImage( iImage ):
    lib.iUnlockImage(ctypes.c_int(iImage))
def iGrabImage( x, y, w, h ): # RETURNS iImage
    return lib.iGrabImage(ctypes.c_int(x),ctypes.c_int(y),ctypes.c_uint(w),ctypes.c_uint(h))
def iImageWidth(iImage ): # RETURNS uinteger
    return lib.iImageWidth(ctypes.c_int(iImage))
def iImageHeight( iImage ): # RETURNS uinteger
    return lib.iImageHeight(ctypes.c_int(iImage))
def iImagePitch( iImage ): # RETURNS uinteger
    return lib.iImagePitch(ctypes.c_int(iImage))
def iImageColorFormat( iImage ): # RETURNS uinteger
    return lib.iImageColorFormat(ctypes.c_int(iImage))

##############################################################
# 	Input
##############################################################
def iGetKey():
    return lib.iGetKey()
def iWaitKey():
    lib.iWaitKey()
def iKeyHit( key ):
    return lib.iKeyHit(ctypes.c_int(key))
def iKeyDown( key ):
    return lib.iKeyDown(ctypes.c_int(key))
def iFlushKeys():
    lib.iFlushKeys()
def iMouseDown( button ):
    return lib.iMouseDown(ctypes.c_int(button))
def iMouseHit( button ):
    return lib.iMouseHit(ctypes.c_int(button))
lib.iMouseZSpeed.restype = ctypes.c_float
def iMouseZSpeed():
    return lib.iMouseZSpeed()
def iFlushMouse():
    lib.iFlushMouse()
def iShowPointer():
    return lib.iShowPointer()    
def iHidePointer():
    return lib.iHidePointer()
def iMoveMouse( x, y ):
    lib.iMoveMouse(ctypes.c_int(x),ctypes.c_int(y))
def iMouseX():
    return lib.iMouseX()
def iMouseY():
    return lib.iMouseY()
# GUI INPUT
def iGetLastSelectedFile():
    return lib.iGetLastSelectedFile()
def iGUIEventAvailable():
    return lib.iGUIEventAvailable()
def iReadGUIEventalias():
    lib.iReadGUIEventalias()
def iGUIEventID():
    return lib.iGUIEventID()
def iGUIEvent():
    return lib.iGUIEvent()
def iGUIEventData():
    return lib.iGUIEventData()

##############################################################
# 	Light
##############################################################
def iAmbientLight( r, g, b ):
    return lib.iAmbientLight(ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iCreateVolumetricLight( footr, footg, footb, tailr, tailg, tailb, parent = 0 ): # RETURNS iLight
    return lib.iCreateVolumetricLight(ctypes.c_uint(footr),ctypes.c_uint(footg),ctypes.c_uint(footb),ctypes.c_uint(tailr),ctypes.c_uint(tailg),ctypes.c_uint(tailb),ctypes.c_int(parent))
def iCreateLight( ELT_LIGHT_TYPE, parent = NULL ):
    return lib.iCreateLight(ctypes.c_int(ELT_LIGHT_TYPE),ctypes.c_int(parent))
def iLightColor( iLight, r, g, b ):
    lib.iLightColor(ctypes.c_int(iLight),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iLightAmbientColor( iLight, r, g, b ):
    lib.iLightAmbientColor(ctypes.c_int(iLight),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iLightDiffuseColor( iLight, r, g, b ):
    lib.iLightDiffuseColor(ctypes.c_int(iLight),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iLightSpecularColor( iLight, r, g, b ):
    lib.iLightSpecularColor(ctypes.c_int(iLight),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iLightRange( iLight, constant, linear, quadratic ):
    lib.iLightRange(ctypes.c_int(iLight),ctypes.c_float(constant),ctypes.c_float(linear),ctypes.c_float(quadratic))
def iLightFalloff( iLight, Falloff ):
    lib.iLightFalloff(ctypes.c_int(iLight),ctypes.c_float(Falloff))
def iLightConeAngle( iLight, innercone, outercone ):
    lib.iLightConeAngle(ctypes.c_int(iLight),ctypes.c_float(innercone),ctypes.c_float(outercone))
def iLightRadius( iLight, Radius ):
    lib.iLightRadius(ctypes.c_int(iLight),ctypes.c_float(Radius))
def iLightType( iLight, ltype ):
    lib.iLightType(ctypes.c_int(iLight),ctypes.c_uint(ltype))
def iLightCount(): # RETURNS UInteger	
    return lib.iLightCount()

##############################################################
# 	Materials
##############################################################
def iMaterialVertexColorAffects( iMaterial, ECM_COLOR_MATERIAL ):
    lib.iMaterialVertexColorAffects(ctypes.c_int(iMaterial),ctypes.c_int(ECM_COLOR_MATERIAL))
def iMaterialShininess( iMaterial, shininess ):
    lib.iMaterialShininess(ctypes.c_int(iMaterial),ctypes.c_float(shininess))
def iMaterialSpecularColor( iMaterial, a, r, g, b ):
    lib.iMaterialSpecularColor(ctypes.c_int(iMaterial),ctypes.c_uint(a),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iMaterialDiffuseColor( iMaterial, a, r, g, b ):
    lib.iMaterialDiffuseColor(ctypes.c_int(iMaterial),ctypes.c_uint(a),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iMaterialAmbientColor( iMaterial, a, r, g, b ):
    lib.iMaterialAmbientColor(ctypes.c_int(iMaterial),ctypes.c_uint(a),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iMaterialEmissiveColor( iMaterial, a, r, g, b ):
    lib.iMaterialEmissiveColor(ctypes.c_int(iMaterial),ctypes.c_uint(a),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iMaterialTypeParam( iMaterial, pvalue ):
    lib.iMaterialTypeParam(ctypes.c_int(iMaterial),ctypes.c_float(pvalue))
def iMaterialBlend( iMaterial, srcEBF_BLEND_FACTOR, destEBF_BLEND_FACTOR ):
    lib.iMaterialBlend(ctypes.c_int(iMaterial),ctypes.c_int(srcEBF_BLEND_FACTOR),ctypes.c_int(destEBF_BLEND_FACTOR))
def iMaterialLineThickness( iMaterial, lineThickness ):
    lib.iMaterialLineThickness(ctypes.c_int(iMaterial),ctypes.c_float(lineThickness))
def iMaterialCount( entity ): # RETURNS UInteger
    return lib.iMaterialCount(ctypes.c_int(entity))
def iGetMaterial( entity, index ): # RETURNS iMaterial
    return lib.iGetMaterial(ctypes.c_int(entity),ctypes.c_uint(index))
def iPositionMaterialTexture( entity, num, index, x, y ):
    lib.iPositionMaterialTexture(ctypes.c_int(entity),ctypes.c_uint(num),ctypes.c_uint(index),ctypes.c_float(x),ctypes.c_float(y))
def iAngleMaterialTexture( entity, num, index, radAngle ):
    lib.iAngleMaterialTexture(ctypes.c_int(entity),ctypes.c_uint(num),ctypes.c_uint(index),ctypes.c_float(radAngle))
def iScaleMaterialTexture( entity, num, index, sx, sy ):
    lib.iScaleMaterialTexture(ctypes.c_int(entity),ctypes.c_uint(num),ctypes.c_uint(index),ctypes.c_float(sx),ctypes.c_float(sy))

##############################################################
# 	Math
##############################################################
lib.iCurveValue.restype = ctypes.c_float
def iCurveValue( nvalue, ovalue, increment ): # RETURNS Single
    return lib.iCurveValue(ctypes.c_float(nvalue),ctypes.c_float(ovalue),ctypes.c_float(increment))
lib.iWrapValue.restype = ctypes.c_float
def iWrapValue( invalue, min, max ): # RETURNS Single
    return lib.iWrapValue(ctypes.c_float(invalue),ctypes.c_float(min),ctypes.c_float(max))
lib.iClampValue.restype = ctypes.c_float
def iClampValue( invalue, low, high ): # RETURNS Single
    return lib.iClampValue(ctypes.c_float(invalue),ctypes.c_float(low),ctypes.c_float(high))
lib.iMin.restype = ctypes.c_float
def iMin( value1, value2 ): # RETURNS Single
    return lib.iMin(ctypes.c_float(value1),ctypes.c_float(value2))
lib.iMax.restype = ctypes.c_float
def iMax( value1, value2 ): # RETURNS Single
    return lib.iMax(ctypes.c_float(value1),ctypes.c_float(value2))
lib.iDistance2D.restype = ctypes.c_float
def iDistance2D( x1, y1, x2, y2 ): # RETURNS Single
    return lib.iDistance2D(ctypes.c_float(x1),ctypes.c_float(y1),ctypes.c_float(x2),ctypes.c_float(y2))
lib.iDistance3D.restype = ctypes.c_float
def iDistance3D( x1, y1, z1, x2, y2, z2 ): # RETURNS Single
    return lib.iDistance3D(ctypes.c_float(x1),ctypes.c_float(y1),ctypes.c_float(z1),ctypes.c_float(x2),ctypes.c_float(y2),ctypes.c_float(z2))
def iRand( min, max ): # RETURNS Integer
    return lib.iRand(ctypes.c_int(min),ctypes.c_int(max))
def iSeedRand( seed ):
    lib.iSeedRand(ctypes.c_uint(seed))
lib.iARGB.restype = ctypes.c_uint
def iARGB( a, r, g, b ): #RETURNS uinteger
    return lib.iARGB(ctypes.c_uint(a),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))

##############################################################
# 	MD2
##############################################################
def iLoadMD2( path, parent = NULL ):
    return lib.iLoadMD2(str.encode(path,'utf-8'),parent)
def iAnimateMD2( entity, mode, speed, first_frame, last_frame, transition ):
    lib.iAnimateMD2(ctypes.c_int(entity),ctypes.c_uint(mode),ctypes.c_float(speed),ctypes.c_int(first_frame),ctypes.c_int(last_frame),ctypes.c_float(transition))
def iPlayMD2Animation( entity, EMD2_ANIMATION_TYPE = EMAT_STAND ):
    lib.iPlayMD2Animation(ctypes.c_int(entity),ctypes.c_int(EMD2_ANIMATION_TYPE))
lib.iMD2AnimTime.restype = ctypes.c_float
def iMD2AnimTime( entity ):
    return lib.iMD2AnimTime(ctypes.c_int(entity))
def iMD2AnimLength( entity ):
    return lib.iMD2AnimLength(ctypes.c_int(entity))
def iMD2Animating( entity ):
    return lib.iMD2Animating(ctypes.c_int(entity))

##############################################################
# 	Mesh
##############################################################
lib.iMeshHeight.restype = ctypes.c_float
def iMeshHeight( entity ): # RETURNS FLOAT
    return lib.iMeshHeight(ctypes.c_int(entity))
lib.iMeshWidth.restype = ctypes.c_float
def iMeshWidth( entity ): # RETURNS FLOAT
    return lib.iMeshWidth(ctypes.c_int(entity))
lib.iMeshDepth.restype = ctypes.c_float
def iMeshDepth( entity ): # RETURNS FLOAT
    return lib.iMeshDepth(ctypes.c_int(entity))
def iCreateCube( parent = NULL ): # RETURNS iEntity
    return lib.iCreateCube(ctypes.c_int(parent))
def iCreateSphere( polyCount = 16, parent = NULL ): # RETURNS iEntity
    return lib.iCreateSphere(ctypes.c_int(polyCount),ctypes.c_int(parent)) 
def iCreateCylinder( tesselation, parent = NULL): # RETURNS iEntity
    return lib.iCreateCylinder(ctypes.c_uint(tesselation),ctypes.c_int(parent))
def iCreateCone( tesselation, parent = NULL): # RETURNS iEntity
    return lib.iCreateCone(ctypes.c_uint(tesselation),ctypes.c_int(parent))
def iCreatePlane( parent = NULL, size = 10000.0, tileCount = 1 ): # RETURNS iEntity
    return lib.iCreatePlane(ctypes.c_int(parent),ctypes.c_float(size),ctypes.c_uint(tileCount))
def iWriteMesh( iMesh, mtype, filename ): # RETURNS UInteger
    return lib.iWriteMesh(ctypes.c_int(iMesh),ctypes.c_uint(mtype),str.encode(filename,'utf-8'))
def iClearUnusedMeshes():
    lib.iClearUnusedMeshes()
def iFreeMesh( iMesh ):
    lib.iFreeMesh(ctypes.c_int(iMesh))
def iMeshTexture( iMesh, texture, index, iBuffer ):
    lib.iMeshTexture(ctypes.c_int(iMesh),ctypes.c_int(texture),ctypes.c_uint(index),ctypes.c_uint(iBuffer))
def iNameMesh( iMesh, name ):
    lib.iNameMesh(ctypes.c_int(iMesh),str.encode(name,'utf-8'))
def iCopyMesh( iMesh ): # RETURNS iMesh
    return lib.iCopyMesh(ctypes.c_int(iMesh))
def iOutlineMesh( iMesh, lWidth, r, g, b ):
    lib.iOutlineMesh(ctypes.c_int(iMesh),ctypes.c_float(lWidth),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iFlipMesh( iMesh ): # RETURNS bool
    return lib.iFlipMesh(ctypes.c_int(iMesh))
def iFlipEntityMesh( iEntity ): # RETURNS bool
    return lib.iFlipEntityMesh(ctypes.c_int(iEntity))
def iScaleMesh( iMesh, xScale, yScale, zScale, iMeshBuffer = NULL, sourceMesh = NULL ):
    lib.iScaleMesh(ctypes.c_int(iMesh),ctypes.c_float(xScale),ctypes.c_float(yScale),ctypes.c_float(zScale),ctypes.c_uint(iMeshBuffer),ctypes.c_int(sourceMesh))
def iCreateMesh( cptrMeshName, iVertexCount, vVertices, iIndicesCount, usIndices): # RETURNS iMesh
    return lib.iCreateMesh(str.encode(cptrMeshName,'utf-8'),ctypes.c_uint(iVertexCount),vVertices.iVert,ctypes.c_uint(iIndicesCount),ctypes.c_uint(usIndices))
def iLoadMesh( meshfile ): # RETURNS iMesh
   return lib.iLoadMesh(str.encode(meshfile,'utf-8'))
def iLoadMeshEntity(meshfile, parent = NULL ): # RETURNS iEntity
    return lib.iLoadMeshEntity(str.encode(meshfile,'utf-8'),ctypes.c_int(iEntity))
def iGetEntityMesh( iEntity ): # RETURNS iMesh
    return lib.iGetEntityMesh(ctypes.c_int(iEntity))
def iLoadAnimMesh( animeshfile, parent = NULL ): # RETURNS iEntity
    return lib.iLoadAnimMesh(str.encode(animeshfile,'utf-8'),ctypes.c_int(parent))
def iCreateHillPlaneMesh( meshname, tileSizeX, tileSizeY, tileCountX, tileCountY, iMaterial,  hillHeight, countHillsX, countHillsY, textureRepeatCountX, textureRepeatCountY ): # RETURNS iMesh
    return lib.iCreateHillPlaneMesh(str.encode(meshname,'utf-8'),ctypes.c_float(tileSizeX),ctypes.c_float(tileSizeY),ctypes.c_uint(tileCountX),ctypes.c_uint(tileCountY),ctypes.c_int(iMaterial),ctypes.c_float(hillHeight),ctypes.c_float(countHillsX),ctypes.c_float(countHillsY),ctypes.c_float(textureRepeatCountX),ctypes.c_float(textureRepeatCountY))
def iAddMeshToScene( iMesh ): # RETURNS iEntity
   return lib.iAddMeshToScene(ctypes.c_int(iMesh))
def iStaticMeshForNormalMapping( iMesh ): # RETURNS iEntity
    return lib.iStaticMeshForNormalMapping(ctypes.c_int(iMesh))
def iHWAcceleratedMesh( iMesh, iFrame = 0 ):
   lib.iHWAcceleratedMesh(ctypes.c_int(iMesh),ctypes.c_int(iFrame))
def iHWAcceleratedMeshEntity( iEntity, iFrame = 0 ):
    lib.iHWAcceleratedMeshEntity(ctypes.c_int(iEntity),ctypes.c_int(iFrame))
def iMeshFrameCount( iMesh ): # RETURNS UInteger
    return lib.iMeshFrameCount(ctypes.c_int(iMesh))
def iMeshBufferCount( iMesh, iFrame ): # RETURNS UInteger
   return lib.iMeshBufferCount(ctypes.c_int(iMesh),ctypes.c_int(iFrame))
def iMeshIndexCount( iMesh, iFrame, iMeshBuffer ): # RETURNS UInteger
    return lib.iMeshIndexCount(ctypes.c_int(iMesh),ctypes.c_int(iFrame),ctypes.c_uint(iMeshBuffer))
#declare sub iGetMeshIndices( byval mesh as iMesh, byval frame as integer, byref indicies as ushort, byval meshBuffer as integer = 0 )
#declare sub iSetMeshIndices( byval mesh as iMesh, byval frame as integer, byref indicies as ushort, byval meshBuffer as integer = 0 )
def iMeshVertexCount( iMesh, iFrame, iMeshBuffer ): # RETURNS UInteger
    return lib.iMeshVertexCount(ctypes.c_int(iMesh),ctypes.c_int(iFrame),ctypes.c_uint(iMeshBuffer))
#declare function iGetMeshVertexMemory(byval mesh as iMesh,byval frame as integer = 0,byval meshBuffer as integer = 0 ) as any ptr
#declare sub iGetMeshVertices(byval mesh as iMesh,byval frame as integer,byref verticies as iVERTEX,byval meshBuffer as integer = 0 )
#declare sub iSetMeshVertices(byval mesh as iMesh,byval frame as integer,byref verticies as iVERTEX,byval meshBuffer as integer = 0 )
def iMeshBoundingBox( iMesh, minxe, miny, minz, maxx, maxy, maxz ):
    lib.iMeshBoundingBox(ctypes.c_int(iMesh),ctypes.c_float(minx),ctypes.c_float(miny),ctypes.c_float(minz),ctypes.c_float(maxx),ctypes.c_float(maxy),ctypes.c_float(maxz))
def iMeshCount(): # RETURNS UInteger
    return lib.iMeshCount()
def iLoadMeshBSP( bspFile ): # RETURNS iMesh
    return lib.iLoadMeshBSP(str.encode(bspFile,'utf-8'))
def iCreateEntityBSPfromMeshBSP( bspiMesh ): # RETURNS iEntity
    return lib.iCreateEntityBSPfromMeshBSP(ctypes.c_int(bspiMesh))
def iStaticCollisionsBSP( bspiMesh, bspiEntity, iEntity, radiusx, radiusy, radiusz, gravityx, gravityy, gravityz, offsetx, offsety, offsetz ):
    lib.iStaticCollisionsBSP(ctypes.c_int(bspiMesh),ctypes.c_int(bspiEntity),ctypes.c_int(iEntity),ctypes.c_float(radiusx),ctypes.c_float(radiusy),ctypes.c_float(radiusz),ctypes.c_float(gravityx),ctypes.c_float(gravityy),ctypes.c_float(gravityz),ctypes.c_float(offsetx),ctypes.c_float(offsety),ctypes.c_float(offsetz))

##############################################################
# 	Mirror
##############################################################


##############################################################
# 	Network
##############################################################
def iRN_Version(): # RETURNS ZString ptr
    return lib.iRN_Version()
def iRN_Init(): # RETURNS Integer
    return lib.iRN_Init()
def iRN_StartServer( maxConnections, localPort, password = "" ): # RETURNS Integer
    return lib.iRN_StartServer(ctypes.c_uint(maxConnections),ctypes.c_uint(localPort),str.encode(password,'utf-8'))
def iRN_StartClient(): # RETURNS Integer
    return lib.iRN_StartClient()
def iRN_Connect( host, remotePort, password = "", blocking = FALSE ): # RETURNS Integer
    return lib.iRN_Connect(str.encode(host,'utf-8'),ctypes.c_uint(remotePort),str.encode(password,'utf-8'),ctypes.c_int(blocking))
def iRN_CloseConnection( notify = TRUE ): # RETURNS boolean
    return lib.iRN_CloseConnection(ctypes.c_int(notify))
def iRN_Shutdown( waitTimeMS = 100 ): # RETURNS boolean
    return lib.iRN_Shutdown(ctypes.c_uint(waitTimeMS))
def iRN_CheckMessages(): # RETURNS boolean
    return lib.iRN_CheckMessages()
def iRN_ClearMessage(): # RETURNS boolean
    return lib.iRN_ClearMessage()
def iRN_ForwardMessage(): # RETURNS boolean
    return lib.iRN_ForwardMessage()
def iRN_DisconnectPlayer( playerID, notify = TRUE ): # RETURNS boolean
    return lib.iRN_DisconnectPlayer(ctypes.c_int(playerID),ctypes.c_int(notify))
def iRN_GetMyID(): # RETURNS Integer
    return lib.iRN_GetMyID()
def iRN_GetPlayerID(): # RETURNS Integer
    return lib.iRN_GetPlayerID()
def iRN_GetDisconnectID(): # RETURNS Integer
    return lib.iRN_GetDisconnectID()
def iRN_GetTotalConnections(): # RETURNS UInteger
    return lib.iRN_GetTotalConnections()
def iRN_GetTime(): # RETURNS Integer
    return lib.iRN_GetTime()
def iRN_Active(): # RETURNS Boolean
    return lib.iRN_Active()
def iRN_PingHost( host, remotePort ): # RETURNS Integer
    return lib.iRN_PingHost(str.encode(host,'utf-8'),ctypes.c_uint(remotePort))
def iRN_GetAveragePing( playerID ): # RETURNS Integer
    return lib.iRN_GetAveragePing(ctypes.c_int(playerID))
def iRN_GetLastPing( playerID ): # RETURNS Integer
    return lib.iRN_GetLastPing(ctypes.c_int(playerID))
def iRN_GetLowestPing( playerID ): # RETURNS Integer
    return lib.iRN_GetLowestPing(ctypes.c_int(playerID))
def iRN_AddToBanList( ip, milliseconds = 60000 ):
    lib.iRN_AddToBanList(str.encode(ip,'utf-8'),ctypes.c_int(milliseconds))
def iRN_RemoveFromBanList( ip ):
    lib.iRN_RemoveFromBanList(str.encode(ip,'utf-8'))
def iRN_ClearBanList():
    lib.iRN_ClearBanList()
def iRN_IsBanned( ip ): # RETURNS Boolean
    return lib.iRN_IsBanned(str.encode(ip,'utf-8'))
def iRN_SendMessage( playerID, priority, reliability, orderingChannel = 0, broadcast = TRUE ): # RETURNS Integer
    return lib.iRN_SendMessage(ctypes.c_int(playerID),ctypes.c_int(priority),ctypes.c_int(reliability),ctypes.c_int(orderingChannel),ctypes.c_int(broadcast))
def iRN_SendTimeStamp():
    lib.iRN_SendTimeStamp()
def iRN_SendByte( bValue ):
    lib.iRN_SendByte(ctypes.c_byte(bValue))
def iRN_SendInt( iValue ):
    lib.iRN_SendInt(ctypes.c_int(iValue))
def iRN_SendFloat( fValue ):
    lib.iRN_SendFloat(ctypes.c_float(fValue))
def iRN_SendString( sValue ):
    lib.iRN_SendString(str.encode(sValue,'utf-8'))
def iRN_GetTimeStamp(): # RETURNS integer
    return lib.iRN_GetTimeStamp()
lib.iRN_GetByte.restype = ctypes.c_byte
def iRN_GetByte(): # RETURNS Byte
    return lib.iRN_GetByte()
def iRN_GetInt(): # RETURNS Integer
    return lib.iRN_GetInt()
lib.iRN_GetFloat.restype = ctypes.c_float
def iRN_GetFloat(): # RETURNS Single
    return lib.iRN_GetFloat()
lib.iRN_GetString.restype = ctypes.c_char_p
def iRN_GetString(): # RETURNS ZString ptr
    return lib.iRN_GetString().decode('UTF-8')
def iCreateSpline(): # RETURNS uinteger
    return lib.iCreateSpline()
def iFreeSpline( splineID ): # RETURNS boolean
    return lib.iFreeSpline(ctypes.c_uint(splineID))
lib.iGetSplineX.restype = ctypes.c_float
def iGetSplineX( splineID, timeMS ): # RETURNS Single
    return lib.iGetSplineX(ctypes.c_uint(splineID),ctypes.c_float(timeMS))
lib.iGetSplineY.restype = ctypes.c_float
def iGetSplineY( splineID, timeMS ): # RETURNS Single
    return lib.iGetSplineY(ctypes.c_uint(splineID),ctypes.c_float(timeMS))
lib.iGetSplineZ.restype = ctypes.c_float
def iGetSplineZ( splineID, timeMS ): # RETURNS Single
    return lib.iGetSplineZ(ctypes.c_uint(splineID),ctypes.c_float(timeMS))
def iInit2DSpline( splineID, StartX, StartY, Ctrl1X, Ctrl1Y, Ctrl2X, Ctrl2Y, EndX, EndY ):
    lib.iInit2DSpline(ctypes.c_uint(splineID),ctypes.c_float(StartX),ctypes.c_float(StartY),ctypes.c_float(Ctrl1X),ctypes.c_float(Ctrl1Y),ctypes.c_float(Ctrl2X),ctypes.c_float(Ctrl2Y),ctypes.c_float(EndX),ctypes.c_float(EndY))
def iInit3DSpline( splineID, StartX, StartY, StartZ, Ctrl1X, Ctrl1Y, Ctrl1Z, Ctrl2X, Ctrl2Y, Ctrl2Z, EndX, EndY, EndZ ):
    lib.iInit3DSpline(ctypes.c_uint(splineID),ctypes.c_float(StartX),ctypes.c_float(StartY),ctypes.c_float(StartZ),ctypes.c_float(Ctrl1X),ctypes.c_float(Ctrl1Y),ctypes.c_float(Ctrl1Z),ctypes.c_float(Ctrl2X),ctypes.c_float(Ctrl2Y),ctypes.c_float(Ctrl2Z),ctypes.c_float(EndX),ctypes.c_float(EndY),ctypes.c_float(EndZ))
lib.iExtrapolatePoint.restype = ctypes.c_float
def iExtrapolatePoint( timeMS, initPos, vel, accel = 0.0, maxvel = 0.0 ): # RETURNS Single
    return lib.iExtrapolatePoint(ctypes.c_float(timeMS),ctypes.c_float(initPos),ctypes.c_float(vel),ctypes.c_float(accel),ctypes.c_float(maxvel))
def iGetTotalSplines(): # RETURNS UInteger
    return lib.iGetTotalSplines()

##############################################################
# 	Particles
##############################################################
def iCreateParticleSystem( add_emitter, parent = 0, eid = -1, posX = 0.0, posY = 0.0, posZ = 0.0, rotX = 0.0, rotY = 0.0, rotZ = 0.0, scaleX = 1.0, scaleY = 1.0, scaleZ = 1.0): # RETURNS iPARTICLE_SYSTEM
    return lib.iCreateParticleSystem(ctypes.c_int(add_emitter),ctypes.c_int(parent),ctypes.c_int(eid),ctypes.c_float(posX),ctypes.c_float(posY),ctypes.c_float(posZ),ctypes.c_float(rotX),ctypes.c_float(rotY),ctypes.c_float(rotZ),ctypes.c_float(scaleX),ctypes.c_float(scaleY),ctypes.c_float(scaleZ))
def iParticleSize( particle_emitter, x, y ):
    lib.iParticleSize(ctypes.c_int(particle_emitter),ctypes.c_float(x),ctypes.c_float(y))
def iParticleMinSize( particle_emitter, x, y ):
    lib.iParticleMinSize(ctypes.c_int(particle_emitter),ctypes.c_float(x),ctypes.c_float(y))
def iParticleMaxSize( particle_emitter, x, y ):
    lib.iParticleMaxSize(ctypes.c_int(particle_emitter),ctypes.c_float(x),ctypes.c_float(y))
#  ctypes.c_void_p  ctypes.py_object  ctypes.addressof
def iCreateParticleEmitter( particle_system, psettings ): # RETURNS iEMITTER
    return lib.iCreateParticleEmitter(ctypes.c_int(particle_system),ctypes.py_object(psettings))
def iCreateAnimatedEntityEmitter( iPARTICLE_SYSTEM, iEntity, use_normal_direction, normal_direction_modifier, emit_from_every_vertex, iPARTICLE_SETTINGS ): # RETURNS iEMITTER
    return lib.iCreateAnimatedEntityEmitter(ctypes.c_int(iPARTICLE_SYSTEM),ctypes.c_int(iEntity),ctypes.c_uint(use_normal_direction),ctypes.c_float(normal_direction_modifier),ctypes.c_int(emit_from_every_vertex),ctypes.c_int(iPARTICLE_SETTINGS))
'''
declare function iCreateFadeOutAffector alias "iCreateFadeOutAffector" ( byval particle_system as iPARTICLE_SYSTEM, byval fade_speed as uinteger, _
      byval fade_to_red as uinteger, byval fade_to_green as uinteger, byval fade_to_blue as uinteger ) as iAffector
declare function iCreateGravityAffector Alias "iCreateGravityAffector" ( ByVal particle_system As iPARTICLE_SYSTEM, ByVal x As Single, _
      ByVal y As Single, ByVal z As Single, ByVal timeForceLost As uInteger = 1000 ) as iAffector
declare function iCreateAttractionAffector Alias "iCreateAttractionAffector" ( ByVal particle_system As iPARTICLE_SYSTEM, _
      ByVal x As Single, ByVal y As Single, ByVal z As Single, ByVal speed As Single = 1.0, ByVal attract as uinteger = 1, _
      ByVal affectX as uinteger = 1, ByVal affectY as uinteger = 1, ByVal affectZ as uinteger = 1 ) as iAffector
declare function iCreateRotationAffector Alias "iCreateRotationAffector" ( ByVal particle_system As iPARTICLE_SYSTEM, ByVal Speed_X As Single, _
      ByVal Speed_Y As Single, ByVal Speed_Z As Single, ByVal pivot_X As Single, ByVal pivot_Y As Single, ByVal pivot_Z As Single ) as iAffector
declare sub iFreeAffectors alias "iFreeAffectors" ( byval particle_system as iPARTICLE_SYSTEM )
declare sub iEmitterDirection alias "iEmitterDirection" ( byval particle_system As iEMITTER, byval x as single, byval y as single, byval z as single )
declare sub iEmitterMinPPS alias "iEmitterMinPPS" ( byval particle_system As iEMITTER, byval minPPS as uinteger )
declare sub iEmitterMaxPPS alias "iEmitterMaxPPS" ( byval particle_system As iEMITTER, byval maxPPS as uinteger )
declare sub iEmitterMinStartColor alias "iEmitterMinStartColor" ( byval particle_system As iEMITTER, byval Red as uinteger, byval Green as uinteger, byval Blue as uinteger )
declare sub iEmitterMaxStartColor alias "iEmitterMaxStartColor" ( byval particle_system As iEMITTER, byval Red as uinteger, byval Green as uinteger, byval Blue as uinteger )
declare sub iAffectorEnable alias "iAffectorEnable" ( byval affector as iAffector, byval enable as uinteger )
declare sub iFadeOutAffectorTime alias "iFadeOutAffectorTime" ( byval affector as iAffector, byval fade_speed as single )
declare sub iFadeOutAffectorTargetColor alias "iFadeOutAffectorTargetColor" ( byval affector as iAffector, byval fade_to_red as uinteger, byval fade_to_green as uinteger, byval fade_to_blue as uinteger )
declare sub iGravityAffectorDirection alias "iGravityAffectorDirection" ( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
declare sub iGravityAffectorTimeForceLost alias "iGravityAffectorTimeForceLost" ( byval affector as iAffector, byval time_Force_Lost as single )
declare sub iAttractionAffectorAffectX alias "iAttractionAffectorAffectX" ( byval affector as iAffector, byval affect_x as uinteger )
declare sub iAttractionAffectorAffectY alias "iAttractionAffectorAffectY" ( byval affector as iAffector, byval affect_y as uinteger )
declare sub iAttractionAffectorAffectZ alias "iAttractionAffectorAffectZ" ( byval affector as iAffector, byval affect_z as uinteger )
declare sub iAttractionAffectorAttract alias "iAttractionAffectorAttract" ( byval affector as iAffector, byval attract as uinteger )
declare sub iAttractionAffectorPoint alias "iAttractionAffectorPoint" ( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
declare sub iRotationAffectorPivotPoint alias "iRotationAffectorPivotPoint" ( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
declare sub iMaxDistanceOfEffect alias "iMaxDistanceOfEffect" ( byval affector as iAffector, byval NewDistance as single )
declare sub iMinDistanceOfEffect alias "iMinDistanceOfEffect" ( byval affector as iAffector, byval NewDistance as single )
declare sub iColumnDistanceOfEffect alias "iColumnDistanceOfEffect" ( byval affector as iAffector, byval NewDistance as single )
declare sub iCenterOfEffect alias "iCenterOfEffect" ( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
declare sub iStrengthOfEffect alias "iStrengthOfEffect" ( byval affector as iAffector, byval x as single, byval y as single, byval z as single )
declare function iCreateBoxEmitter alias "iCreateBoxEmitter" (byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER
declare sub iBoxEmitterSize alias "iBoxEmitterSize" (byval emitter as iEMITTER,byval sx as single,byval sy as Single,byval sz as Single)
declare function iCreateCylinderEmitter alias "iCreateCylinderEmitter" (byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER
declare sub iCylinderEmitterCenter alias "iCylinderEmitterCenter" (byval emitter as iEMITTER,byval x as Single,byval y as Single,byval z as Single)
declare sub iCylinderEmitterRadius alias "iCylinderEmitterRadius" (byval emitter as iEMITTER,byval radius as Single)
declare sub iCylinderEmitterLength alias "iCylinderEmitterLength" (byval emitter as iEMITTER,byval length as Single)
declare function iCreateMeshEmitter alias "iCreateMeshEmitter" (byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER
declare sub iMeshEmitterMesh alias "iMeshEmitterMesh" (byval emitter as iEMITTER,byval meshEntity as iEntity)
declare sub iMeshEmitterEveryVertex alias "iMeshEmitterEveryVertex" (byval emitter as iEMITTER,byval allMeshVertex as Boolean)
declare function iCreateRingEmitter(byval Particles as iPARTICLE_SYSTEM,byval min as UInteger,byval max as UInteger) as iEMITTER
declare sub iRingEmitterCenter alias "iRingEmitterCenter" (byval emitter as iEMITTER,byval x as Single,byval y as Single,byval z as Single)
declare sub iRingEmitterRadius alias "iRingEmitterRadius" (byval emitter as iEMITTER,byval radius as Single)
declare sub iRingEmitterThickness alias "iRingEmitterThickness" (byval emitter as iEMITTER,byval ringThickness as Single)

'''
##############################################################
# 	Pivot
##############################################################
lib.iCreatePivot.restype = ctypes.c_int
def iCreatePivot( parent = NULL ):
    return lib.iCreatePivot(ctypes.c_int(parent))

##############################################################
# 	Shaders
##############################################################
'''
declare function iCreateNamedVSC alias "iCreateNamedVSC" ( byval shader as iSHADER ptr, byval const_name as zstring ptr, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer
declare function iCreateNamedPSC alias "iCreateNamedPSC" ( byval shader as iSHADER ptr, byval const_name as zstring ptr, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer
declare function iCreateAddressedVSC alias "iCreateAddressedVSC" ( byval shader as iSHADER ptr, byval const_address as integer, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer
declare function iCreateAddressedPSC alias "iCreateAddressedPSC" ( byval shader as iSHADER ptr, byval const_address as integer, byval const_preset as integer, byval const_data as single ptr, byval data_count as integer ) as integer
declare function iAddHLShader alias "iAddHLShader" ( _
        byval vertex_program as zstring ptr, _
        byval vertex_start_function as zstring ptr, _
        byval vertex_prog_type as uinteger, _
        byval pixel_program as zstring ptr, _
        byval pixel_start_function as zstring ptr, _
        byval pixel_prog_type as uinteger, _
        byval material_type as uinteger ) as iSHADER ptr
declare function iLoadHLShader alias "iLoadHLShader" ( _
        byval vertex_program_filename as zstring ptr, _
        byval vertex_start_function as zstring ptr, _
        byval vertex_prog_type as uinteger, _
        byval pixel_program_filename as zstring ptr, _
        byval pixel_start_function as zstring ptr, _
        byval pixel_prog_type as uinteger, _
        byval material_type as uinteger ) as iSHADER ptr
declare function iAddShader alias "iAddShader" ( _
        byval vertex_program as zstring ptr, _
        byval pixel_program as zstring ptr, _
        byval material_type as uinteger ) as iSHADER ptr
declare function iLoadShader alias "iLoadShader" ( _
        byval vertex_program_filename as zstring ptr, _
        byval pixel_program_filename as zstring ptr, _
        byval material_type as uinteger ) as iSHADER ptr
declare sub iApplyShaderEntity alias "iApplyShadersEntity" (byval shader_reply as iSHADER,byval entity as iEntity)
declare sub iApplyShaderMaterial alias "iApplyShadersMaterial" (byval shader_reply as iSHADER,byval entity as iEntity,byval index as UInteger)
'''

##############################################################
# 	Shadows
##############################################################
def iShadowColor( a, r, g, b ):
    lib.iShadowColor(ctypes.c_uint(a),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))
def iLightCastShadows( iLight, castShadows = TRUE ):
    lib.iLightCastShadows(ctypes.c_int(iLight),ctypes.c_int(castShadows))
def iEntityCastShadow( iEntity ): # RETURN iSHADOW
    return lib.iEntityCastShadow(ctypes.c_int(iEntity))
def iEntityFreeShadow( iEntity, iSHADOW ): # RETURNS Boolean
    return lib.iEntityFreeShadow(ctypes.c_int(iEntity),ctypes.c_int(iSHADOW))
def iSetShadowMesh( shadow ):
    lib.iSetShadowMesh(ctypes.c_int(shadow))
    
##############################################################
# 	Sprite
##############################################################
def iLoadSprite( file, fixedpitch = FALSE, parent = NULL ): # RETURNS iSPRITE
    return lib.iLoadSprite(str.encode(file,'utf-8'),ctypes.c_int(fixedpitch),ctypes.c_int(parent))
def iCreateSprite( fixedpitch = FALSE, parent = NULL ): # RETURNS iSPRITE
    return lib.iCreateSprite(ctypes.c_int(fixedpitch),ctypes.c_int(parent))
def iScaleSprite( iSPRITE, w, h ):
    lib.iScaleSprite(ctypes.c_int(iSPRITE),ctypes.c_float(w),ctypes.c_float(h))
def iRotateSprite( iSPRITE, x, y, z ):
    lib.iRotateSprite(ctypes.c_int(iSPRITE),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iSpriteColor( iSPRITE, r, g, b ):
    lib.iSpriteColor(ctypes.c_int(iSPRITE),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b))

##############################################################
# 	Surface
##############################################################


##############################################################
# 	Terrain
##############################################################
def iLoadTerrain( filepath, parent = 0 ): # RETURNS iTerrain
    return lib.iLoadTerrain(str.encode(filepath,'utf-8'),ctypes.c_int(parent))
def iTerrainHeight( terrain, x, z ): # RETURNS single
    return lib.iTerrainHeight(ctypes.c_int(terrain),ctypes.c_float(x),ctypes.c_float(z))
#def iCreateTerrain( filepath, patchSize = ETPS_17, parent = 0 ): # RETURNS iTerrain
#    return lib.iCreateTerrain(str.encode(filepath,'utf-8'),ctypes.c_int(patchSize),ctypes.c_int(parent)
def iCreateTerrain( parent = 0 ): # RETURNS iTerrain
    return lib.iCreateTerrain(ctypes.c_int(parent))
def iScaleTerrainTexture( terrain, x, y ):
    lib.iScaleTerrainTexture(ctypes.c_int(terrain),ctypes.c_float(x),ctypes.c_float(y))

##############################################################
# 	Text&Font
##############################################################
def iLoadFont( path ):
    return lib.iLoadFont(str.encode(path,'utf-8'))
def iSetFont( font ):
    return lib.iSetFont(ctypes.c_int(font))
def iTextLen( text ): # RETURNS UInteger
    return lib.iTextLen(str.encode(text,'utf-8'))
def iText( x, y, txt, hcenter = FALSE, vcenter = FALSE ):
    return lib.iText(ctypes.c_int(x),ctypes.c_int(y),str.encode(txt,'utf-8'),ctypes.c_int(hcenter),ctypes.c_int(vcenter))
def iFontWidth(): # RETURNS UInteger
    return lib.iFontWidth()
def iFontHeight(): # RETURNS UInteger
    return lib.iFontHeight()
def iColor( r, g, b, a = 255 ):
    return lib.iColor(ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b),ctypes.c_uint(a))

##############################################################
# 	Texture
##############################################################
def iTextureCreateFlag( ETCF_TEXTURE_CREATION_FLAG, enable ):
    '''Sets the Texture Creation flag  **DISABLED**
    Args:
      ETCF_TEXTURE_CREATION_FLAG: A value from the enumeration.
      enable: TRUE or FALSE
    Returns:
      NOTHING.
    '''
    lib.iTextureCreateFlag(ctypes.c_int(ETCF_TEXTURE_CREATION_FLAG),ctypes.c_int(enable))
def iCreateTexture( tname, x, y, ECF_COLOR_FORMAT ): # RETURNS iTEXTURE
    return lib.iCreateTexture(str.encode(tname,'utf-8'),ctypes.c_uint(x),ctypes.c_uint(y),ctypes.c_int(ECF_COLOR_FORMAT))
def iLoadTexture( path ):
    return lib.iLoadTexture(str.encode(path,'utf-8'))
def iCreateRenderTexture( x, y ): # RETURNS iTEXTURE
    return lib.iCreateRenderTexture(ctypes.c_uint(x),ctypes.c_uint(y))
def iDrawTexture( iTEXTURE, iX, iY ):
    lib.iDrawTexture(ctypes.c_int(iTEXTURE),ctypes.c_int(iX),ctypes.c_int(iY))
def iDrawSceneToTexture( iTEXTURE ):
    lib.iDrawSceneToTexture(ctypes.c_int(iTEXTURE))
def iRenderTargetTexture( iTEXTURE, alpha = 255, clearBackBuffer = TRUE, clearZBuffer = TRUE ):
    lib.iRenderTargetTexture(ctypes.c_int(iTEXTURE),ctypes.c_uint(alpha),ctypes.c_int(clearBackBuffer),ctypes.c_int(clearZBuffer))
def iFreeTexture( iTEXTURE ):
    lib.iFreeTexture(ctypes.c_int(iTEXTURE))
def iTextureBlend( destiTEXTURE, srciTEXTURE, xoffset, yoffset, operation ): # RETURNS UInteger
    return lib.iTextureBlend(ctypes.c_int(destiTEXTURE),ctypes.c_int(srciTEXTURE),ctypes.c_int(xoffset),ctypes.c_int(yoffset),ctypes.c_int(operation))
def iScaleEntityTexture( iTEXTURE, sx, sy, index = 0 ):
    lib.iScaleEntityTexture(ctypes.c_int(iTEXTURE),ctypes.c_float(sx),ctypes.c_float(sy),ctypes.c_uint(index))
def iTextureWidth( iTEXTURE ): # RETURNS UInteger
    return lib.iTextureWidth(ctypes.c_int(iTEXTURE))
def iTextureHeight( iTEXTURE ): # RETURNS UInteger
    return lib.iTextureHeight(ctypes.c_int(iTEXTURE))
def iMaskTexture( iTEXTURE, r, g, b, alpha = 0 ):
    lib.iMaskTexture(ctypes.c_int(iTEXTURE),ctypes.c_uint(r),ctypes.c_uint(g),ctypes.c_uint(b),ctypes.c_uint(alpha))
def iLockTexture( iTEXTURE ): # RETURNS UInteger
    return lib.iLockTexture(ctypes.c_int(iTEXTURE))
def iUnlockTexture( iTEXTURE ):
    lib.iUnlockTexture(ctypes.c_int(iTEXTURE))
def iNormalMapTexture( iTEXTURE, amplitude ):
    lib.iNormalMapTexture(ctypes.c_int(iTEXTURE),ctypes.c_float(amplitude))
def iPositionTexture( entity, x, y, matIndex = 0, texIndex = 0 ):
    lib.iPositionTexture(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_uint(matIndex),ctypes.c_uint(texIndex))
def iAngleTexture( entity, radAngle, matIndex, texIndex ):
    lib.iAngleTexture(ctypes.c_int(entity),ctypes.c_float(radAngle),ctypes.c_uint(matIndex),ctypes.c_uint(texIndex))
def iScaleTexture( entity, sx, sy, matIndex = 0, texIndex = 0 ):
    lib.iScaleTexture(ctypes.c_int(entity),ctypes.c_float(sx),ctypes.c_float(sy),ctypes.c_uint(matIndex),ctypes.c_uint(texIndex))
def iFlipTexture( texture ): # RETURNS boolean
    return lib.iFlipTexture(ctypes.c_int(texture))
def iCopyTexture( texture ): # RETURNS iTEXTURE
    return lib.iCopyTexture(ctypes.c_int(texture))
def iSaveTexture( texture, filename ): # RETURNS boolean
    return lib.iSaveTexture(ctypes.c_int(texture),str.encode(filename,'utf-8'))
    
##############################################################
# 	ZoneManager
##############################################################
'''
declare function iCreateLODMgr alias "iCreateLODMgr" (byval fadeScale as uinteger = 4, byval useAlpha as uinteger = true, byval callback as any ptr = 0 ) as iLODEntity
declare sub iLODMesh alias "iLODMesh" ( byval entity as iLODEntity, byval distance as single, byval mesh as iMesh )
declare sub iLODMaterialMap alias "iLODMaterialMap" ( byval entity as iLODEntity, byval source as EMT_MATERIAL_TYPES, byval target as EMT_MATERIAL_TYPES )
declare function iCreateZoneMgr alias "iCreateZoneMgr" (byval nearDistance as single = 0, _
      byval farDistance as single = 12000 ) as iZoneEntity
declare sub iZoneMgrProperties alias "iZoneMgrProperties" ( _
        byval zoneEntity as iZoneEntity, _
        byval nearDistance as single, _
        byval farDistance as single, _
        byval accumulateChildBoxes as uinteger )
declare sub iZoneMgrBndBox alias "iZoneMgrBndBox" (byval zoneEntity as iZoneEntity, _
        byval x as single, _
        byval y as single, _
        byval z as single, _
        byval boxWidth as single, _
        byval boxHeight as single, _
        byval boxDepth as single )
declare sub iZoneMgrAttachTerrain alias "iZoneMgrAttachTerrain" ( _
        byval zoneEntity as iZoneEntity, _
        byval terrain as iTerrain, _
        byval structureMapFile as zstring ptr, _
        byval colorMapFile as zstring ptr, _
        byval detailMapFile as zstring ptr, _
        byval ImageX as integer, _
        byval ImageY as integer, _
        byval sliceSize as integer )
'''

##############################################################
# 	MISC FUNCTION
##############################################################
#def ARGB( a, r, g, b ):
#    return (a<<24) + (r<<16) + (g<<8) + b
def Dec2bStr( dec ):
    return bytes(str(dec),encoding='UTF-8')
def Sign(a):
    try:
        return (1 - int(a / (a**2)**0.5)) // 2
    except ZeroDivisionError:
        return 0




'''





def iGetCollisionGroupFromMesh( entity, iframe = 0, meta = NULL ): #Returns iSelector
    return lib.iGetCollisionGroupFromMesh(ctypes.c_int(entity),ctypes.c_int(iframe),ctypes.c_int(meta))
def iGetCollisionGroupFromComplexMesh( entity, iframe = 0 ): #Returns iSelector
    return lib.iGetCollisionGroupFromComplexMesh(ctypes.c_int(entity),ctypes.c_int(iframe))
def iGetCollisionGroupFromBox( entity, meta = NULL ): #Returns iSelector
    return lib.iGetCollisionGroupFromBox(ctypes.c_int(entity),ctypes.c_int(meta))
def iGetCollisionGroupFromTerrain( terrain, level_of_detail ): #Returns iSelector
    return lib.iGetCollisionGroupFromTerrain(ctypes.c_int(terrain),ctypes.c_int(level_of_detail))
def iRemoveCollisionGroup( iSelector, entity ):
    lib.iRemoveCollisionGroup(ctypes.c_int(iSelector),ctypes.c_int(entity))
def iSetEntityTriangleSelector( entity, iSelector ):
    lib.iSetEntityTriangleSelector(ctypes.c_int(entity),ctypes.c_int(iSselector))
def iCreateCombinedCollisionGroup(): # Returns IMetaTriangleSelector
    return lib.iCreateCombinedCollisionGroup()
def iAddCollisionGroupToCombination( iMetaSelector, iSelector ):
    lib.iAddCollisionGroupToCombination(ctypes.c_int(iMetaSelector),ctypes.c_int(iSelector))
def iRemoveAllCollisionGroupsFromCombination( iMetaSelector ):
    lib.iRemoveAllCollisionGroupsFromCombination(ctypes.c_int(iMetaSelector))
def iRemoveCollisionGroupFromCombination( iMetaSelector, iSelector ):
    lib.iRemoveCollisionGroupFromCombination(ctypes.c_int(iMetaSelector),ctypes.c_int(iSelector))
#def iAttachCollisionGroupToEntity( iSelector, entity ):
#    lib.iAttachCollisionGroupToEntity(ctypes.c_int(iSelector),ctypes.c_int(entity))
def iGetCollisionPoint( vectorStart, vectorEnd, iSelector, vectorCollision ):
    return lib.iGetCollisionPoint(ctypes.c_int(vectorStart),ctypes.c_int(vectorEnd),ctypes.c_int(iSelector),ctypes.c_int(vectorCollision))
def iGetRayFromScreenCoordinates( x, y, camera, vectorStart, vectorEnd ):
    lib.iGetRayFromScreenCoordinates(ctypes.c_int(x),ctypes.c_int(y),ctypes.c_int(camera),ctypes.c_int(vectorStart),ctypes.c_int(vectorEnd) )
def iGetCollisionEntityFromCamera( camera ):
    return lib.iGetCollisionEntityFromCamera(ctypes.c_int(camera))
def iGetCollisionEntityFromRay( vectorStart, vectorEnd ):
    return lib.iGetCollisionEntityFromRay(ctypes.c_int(vectorStart),ctypes.c_int(vectorEnd))
def iGetCollisionEntityFromScreenCoordinates( x, y ):
    return lib.iGetCollisionEntityFromScreenCoordinates(ctypes.c_int(x),ctypes.c_int(y))
def iGetScreenXFrom3DPosition( x, y, z ):
    return lib.iGetScreenXFrom3DPosition(ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iGetScreenYFrom3DPosition( x, y, z ):
    return lib.iGetScreenYFrom3DPosition(ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iSetupIrrSceneCollision( camera ):
    lib.iSetupIrrSceneCollision(ctypes.c_int(camera))
def iGetChildCollisionEntityFromRay( entity, id, recurse, vectorStart, vectorEnd ):
    return lib.iGetChildCollisionEntityFromRay(ctypes.c_int(entity),ctypes.c_int(id),ctypes.c_int(recurse),ctypes.c_int(vectorStart),ctypes.c_int(vectorEnd))
def iGetChildCollisionEntityFromPoint( entity, id, recurse, vectorPoint ):
    return lib.iGetChildCollisionEntityFromPoint(ctypes.c_int(entity),ctypes.c_int(id),ctypes.c_int(recurse),ctypes.c_int(vectorPoint))
def iGetCollisionEntityAndPointFromRay( sx, sy, sz, ex, ey, ez, id, rootEntity ):
    return lib.iGetCollisionEntityAndPointFromRay(ctypes.c_float(sx),ctypes.c_float(sy),ctypes.c_float(sz),ctypes.c_float(ex),ctypes.c_float(ey),ctypes.c_float(ez),ctypes.c_int(id),ctypes.c_int(rootEntity))
def iAreEntitiesIntersecting( entityA, entityB ):
    return lib.iAreEntitiesIntersecting(ctypes.c_int(entityA),ctypes.c_int(entityB))
def iIsPointInsideEntity( entity, x, y, z ):
    return lib.iIsPointInsideEntity(ctypes.c_int(entity),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z))
def iGetCollisionResultPosition( iSelector, ellipsoidPosX, ellipsoidPosY, ellipsoidPosZ, ellipsoidRadius, velocityX, velocityY, velocityZ, gravityX, gravityY, gravityZ, slidingSpeed ):
    lib.iGetCollisionResultPosition(ctypes.c_int(iSelector),ctypes.c_float(ellipsoidPosX),ctypes.c_float(ellipsoidPosY),ctypes.c_float(ellipsoidPosZ),ctypes.c_float(ellipsoidRadius),ctypes.c_float(velocityX),ctypes.c_float(velocityY),ctypes.c_float(velocityZ),ctypes.c_float(gravityX),ctypes.c_float(gravityY),ctypes.c_float(gravityZ),ctypes.c_float(slidingSpeed))
def iCollFalling():
    return lib.iCollFalling()
lib.iCollHitPositionX.restype = ctypes.c_float
def iCollHitPositionX():
    return lib.iCollHitPositionX()
lib.iCollHitPositionY.restype = ctypes.c_float
def iCollHitPositionY():
    return lib.iCollHitPositionY()
lib.iCollHitPositionZ.restype = ctypes.c_float
def iCollHitPositionZ():
    return lib.iCollHitPositionZ()
lib.iCollNewPositionX.restype = ctypes.c_float
def iCollNewPositionX():
    return lib.iCollNewPositionX()
lib.iCollNewPositionY.restype = ctypes.c_float
def iCollNewPositionY():
    return lib.iCollNewPositionY()
lib.iCollNewPositionZ.restype = ctypes.c_float
def iCollNewPositionZ():
    return lib.iCollNewPositionZ()
def iCameraPick( x, y ):
    return lib.iCameraPick(ctypes.c_int(x),ctypes.c_int(y))
def iGet3DPositionFromScreenCoordinates( screenX, screenY, x, y, z, camera, normalX, normalY, normalZ, distanceFromOrigin ):
    lib.iGet3DPositionFromScreenCoordinates(ctypes.c_int(screenX),ctypes.c_int(screenY),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_float(z),ctypes.c_int(camera),ctypes.c_float(normalX),ctypes.c_float(normalY),ctypes.c_float(normalZ),ctypes.c_float(distanceFromOrigin))
#lib.i3DPositionXFromScreen.restype = ctypes.c_float
#def i3DPositionXFromScreen( screenX, screenY, camera, normalX, normalY, normalZ, distanceFromOrigin ):
#    return lib.i3DPositionXFromScreen(ctypes.c_int(screenX),ctypes.c_int(screenY),ctypes.c_int(camera),ctypes.c_float(normalX),ctypes.c_float(normalY),ctypes.c_float(normalZ),ctypes.c_float(distanceFromOrigin))
#lib.i3DPositionYFromScreen.restype = ctypes.c_float
#def i3DPositionYFromScreen( screenX, screenY, camera, normalX, normalY, normalZ, distanceFromOrigin ):
#    return lib.i3DPositionYFromScreen(ctypes.c_int(screenX),ctypes.c_int(screenY),ctypes.c_int(camera),ctypes.c_float(normalX),ctypes.c_float(normalY),ctypes.c_float(normalZ),ctypes.c_float(distanceFromOrigin))
#lib.i3DPositionZFromScreen.restype = ctypes.c_float
#def i3DPositionZFromScreen( screenX, screenY, camera, normalX, normalY, normalZ, distanceFromOrigin ):
#    return lib.i3DPositionZFromScreen(ctypes.c_int(screenX),ctypes.c_int(screenY),ctypes.c_int(camera),ctypes.c_float(normalX),ctypes.c_float(normalY),ctypes.c_float(normalZ),ctypes.c_float(distanceFromOrigin))
def iGet2DPositionFromScreenCoordinates( screenX, screenY, x, y, camera ):
    lib.iGet2DPositionFromScreenCoordinates(ctypes.c_int(screenX),ctypes.c_int(screenY),ctypes.c_float(x),ctypes.c_float(y),ctypes.c_int(camera))
'''




