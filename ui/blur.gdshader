shader_type canvas_item;

uniform float lod: hint_range(0.0, 5.0) = 0.0;
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV, lod);
	COLOR = vec4(vec3(0.299 * color.r + 0.587 * color.g + 0.114 * color.b), 1.0);
}