import 'package:dungeons_oracle/Model/Entity.dart';
/// Game Class stores all of the information about each game
class Game {
  int? id;
  String name;
  final DateTime dateStarted; // toIso8601String DATETIME method to get string for db
  DateTime? lastDatePlayed;
  List<Entity> players;
  List<Entity>? nonPlayerCharacters;
  List<Entity>? enemies;
  bool fightRunning;

  // Constructor
  Game({
    required this.name,
    required this.dateStarted,
    required this.players,
    this.nonPlayerCharacters,
    this.enemies,
  }) : fightRunning = false, lastDatePlayed = dateStarted;
}