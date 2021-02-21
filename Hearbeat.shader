shader_type canvas_item;
uniform sampler2D beat_image;
uniform float speed =1f; 
uniform float timer;
void fragment(){
	vec2 uv = UV;
//	timer+=TIME;
	uv.x+=timer;//*speed;
	COLOR=texture(beat_image,uv);
}