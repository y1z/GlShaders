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
layout(location = 2)in vec2 la_texcoords;
  
/** UNIFORM  VARIABLES */

// represents the projection matrix 
uniform mat4 uProjection;
//represent the view matrix 
uniform mat4 uView;

layout(std140) uniform u_worldAndColor 
{
  mat4x4 u_world;
  vec4 u_color;
};

// has all data related with light

// color data 
uniform vec4 uAmbientColor;
uniform vec4 uLightColor;
// position and direction data 
uniform vec4 uLightPos;
uniform vec4  uLightDir;
// how bright are the lights 
uniform float uLightIntensity;
uniform float uAmbientIntensity;


/** OUT VARIABLES */ 
out vec2 outTexcoords;
out vec3 outNormal;
/** IN VARIABLES */

/** MAIN */
void main()
{
  /* needs to be multiplied in this order
  vector4 * matrix4by4 */
  gl_Position = la_position * (u_world * uView * uProjection);

  vec4 finalNormal = normalize(vec4(la_normal.xyz ,0.0f) * u_world);
  outNormal = vec3(finalNormal.xyz) ;
  outTexcoords = la_texcoords;
}

