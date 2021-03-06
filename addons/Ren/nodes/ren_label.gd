extends RichTextLabel
class_name RenTextLabel

export(String, "ren", "bbcode") var mode = "ren"
export(String, FILE, "*.txt") var ren_text_file = ""
export(String, MULTILINE) var ren_text = ""
export(Array, String) var vars_names = []

var file = File.new()

func _ready():
	bbcode_enabled = true
	set_ren_file(ren_text_file)
	update_label()
	
	for vn in vars_names:
		Ren.connect_var(vn, "value_changed", self, "on_value_changed")
	
	connect("meta_clicked", self, "on_meta_clicked")

func update_label():
	bbcode_text = Ren.text_passer(ren_text, mode)

func on_meta_clicked(meta):
	OS.shell_open(meta);

func on_value_changed(new_value):
	update_label()

func set_ren_file(value):
	if value.empty():
		return
		
	file.open(value, file.READ)
	ren_text = file.get_as_text()
	file.close()
	update_label()