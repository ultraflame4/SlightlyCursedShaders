#version 150

#moj_import <fog.glsl>

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;
uniform float GameTime;


in float vertexDistance;
in vec4 vertexColor;

out vec4 fragColor;

void main() {

    if(vertexColor.xyz == vec3(0.0)){
        float animation = GameTime * 2000;
        fragColor = vec4(
            sin(animation)/2 + 0.5,
            sin(animation+2)/2 + 0.5,
            sin(animation+4)/2 + 0.5,
            1.0
            );
    }
    else{
        vec4 color = vertexColor * ColorModulator;
        fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
    }

}
