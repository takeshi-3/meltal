// Advect Density Fragment Shader
precision highp float;

uniform float iGridSpacing;
uniform float iDeltaTime;
uniform vec2 iResolution;

out vec3 o_density;

void main() {
    //general shader variables
    vec2 fragCoord = vUV.st * iResolution;
    vec2 uv = vUV.st;

    vec2 velocity = texelFetch(sTD2DInputs[1], ivec2(fragCoord), 0).xy;
    vec2 prevPos = ivec2(fragCoord) * iGridSpacing - iDeltaTime * velocity;
    vec2 prevCoord = prevPos / iGridSpacing;

    ivec2 i = ivec2(prevCoord);
    vec2 f = fract(prevCoord);

    vec3 density00 = texelFetch(sTD2DInputs[0], i, 0).xyz;
    vec3 density10 = texelFetch(sTD2DInputs[0], i + ivec2(1, 0), 0).xyz;
    vec3 density01 = texelFetch(sTD2DInputs[0], i + ivec2(0, 1), 0).xyz;
    vec3 density11 = texelFetch(sTD2DInputs[0], i + ivec2(1, 1), 0).xyz;

    o_density = mix(mix(density00, density10, f.x), mix(density01, density11, f.x), f.y);
}