extends Object
class_name CharacterObject

var kws : Array = ["name", "color", "prefix", "suffix", "avatar"]
var _color : Color
var _avatar : String 
var type : int setget , _get_type
var value setget dict2character, character2dict

var name  : String = ""
var color : String = "#ffffff" setget _set_color, _get_color
var prefix: String = ""
var suffix: String = ""
var avatar setget _set_avatar, _get_avatar

func _set_color(vcolor : String) -> void:
	_color = Color(vcolor)

func _get_color() -> String:
	return _color.to_html()

func _set_avatar(vavatar : Resource) -> void:
	_avatar = vavatar.resource_path
	
func _get_avatar() -> String:
	return _avatar

func parse_character() -> String: 
	var ncharacter = ""
	
	if name != "":
		ncharacter = "{color=#" + color + "}"
		ncharacter += name
		ncharacter += "{/color}"
	
	return ncharacter

func parse_what(what : String) -> String:
	return prefix + what + suffix

func _get_type() -> int:
	return Ren.Type.CHARACTER

func character2dict() -> Dictionary:
	var dict = {}
	dict["name"]	= name
	dict["color"]	= color
	dict["prefix"]	= prefix
	dict["suffix"]	= suffix
	dict["avatar"]	= _avatar

	return dict

func dict2character(dict : Dictionary):
	if dict.has("name"):
		name = dict.name
	if dict.has("color"):
		color = dict.color
	if dict.has("prefix"):
		prefix = dict.prefix
	if dict.has("suffix"):
		suffix = dict.suffix
	if dict.has("avatar"):
		_avatar = dict.avatar
