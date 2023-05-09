extends Area2D

func _ready():
	self.connect("area_entered",func(area:Area2D):
		if area.get_parent().has_method("kill"):
			area.get_parent().kill()
		)
