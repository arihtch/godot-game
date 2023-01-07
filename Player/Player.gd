extends Area2D


# Declare member variables here. Examples:
export var walking_speed = 200 # How fast the player will move (pixels/sec).
export var running_speed = 400
export var screen_border_indent_size = 50
var screen_size # Size of the game window.

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position.x = screen_size.x/2
	position.y = screen_size.y/2








# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO

	if Input.is_action_pressed("player_up") && Input.is_action_pressed("player_run"):
		velocity.y -= running_speed
	elif Input.is_action_pressed("player_up"):
		velocity.y -= walking_speed
	
	
	if Input.is_action_pressed("player_down") && Input.is_action_pressed("player_run"):
		velocity.y += running_speed
	elif Input.is_action_pressed("player_down"):
		velocity.y += walking_speed
	
	
	if Input.is_action_pressed("player_left") && Input.is_action_pressed("player_run"):
		velocity.x -= running_speed
	elif Input.is_action_pressed("player_left"):
		velocity.x -= walking_speed
	
	if Input.is_action_pressed("player_right") && Input.is_action_pressed("player_run"):
		velocity.x += running_speed
	elif Input.is_action_pressed("player_right"):
		velocity.x += walking_speed
		
		
		
	
		
	
	print(position)
	# applying velocity to the position
	position += velocity * delta
	position.x = clamp(position.x, screen_border_indent_size, screen_size.x - screen_border_indent_size)
	position.y = clamp(position.y, screen_border_indent_size, screen_size.y - screen_border_indent_size)

