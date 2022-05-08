import 'package:flutter/material.dart';

import 'package:dungeons_oracle/Routes/new_game.dart';
import 'package:dungeons_oracle/Routes/open_existing_game.dart';
import 'Utils/themes.dart' as themes;

void main() {
  // Run App
  runApp(const MaterialApp(home: DungeonsOracle()));
}

/// Root of Application
class DungeonsOracle extends StatelessWidget {
  const DungeonsOracle({Key? key}) : super(key: key);

  // Root of application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dungeon\'s Oracle',
      theme: themes.DungeonsOracleTheme.lightTheme,
      home: const Home(title: 'Dungeon\'s Oracle'),
    );
  }
}

/// Homepage
class Home extends StatelessWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dungeon\'s Oracle'),
        titleTextStyle: themes.DungeonsOracleTheme.titleTheme,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Title of Homepage
            /*const Text(
              'Dungeon\'s Oracle',
              textAlign: TextAlign.center,
              //style: TextStyle(),
            ),*/

            /// Space (Flex) between elements
            const Spacer(flex: 10),

            /// Create New Game
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewGame()),
                );
              },
              child: const Text('Create New Game'),
            ),

            /// Space (Flex) between elements
            const Spacer(flex: 1),

            /// Open Existing Game
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OpenExistingGame()));
              },
              child: const Text('Open Existing Game'),
            ),

            /// Empty Space
            const Spacer(flex: 100),
          ],
        ),
      ),
    );
  }
}
