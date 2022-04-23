import 'package:flutter/material.dart';

/// Add Entity to Game
Column addEntity(BuildContext context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Image and Character Information
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Image
            Image.asset(
              'lib/Resources/default_splash.jpg',
              scale: .001,
            ),

            /// Character Information
            Container(
              child: Column(),
            ),
          ],
        ),

        /// Notes
        Row(
          children: [
            FractionallySizedBox(
              widthFactor: .9,
              child: Container(
                child: const TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Notes',
                )),
              ),
            )
          ],
        )
      ]);
}
