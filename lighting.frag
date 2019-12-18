#version 430 core
/*! FRAGMENT/PIXEL SHADER
\author Yhaliff Said Barraza
 */


/** STRUCTS */

/** UNIFORMS */
uniform u_worldAndColor
{
  mat4x4 u_world;
  vec4 u_color;
};

uniform sampler2D uTextureSampler;

uniform mat4 uProjection;
//represent the view matrix
uniform mat4 uView;
uniform vec3 uViewDir;
uniform vec4 uViewPos;


// color data
uniform vec4 uAmbientColor;
uniform vec4 uDiffuseColor;
uniform vec4 uSpecularColor;
uniform vec4 uPointColor;

// position and direction data
uniform vec4 uLightPos;
uniform vec3  uLightDir;
// how bright are the lights
uniform float uDiffuseIntensity;
uniform float uAmbientIntensity;
uniform float uSpecularIntensity;
uniform float uPointRadius;

/** IN VARIABLES */
in vec2 outTexcoords;

in vec4 outPosWs;
in vec3 outNormal;
//in vec4 outColor;

/** OUT VARIABLES */
out vec4 resultColor;

/*** MAIN*/
void main()
{
/* find out which pixel is being hit by the light
*/
//float InverDotNormal =  clamp(dot(-uLightDir.xyz, outNormal),0,1);
// color the pixels that are being hit
//resultColor = vec4(0.0f,0.1f,1.0f,1.0f);
 resultColor = texture(uTextureSampler,outTexcoords) *  uDiffuseColor;
 // clamp( uDiffuseColor ,0.0f,1.0f); // * InverDotNormal;
}
