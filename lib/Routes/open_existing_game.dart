import 'package:flutter/material.dart';
import 'dart:async';

import '../Utils/customWidgets.dart' as custom_widgets;
import 'package:dungeons_oracle/Model/database.dart' as db;
import 'package:dungeons_oracle/Model/Game.dart';

/// Open Existing Game Route
class OpenExistingGame extends StatefulWidget {
  const OpenExistingGame({Key? key}) : super(key: key);

  @override
  State<OpenExistingGame> createState() => _OpenExistingGameState();
}

class _OpenExistingGameState extends State<OpenExistingGame> {
  @override
  Widget build(BuildContext context) {
    List<Game> game;
    // ToDo: Get the result of the db query out of future
    db.DatabaseConnection.loadGames().then((value) {
      game = value;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Open Existing Game'),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            /// Spacing
            const SizedBox(
              height: 5.0,
            ),

            /// Existing Games
            Expanded(
              child: custom_widgets.DOContainer(
                child: FutureBuilder(
                  future: db.DatabaseConnection.loadGames(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    /// Data
                    List<Widget> children;

                    /// If the database returned data
                    if (snapshot.hasData) {
                      if (snapshot.data != null) {
                        children = [
                          ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return snapshot.data[index].displayGame();
                            },
                          )
                        ];
                      }
                      else {
                        children = [];
                      }
                    }

                    /// If the database returns an error
                    else if (snapshot.hasError) {
                      children = [
                        const Padding(
                          padding: EdgeInsets.only(
                              top: 16, bottom: 16, left: 16, right: 16),
                          child: Text('No Games Found', style: TextStyle(fontSize: 32),),
                        ),
                      ];
                    }

                    /// Progress Indicator
                    else {
                      children = [
                        const SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator(),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                          child: Text('Awaiting result...', style: TextStyle(fontSize: 32)),
                        )
                      ];
                    }

                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      ),
                    );
                  },
                ),
              ),
            ),

            /// Spacing
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
