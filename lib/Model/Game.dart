import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:dungeons_oracle/Model/Entity.dart';
/// Game Class stores all of the information about each game
class Game {
  String id;
  String name;
  final DateTime dateStarted; // toIso8601String DATETIME method to get string for db
  DateTime? lastDatePlayed;
  List<Entity> players;
  List<Entity>? nonPlayerCharacters = [];
  List<Entity>? enemies = [];
  bool fightRunning;

  // Constructors
  Game({
    required this.name,
    required this.dateStarted,
    required this.players,
    this.nonPlayerCharacters,
    this.enemies,
  }) : id = const Uuid().v1(), fightRunning = false, lastDatePlayed = dateStarted;

  Game.existing({
    required this.id,
    required this.name,
    required this.dateStarted,
    required this.lastDatePlayed,
    required this.players,
    this.nonPlayerCharacters,
    this.enemies,
    required this.fightRunning
  });

  Widget displayGame() {
    return Container(
      color: Colors.blue,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name),
          Text('Last Date Played: ' + lastDatePlayed!.toIso8601String()),
          Row(
            children: [
              const Icon(
                Icons.person,
              ),
              Text(players.length.toString())
            ],
          ),
        ],
      ),
    );
  }
}