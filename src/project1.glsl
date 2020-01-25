// Project1 Fragment Shader

uniform float iGridSpacing;

out vec3 o_project;

void main() {
    // general shader variables
    vec2 iResolution = uTDOutputInfo.res.ba;
    vec2 fragCoord = vUV.st * iResolution;
    vec2 uv = vUV.st;

    vec2 left = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(-1, 0), 0).xy;
    vec2 right = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(1, 0), 0).xy;
    vec2 down = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(0, -1), 0).xy;
    vec2 up = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(0, 1), 0).xy;

    float div = -0.5 * iGridSpacing * (right.x - left.x + up.y - down.y);

    o_project = vec3(0.0, div, 0.0);
}