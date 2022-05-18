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

  // Variables
  static late Database _database;

  DatabaseConnection._init();

  /// Get Database Connection
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('database');
    return _database;
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
  static saveGame(Game game) async {
    _database.transaction(((txn) async {
      Batch batch = txn.batch();
      batch.insert('game', {
        'id': game.id,
        'name': game.name,
        'dateStarted': game.dateStarted.toIso8601String(),
        'lastDatePlayed': game.lastDatePlayed?.toIso8601String(),
        'players': jsonEncode(game.players),
        'nonPlayerCharacters': jsonEncode(game.nonPlayerCharacters),
        'enemies': jsonEncode(game.enemies),
        'fightRunning': game.fightRunning
      });
      await batch.commit(noResult: true);
    }));
  }

  /// Load all game data from the database
  static Future<List<Game>> loadGames() async {
    final List<Map<String, dynamic>> gameData = await _database.query('game');
    return List.generate(gameData.length, (i) {
      return Game.existing(
        id: gameData[i]['id'],
        name: gameData[i]['name'],
        dateStarted: gameData[i]['dateStarted'], // toIso8601String DATETIME method to get string for db
        lastDatePlayed: gameData[i]['lastDatePlayed'],
        players: json.decode(gameData[i]['players']),
        nonPlayerCharacters: json.decode(gameData[i]['nonPlayerCharacters']),
        enemies: json.decode(gameData[i]['enemies']),
        fightRunning: gameData[i]['fightRunning'],
      );
    });
  }

  /// Close Database
  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
