import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Utils/customWidgets.dart' as custom_widgets;

/// List of Existing Games
List<Widget> _games = [];

/// Open Existing Game Route
class OpenExistingGame extends StatelessWidget {
  const OpenExistingGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: ListView.builder(
                      itemCount: _games.length,
                      itemBuilder: (context, index) => _games[index]),
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
