import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

import 'package:dungeons_oracle/Model/Game.dart';


/// SQLite Database
class DatabaseConnection {
  // Constructors
  static final DatabaseConnection instance = DatabaseConnection._init();

  DatabaseConnection._init();

  // Variables
  static Database? _database;

  /// Get Database Connection
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('database');
    return _database!;
  }

  /// Initialize Database Connection
  Future<Database> _initDB(String dbName) async {
    final dbPath = await getApplicationDocumentsDirectory();
    final path = join(dbPath.toString(), dbName);

    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  /// If the database is not initialized, initialize it
  Future _createDatabase(Database database, int version) async {
    await database.execute('CREATE TABLE game ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name TEXT NOT NULL,'
        'dateStarted TEXT NOT NULL,'
        'lastDatePlayed TEXT,'
        'players TEXT'
        'nonPlayerCharacters TEXT'
        'enemies TEXT'
        'fightRunning BOOLEAN'
        ')');
  }

  /// Saves a game to the database
  saveGame(Game game) async {
    Map<String, dynamic> row = {
      'id': game.id,
      'name' : game.name,
      'dateStarted' : game.dateStarted.toIso8601String(),
      'lastDatePlayed' : game.lastDatePlayed?.toIso8601String(),
      'players' : jsonEncode(game.players),
      'nonPlayerCharacters' : jsonEncode(game.nonPlayerCharacters),
      'enemies' : jsonEncode(game.enemies),
      'fightRunning' : game.fightRunning,
    };

    await _database?.insert('game', row);
  }

  /// Close Database
  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
