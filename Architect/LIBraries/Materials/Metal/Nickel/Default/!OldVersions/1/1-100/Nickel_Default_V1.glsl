// Start of script
/* Material file for the Engineer Superdesk Architect
* Nickel (Default)
* Categories: metal, nickel, elements, earth
* Flammable: yes
* Renewable: no
* Chemical element: true
* Chemical element symbol: Ni
* Atomic number: 28
* Phase: solid
* Rare: somewhat
* Related: Nickel
* Melting point (Kelvin): 1728
* Melting point (Celsius): 1455
* Melting point (Fahrenheit): 2651
* Boiling point (Kelvin): 3003
* Boiling point (Celsius): 2730
* Boiling point (Fahrenheit): 4956
*/
// Sample file, stock file from https://github.com/libretro/glsl-shaders/blob/master/stock.glsl
#if defined(VERTEX)
#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying 
#define COMPAT_ATTRIBUTE attribute 
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif

COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 COLOR;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 COL0;
COMPAT_VARYING vec4 TEX0;

uniform mat4 MVPMatrix;
uniform COMPAT_PRECISION int FrameDirection;
uniform COMPAT_PRECISION int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;

void main()
{
    gl_Position = VertexCoord.x * MVPMatrix[0] + VertexCoord.y * MVPMatrix[1] + VertexCoord.z * MVPMatrix[2] + VertexCoord.w * MVPMatrix[3];
    TEX0.xy = TexCoord.xy;
}

#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif

uniform COMPAT_PRECISION int FrameDirection;
uniform COMPAT_PRECISION int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
uniform sampler2D Texture;
COMPAT_VARYING vec4 TEX0;

void main()
{
    FragColor = COMPAT_TEXTURE(Texture, TEX0.xy);
}
void nickel_default_Texture()
{
  // Not available yet
}
#endif
/* File info
* File type: GLSL source file (*.glsl)
* File version: 1 (2022, Wednesday, April 6th at 5:58 pm)
* Line count (including blank lines and compiler line): 103
*/
// End of script
