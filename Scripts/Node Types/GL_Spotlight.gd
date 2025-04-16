extends GL_Animatable
var light:SpotLight3D
@export var canChangeColor:bool = false
@export var canChangeSize:bool = false
@export var energyMultiplier:float = 500

func _ready():
	light = self.get_parent()

func _sent_signals(signal_ID:String,the_signal):
	match(signal_ID):
		"intensity":
			if typeof(the_signal) == TYPE_BOOL:
				the_signal = the_signal * 1.0
			light.light_energy = max(the_signal,0.0) * energyMultiplier
		"color":
			if canChangeColor:
				light.light_color = the_signal
		"size":
			if canChangeSize:
				if typeof(the_signal) == TYPE_BOOL:
					the_signal = the_signal * 1.0
				light.spot_angle = clamp(the_signal * 45.0,0.1,90)
	pass 
