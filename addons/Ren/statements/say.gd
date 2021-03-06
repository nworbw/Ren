extends Statement
class_name Say

func _init() -> void:
	._init()
	type = 1 # Ren.StatementType.SAY
	kws += ["who", "what", "text_speed", "kind"]
	kwargs["who"] = ""
	kwargs["add_to_history"] = true

func exec(dbg : bool = true) -> void
	if dbg:
		debug(kws)
	
	if "who" in kwargs:
		if kwargs.who in Ren.variables:
			if Ren.get_type(kwargs.who) == Ren.Type.CHARACTER:
				var org_who = kwargs.who
				var who = Ren.get_character(org_who)
				kwargs.who = who.parse_character()
				
				if "avatar" in Ren.get_character(org_who).value:
					kwargs["avatar"] = Ren.get_character(org_who).avatar
				
				if "what" in kwargs:
					kwargs.what = who.parse_what(kwargs.what)
	
	if "who" in kwargs:
		kwargs.who = Ren.text_passer(kwargs.who)
	
	if "what" in kwargs:
		kwargs.what = Ren.text_passer(kwargs.what)
	
	.exec(false)
