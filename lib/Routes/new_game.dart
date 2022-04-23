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
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.blueAccent
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
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
            height: 20,
          ),

          /// Enter Players
          Container(
            width: MediaQuery.of(context).size.width * .93,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueAccent
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: addEntity(context),
          ),
        ]),
  );
}
