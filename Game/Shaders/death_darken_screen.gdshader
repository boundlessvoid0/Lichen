shader_type canvas_item;

// If you intend to read from mipmaps with `textureLod()` LOD values greater than `0.0`,
// use `filter_nearest_mipmap` instead. This shader doesn't require it.
uniform sampler2D screen_texture : hint_screen_texture;
uniform float darkness_level : hint_range(0.f, 100.f);

void vertex() {
	// Called for every vertex the material is visible on.
}

float circle(vec2 position, float radius)
{
	return length(position - vec2(0.5)) * radius;
}

void fragment() {
	// Called for every pixel the material is visible on.
    COLOR = vec4(vec3(0), circle(UV, darkness_level));
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
