shader_type canvas_item;

// If you intend to read from mipmaps with `textureLod()` LOD values greater than `0.0`,
// use `filter_nearest_mipmap` instead. This shader doesn't require it.
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_linear_mipmap;
uniform float darkness_level : hint_range(0.f, 20.f) = 0.f;
uniform float blur_amount : hint_range(0.f, 3.f) = 0.f;

void vertex() {
	// Called for every vertex the material is visible on.
}

float circle(vec2 position, float radius)
{
	return pow(length(position - vec2(0.5)) * radius, 0.5f);
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 screen = textureLod(screen_texture, SCREEN_UV, blur_amount);
    COLOR = mix(screen, vec4(vec3(0), 1), circle(UV, darkness_level));
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
