#version 120

varying vec4 texcoord;

uniform sampler2D gcolor;
uniform sampler2D gnormal;
uniform sampler2D gdepth;

void main() {
  vec3 finalComposite = texture2D(gcolor, texcoord.st).rgb;
  vec3 finalCompositeDepth = texture2D(gdepth, texcoord.st).rgb;
  vec3 finalCompositeNormal = texture2D(gnormal, texcoord.st).rgb;

  gl_FragData[0] = vec4(finalComposite, 1.0f);
  gl_FragData[2] = vec4(finalCompositeNormal, 1.0f);
  gl_FragData[1] = vec4(finalCompositeDepth, 1.0f);
}
