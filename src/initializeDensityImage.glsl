// Initialize Density by Image Fragment Shader

out vec3 fragColor;

void main() {
    vec2 iResolution = uTDOutputInfo.res.ba;
    vec2 uv = vUV.st;
    vec2 fragCoord = vUV.st * iResolution;

    fragColor = texture(sTD2DInputs[0], uv).xyz;
}