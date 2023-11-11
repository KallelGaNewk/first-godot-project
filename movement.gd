extends Sprite2D

var speed = 400
var angular_speed = PI
var blink = false

func _init():
	print("Hello, world!")

func _ready():
	print("Ready!")
	set_process(false) 
	var timer = get_node("Timer")
	timer.start()

func _process(delta):
	var direction = 0
	if Input.is_action_pressed("left"):
		direction = -1
	if Input.is_action_pressed("right"):
		direction = 1
	if Input.is_action_pressed("right") and Input.is_action_pressed("left"):
		direction = 0

	rotation += angular_speed * direction * delta

	var velocity = Vector2.ZERO

	if Input.is_action_pressed("up"):
		velocity = Vector2.UP.rotated(rotation) * speed

	if Input.is_action_pressed("down"):
		velocity = Vector2.DOWN.rotated(rotation) * speed
	
	position += velocity * delta

func _on_timer_timeout():
	if blink:
		visible = not visible

func _on_movement_button_toggled(button_pressed):
	set_process(button_pressed)

func _on_blink_button_toggled(button_pressed):
	blink = button_pressed
	visible = not button_pressed
