// Advect Velocity Fragment Shader
precision highp float;

uniform float iGridSpacing;
uniform float iDeltaTime;
uniform vec2 iResolution;

out vec3 o_velocity;

void main() {
    // general shader variables
    vec2 fragCoord = vUV.st * iResolution;
    vec2 uv = vUV.st;
    vec3 texelWidth = vec3(vec2(1.)/iResolution, 0.0);

    vec2 velocity = texture(sTD2DInputs[0], uv).xy;
    vec2 prevPos = ivec2(fragCoord) * iGridSpacing - iDeltaTime * velocity;
    vec2 prevCoord = prevPos / iGridSpacing;

    ivec2 i = ivec2(prevCoord);
    vec2 f = fract(prevCoord);

    vec2 velocity00 = texelFetch(sTD2DInputs[0], i, 0).xy;
    vec2 velocity10 = texelFetch(sTD2DInputs[0], i + ivec2(1, 0), 0).xy;
    vec2 velocity01 = texelFetch(sTD2DInputs[0], i + ivec2(0, 1), 0).xy;
    vec2 velocity11 = texelFetch(sTD2DInputs[0], i + ivec2(1, 1), 0).xy;

    o_velocity = vec3(mix(mix(velocity00, velocity10, f.x), mix(velocity01, velocity11, f.x), f.y), 0);
}