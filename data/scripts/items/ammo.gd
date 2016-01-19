extends Node2D

var picked = false

func _on_Area2D_body_enter(body):
	# Only the player can pick up items
	if body.get_name() == "Player" and not picked:
		# Don't pick up item if ammo >= 100 or if dead
		if Game.ammo >= 100 or Game.status == Game.STATUS_DEAD:
			return

		picked = true
		Game.ammo = min(Game.ammo + 30, 100)
		get_node("AnimationPlayer").play("Pickup")
		get_node("SamplePlayer2D").play("pickup")

func _on_AnimationPlayer_finished():
	queue_free()
