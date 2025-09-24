class_name Logline

var timestamp: float
var x: float
var y: float
var click: bool
var obj: String
	
func _init(position:Vector2, clicks:bool=false, objs:String=""):
	timestamp= Time.get_unix_time_from_system()
	x=position.x
	y=position.y
	click=clicks
	obj=objs

func dict():
	var dictio = {
		"timestamp": timestamp,
		"x": x,
		"y": y,
		"click": click,
		"obj": obj 
	}
	return dictio
