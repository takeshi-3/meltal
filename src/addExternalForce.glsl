// Add External Force Fragment Shader

uniform float iForceRadius;
// uniform vec2 iForceCenter;
uniform float iGridSpacing;
uniform vec2 iForceDir;
uniform float iForceIntensity;
uniform float iDeltaTime;

out vec3 o_velocity;

void main() {
    // general shader variables
    vec2 iResolution = uTDOutputInfo.res.ba;
    vec2 fragCoord = vUV.st * iResolution;
    vec2 uv = vUV.st;
    vec3 texelWidth = vec3(vec2(1.0)/iResolution, 0.0);

    vec2 velocity = texture(sTD2DInputs[0], uv).xy;
    float force = texture(sTD2DInputs[1], uv).x;

    // vec2 force = smoothstep(iForceRadius, 0.0, length(iForceCenter - fragCoord.xy) * texelWidth.xy) * iForceDir * iForceIntensity;

    o_velocity = vec3(velocity + iDeltaTime * force * iForceDir * iForceIntensity, 0.0);
}