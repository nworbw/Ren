extends Statement
class_name Notify

func _init() -> void:
	._init()
	type = 6 # Ren.StatementType.NOTIFY
	kws = ['info', 'lenght']
	kwargs['info'] = ""
	kwargs['length'] = 1

func exec(dbg : bool = true) -> void:
	if "info" in kwargs:
		kwargs.info = Ren.text_passer(kwargs.info)
		
	if dbg: # for some strage reason .exec(dbg) give error
		.exec()

