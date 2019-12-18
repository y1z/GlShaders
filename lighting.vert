#version 430 core

/*! VERTEX SHADER
\author Yhaliff Said Barraza
 */

/** STRUCTS */

struct Vertex
{
  vec4 position;
  vec3 normal;
  vec2 texcoords;
};

struct LightData
{
	vec4 c_AmbienColor;
	vec4 c_LightColor;
	vec3 c_LightDir;
	vec3 c_LightPos;
	float c_LightmodelIntensity;
    float c_LightAmbienIntensity;
};

/** LAYOUT */
layout(location = 0)in vec4 la_position;
layout(location = 1)in vec3 la_normal;
layout(location = 2)in vec3 la_tan;
layout(location = 3)in vec2 la_texcoords;

/** UNIFORM  VARIABLES */


uniform u_worldAndColor
{
  mat4x4 u_world;
  vec4 u_color;
};

// represents the projection matrix
uniform mat4 uProjection;
//represent the view matrix
uniform mat4 uView;
uniform vec3 uViewDir;
uniform vec4 uViewPos;
// has all data related with light

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

/** OUT VARIABLES */
out vec2 outTexcoords;
out vec3 outNormalWS;
out vec4 outPosWS;
/** IN VARIABLES */

/** MAIN */
void main()
{
  /* needs to be multiplied in this order
  vector4 * matrix4by4 */
  gl_Position = la_position * (u_world * uView * uProjection); 

  outPosWS = la_position * (u_world);

  vec4 WorldSpaceNormal = normalize(vec4(la_normal.xyz ,0.0f) * u_world);
  outNormalWS= vec3(WorldSpaceNormal.xyz) ;
  outTexcoords = la_texcoords;
}
