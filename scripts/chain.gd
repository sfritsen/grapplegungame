extends Sprite2D
# Tutorial
# https://www.youtube.com/watch?v=TRHh6gOrUFw
func interpolate(length, duration = 0.2):
	var tween_offset = get_tree().create_tween()
	var tween_rect_h = get_tree().create_tween()
	
	# Adjusted to not scale `length` by 0.2
	tween_offset.tween_property(self, "offset", Vector2(0, length / 2.0), duration)
	
	# Make sure in Rect2, 3rd value is height of the asset
	tween_rect_h.tween_property(self, "region_rect", Rect2(0, 0, 18, length), duration)

func _input(event):
	if event.is_action_pressed("hook"):
		interpolate(150, 0.2)
		await get_tree().create_timer(0.2).timeout
		reverse_interpolate()
		
func reverse_interpolate():
	interpolate(0, 0.75)
