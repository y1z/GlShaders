 #version 430 core
/*! FRAGMENT/PIXEL SHADER 
\author Yhaliff Said Barraza
 */

 
/** STRUCTS */

/** UNIFORMS */
uniform sampler2D uTextureSampler;

uniform mat4 uProjection;
//represent the view matrix 
uniform mat4 uView;
layout(std140) uniform u_worldAndColor 
{
  mat4x4 u_world;
  vec4 u_color;
};

// color data 
uniform vec4 uAmbientColor;
uniform vec4 uLightColor;
// position and direction data 
uniform vec4 uLightPos;
uniform vec4  uLightDir;
// how bright are the lights 
uniform float uLightIntensity;
uniform float uAmbientIntensity;


/** IN VARIABLES */
in vec2 outTexcoords;
in vec3 outNormal;
//in vec4 outColor;

/** OUT VARIABLES */ 
out vec4 resultColor;

/*** MAIN*/
void main()
{
/* find out which pixel is being hit by the light 
*/
float InverDotNormal =  clamp(dot(-uLightDir.xyz, outNormal),0,1);
// color the pixels that are being hit 
 resultColor = texture(uTextureSampler,outTexcoords) * clamp(u_color * uLightColor,0.0f,1.0f)  * InverDotNormal; 
}
