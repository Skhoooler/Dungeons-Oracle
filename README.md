# Overview

Dungeon's Oracle is an app for Dungeon/Game masters to keep track of the initiative order of players in tabletop games that I have been working on for around five weeks now.

Previously, I created this app to learn how to create an app using Dart and the Flutter framework. Now, I used this same app to learn how to use a SQLite database by adding a
database to the existing app. I created a database class that initializes a database, and has a few static methods to save and load information from the database. The existing app
had forms for the user to input information about players. The SQL database is called when the user submits a form, and that information is saved to the database. Later, when the user
wants to get information about different games, the database is queried and the resulting data is parsed and returned to the user.

[Dungeon's Oracle Dev Update 1 (Flutter)](https://youtu.be/d6MOE9t1lT8)
[Dungeon's Oracle Dev Update 2 (SQL)](https://youtu.be/Hw4pzxDYGns)

# Relational Database

In this app, I used a SQLite database in flutter. I created this database using the sqflite library.

I created a single table (game), which has eight columns:

* id (primary key)
* name
* dateStarted
* lastDatePlayed
* players (array)
* nonPlayerCharacters (array)
* enemies (array)
* fightRunning

# Development Environment

I developed this app in Android Studio using Dart and the Flutter framework. I used the sqflite
library for access to the SQLite database, path_provider to set the path of the database, and 
the uuid package to set the id of each game.

# Useful Websites

* [Sqflite-Flutter Example from Scratch](https://medium.com/py-bits/sqflite-flutter-example-from-scratch-71afa2ce2ea9)
* [The ultimate guide to parse JSON](https://codewithandrea.com/articles/parse-json-dart/)

# Future Work

* Fix Loading data from the database so it displays
* Parse the string of player data to a List of player objects
* Add delete and update support