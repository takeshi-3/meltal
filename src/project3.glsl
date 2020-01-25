// Project3 Fragment Shader

uniform float iGridSpacing;

out vec3 o_velocity;

void main() {
    // general shader variables
    vec2 iResolution = uTDOutputInfo.res.ba;
    vec2 fragCoord = vUV.st * iResolution;
    vec2 uv = vUV.st;

    vec2 velocity = texture(sTD2DInputs[1], uv).xy;

    float left = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(-1, 0), 0).x;
    float right = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(1, 0), 0).x;
    float down = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(0, -1), 0).x;
    float up = texelFetch(sTD2DInputs[0], ivec2(fragCoord) + ivec2(0, 1), 0).x;

    o_velocity = vec3(velocity - 0.5 * vec2(right - left, up - down) / iGridSpacing, 0.0);
}