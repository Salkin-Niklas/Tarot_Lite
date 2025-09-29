extends Control
class_name Anker

var attached_card: Card
enum Types{
	ACTIVE,
	PASSIVE,
	UPGRADE,
	DEFAULT
}
var type: Types = Types.DEFAULT

func _init(pos: Vector2 = Vector2(-10000,-10000), card: Card = Card.new(self, true)) -> void:
	self.global_position = pos
	self.attached_card = card
