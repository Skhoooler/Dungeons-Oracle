import 'package:dungeons_oracle/Controllers/addEntity.dart';
import 'package:flutter/material.dart';

List<Widget> _players = [addEntity()];

class NewGame extends StatefulWidget {
  const NewGame({Key? key}) : super(key: key);

  @override
  _NewGameState createState() => _NewGameState();
}

class _NewGameState extends State<NewGame> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Title
            SizedBox(
              width: MediaQuery.of(context).size.width * .93,
              height: 50,
              child: const Text(
                'Create New Game',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            /// Enter Game Name
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * .93,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Game Name',
                  ),
                ),
              ),
            ),

            /// Player List
            Expanded(
                flex: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width * .93,
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(12),
                  ),
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
                    _players.add(
                      addEntity(),
                    );
                  });
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ),

            /// Continue Button
            Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Continue'),
                ))
          ]),
    );
  }
}
