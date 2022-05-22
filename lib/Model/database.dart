import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';

import 'package:dungeons_oracle/Model/Game.dart';
import 'package:dungeons_oracle/Model/Entity.dart';

/// SQLite Database
class DatabaseConnection {

  // Variables
  static Database? _database;

  //DatabaseConnection._initDB();

  /// Get Database Connection
  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB('database6');
    return _database;
  }

  /// Initialize Database Connection
  Future<Database> _initDB(String dbName) async {
    final dbPath = await getApplicationDocumentsDirectory();
    final path = join(dbPath.toString(), dbName);

    var dbInstance =
        await openDatabase(path, version: 1, onCreate: _createDatabase);

    return dbInstance;
  }

  /// If the database is not initialized, initialize it
  Future _createDatabase(Database database, int version) async {
    return await database.execute('''CREATE TABLE game (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        dateStarted TEXT NOT NULL,
        lastDatePlayed TEXT,
        players TEXT,
        nonPlayerCharacters TEXT,
        enemies TEXT,
        fightRunning BOOLEAN
        )''');
  }

  /// Saves a game to the database
  static saveGame(Game game) async {
    /// Json encode the players, non-player characters and enemy lists
    // Players
    var players = game.players.map((e) => {e.toJson()}).toList();

    // NPCs
    var npcs = game.nonPlayerCharacters?.map((e) => {e.toJson()}).toList();

    // Enemies
    var enemies = game.enemies?.map((e) => {e.toJson()}).toList();

    _database?.transaction((txn) async {
      return await txn.rawInsert('''INSERT INTO game (
          id, 
          name, 
          dateStarted,
          lastDatePlayed,
          players,
          nonPlayerCharacters,
          enemies,
          fightRunning) 
          VALUES (?, ?, ?, ?, ?, ?, ?, ?)''', [
        game.id.toString(),
        game.name,
        game.dateStarted.toIso8601String(),
        game.lastDatePlayed?.toIso8601String(),
        players.toString(),
        npcs.toString(),
        enemies.toString(),
        game.fightRunning.toString()
      ]);
    });
  }

  /// Load all game data from the database
  static Future<List<Game>> loadGames() async {
    List<Game> gameData = [];

    try {
      List<Map<String, dynamic>>? rawData =
          await _database?.rawQuery('SELECT * FROM game');

      // If rawData is null, set it to empty list
      rawData ??= [];

      // Parse rawData into a list of Game objects
      for (int i = 0; i < rawData.length; i++) {
        gameData.add(Game.existing(
            id: rawData[i]["id"],
            name: rawData[i]["name"],
            dateStarted: DateTime.parse(rawData[i]["dateStarted"]),
            lastDatePlayed: DateTime.parse(rawData[i]["lastDatePlayed"]),

            // JsonDecode returns a list, map each list item to an Entity object
            // using the Entity.fromJSON constructor, and return a list of them

            //players: rawData[i]["players"].map((player) => {
            //  Entity.fromJSON(player)
            //}),
            players: [],
            nonPlayerCharacters: [],
            enemies: [],
            /*players: jsonDecode(rawData[i]["players"])
                .map((playerData) => {Entity.fromJSON(playerData)})
                .toList(),
            nonPlayerCharacters: jsonDecode(rawData[i]["nonPlayerCharacters"])
                .map((npcData) => {Entity.fromJSON(npcData)})
                .toList(),
            enemies: jsonDecode(rawData[i]["enemies"])
                .map((npcData) => {Entity.fromJSON(npcData)})
                .toList(),*/

            // If it says "true" then return true, else return false
            fightRunning: rawData[i]["fightRunning"] == "true" ? true : false));
      }

    } on Exception catch (e) {
      print(e);
    }
    return gameData;
  }

  /// Close Database
  Future close() async {
    //final db = await instance.database;

    //db.close();
  }
}
