import 'package:dungeons_oracle/Controllers/addEntity.dart';
import 'package:flutter/material.dart';

import '../Utils/customWidgets.dart' as custom_widgets;
import '../Utils/colors.dart' as colors;

List<Widget> _players = [addEntity()];

class NewGame extends StatefulWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  @override
  Widget build(BuildContext context) {
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
              const Expanded(
                flex: 1,
                child: custom_widgets.DOContainer(
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
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
                        itemBuilder: (context, index) => _players[index]),
                  )),

              /// Add new Player
              Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _players.add(const SizedBox(
                        height: 10,
                      ));
                      _players.add(
                        addEntity(),
                      );
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
                    onPressed: () {},
                    child: const Text('Continue'),
                  )),

              /// Spacing
              const SizedBox(
                height: 20,
              ),
            ]),
      ),
    );
  }
}
