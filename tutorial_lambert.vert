
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
layout(location = 0) in vec4 la_position; 
layout(location = 1) in vec3 la_normal;
layout(location = 2) in vec2 la_texcoords;
  
/** UNIFORM  VARIABLES */

// represents the projection matrix 
uniform mat4 uProjection;
//represent the view matrix 
uniform mat4 uView;
uniform u_worldAndColor 
{
  mat4x4 u_world;
  vec4 u_color;
};

 uniform LightData uLight;

/** OUT VARIABLES */ 
out vec2 outTexcoords;
//out vec4 outColor;
/** IN VARIABLES */

/** MAIN */
void main()
{
  mat4 mvp = u_world * uView * uProjection;
  gl_Position = (  la_position *  mvp  );

  outTexcoords = la_texcoords;
  //outColor = vec4(0.0f,0.0f,0.8f,1.0f);
}

