import 'package:flutter/material.dart';

import 'package:dungeons_oracle/Model/Entity.dart';
import '../Utils/customWidgets.dart' as custom_widgets;
import '../Utils/colors.dart' as colors;
import '../Model/database.dart' as database;
import '../Model/Game.dart';

List<Entity> _players = [Entity.blank()];

class NewGame extends StatefulWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  @override
  Widget build(BuildContext context) {
    TextEditingController gameName = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Game'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Spacing
              const SizedBox(
                height: 5.0,
              ),

              /// Enter Game Name
              Expanded(
                flex: 1,
                child: custom_widgets.DOContainer(
                  child: TextFormField(
                    controller: gameName,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: 'Game Name',
                    ),
                  ),
                ),
              ),

              /// Spacing
              const SizedBox(
                height: 10.0,
              ),

              /// Player List
              Expanded(
                flex: 8,
                child: custom_widgets.DOContainer(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(4.0),
                      itemCount: _players.length,
                      itemBuilder: (context, index) =>
                          _players[index].addEntity()),
                ),
              ),

              /// Add new Player
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _players.add(Entity.blank());
                    });
                  },
                  icon: Icon(
                    Icons.add,
                    color: colors.accentColor,
                  ),
                ),
              ),

              /// Continue Button
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    database.DatabaseConnection.saveGame(
                      Game(
                          name: gameName.text,
                          dateStarted: DateTime.now(),
                          players: _players),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Continue"),
                ),
              ),

              /// Spacing
              const SizedBox(
                height: 20,
              ),
            ]),
      ),
    );
  }
}

/// Inserts a Game object into the database
Future<void> insertGame(Game game) async {}
