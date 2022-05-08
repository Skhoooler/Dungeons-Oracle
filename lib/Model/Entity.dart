
/// Entity Class stores all of the information about entitites (players, npc, enemies)
class Entity {
  //final int _id;
  final String name;
  final String type;
  int level;
  int health;
  Map<String, int>? attribute1;
  Map<String, int>? attribute2;
  Map<String, int>? attribute3;
  bool _isAlive;
  entity_type entityType;

  // Image

  // Constructor
  Entity({
    required this.name,
    required this.type,
    required this.level,
    required this.health,
    this.attribute1,
    this.attribute2,
    this.attribute3,
    required this.entityType,
  }) : _isAlive = true;
}

enum entity_type {
  player,
  npc,
  enemy,
}