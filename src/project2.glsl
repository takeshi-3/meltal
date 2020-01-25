// Project2 Fragment Shader

out vec3 o_project;

void main() {
    // general shader variables
    vec2 iResolution = uTDOutputInfo.res.ba;
    vec2 fragCoord = vUV.st * iResolution;
    vec2 uv = vUV.st;

    float div = texelFetch(sTD2DInputs[0], ivec2(fragCoord), 0).y;

    float left = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(-1, 0), 0).x;
    float right = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(1, 0), 0).x;
    float down = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(0, -1), 0).x;
    float up = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(0, 1), 0).x;

    o_project = vec3((div + left + right + down + up) / 4.0, div, 0.0);
}