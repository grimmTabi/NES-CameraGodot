extends Camera2D
class_name RoomTransiCamera

const HORIZONTAL_OFFSET : int = 56
const VERTICAL_OFFSET : int = 64

@onready var m_CameraHorizontalMovement : int = get_viewport_rect().size.x - HORIZONTAL_OFFSET
@onready var m_CameraVerticalMovement : int = get_viewport_rect().size.y - VERTICAL_OFFSET

@export var TargetNode : Node2D  = null

var m_CurrentRoom : Vector2 = Vector2.ZERO

var m_OriginOffset : Vector2 = Vector2.ZERO

func _ready():
	m_OriginOffset = TargetNode.get_position()
	set_position(m_OriginOffset)

func _UpdateCameraPosition(direction : Vector2) -> void:
	m_CurrentRoom += direction
	set_position(m_OriginOffset + m_CurrentRoom * Vector2(m_CameraHorizontalMovement, m_CameraVerticalMovement))

func _OnBodyEnteredCima(body):
	_UpdateCameraPosition(Vector2.UP)

func _OnBodyEnteredBaixo(body):
	_UpdateCameraPosition(Vector2.DOWN)

func _OnBodyEnteredEsqu(body):
	_UpdateCameraPosition(Vector2.LEFT)

func _OnBodyEnteredDire(body):
	_UpdateCameraPosition(Vector2.RIGHT)
