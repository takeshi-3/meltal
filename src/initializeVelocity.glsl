// Initialize Velocity Fragment Shader

out vec3 o_velocity;

void main() {
    vec2 iResolution = uTDOutputInfo.res.ba;
    vec2 uv = vUV.st;
    vec2 fragCoord = uv * iResolution;

    o_velocity = vec3(0.0);
}