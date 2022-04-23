import 'package:dungeons_oracle/Controllers/addEntity.dart';
import 'package:flutter/material.dart';

Material newGameRoute(BuildContext context) {
  return Material(
    child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Space (in pixels) above Title
          const SizedBox(
            height: 50,
          ),

          /// Enter Game Name Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Game Name Text Entry
              Container(
                width: MediaQuery.of(context).size.width * .78,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Game Name',
                  ),
                ),
              ),

              /// Spacing
              const SizedBox(
                width: 5.0,
              ),

              /// Edit Icon
              const Icon(
                Icons.edit,
                color: Colors.blue,
                size: 55.0,
              ),
            ],
          ),

          /// Space (in pixels) above Title
          const SizedBox(
            height: 50,
          ),

          /// Enter Players
          Container(
            width: MediaQuery.of(context).size.width * .2,
            child: addEntity(context),
          ),
        ]),
  );
}
