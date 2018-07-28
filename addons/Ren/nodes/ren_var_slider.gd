extends "ren_var_range.gd"


func _ready():
	._ready()
	connect("value_changed", self, "on_slider_val_changed")

func on_slider_val_changed(value):
	Ren.set_value(var_name, value)
