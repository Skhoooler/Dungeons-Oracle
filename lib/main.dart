import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Root of Application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Root of application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dungeon\'s Oracle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Dungeon\'s Oracle'),
    );
  }
}

/// Homepage
class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Space (in pixels) above Title
        const SizedBox(
          height: 35,
        ),

        /// Title of Homepage
        const Text(
          'Dungeon\'s Oracle',
          textAlign: TextAlign.center,
          style: TextStyle(
          ),
        ),

        /// Create New Game
        ElevatedButton(
            onPressed: () {},
            child:
              const Text('Create New Game'),

        ),
        /// Open Existing Game
        ElevatedButton(
            onPressed: () {},
            child:
              const Text ('Open Existing Game'),
        ),
      ],
    );
  }
}
