import 'package:flutter/material.dart';

import '../Utils/textStyling.dart';

/// Add Entity to Game
Column addEntity(BuildContext context) {
  return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Image and Character Information
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Image
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'lib/Resources/default_splash.jpg',
                  height: 100,
                ),
              ),
            ),

            /// Character Information
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 155,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Row 1: Character Name and Level
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// Character Name
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  child: TextField(
                                    decoration: textFieldDecoration.copyWith(
                                      hintText: 'Character Name',
                                    ),
                                    maxLength: 20,
                                  ),
                                ),
                              ),
                            ),

                            // Level
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  child: TextField(
                                    decoration: textFieldDecoration.copyWith(
                                      hintText: 'Level',
                                    ),
                                    keyboardType: TextInputType.number,
                                    maxLength: 3,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      /// Row 2: Character Type and HP
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            /// Character Type
                            Expanded(
                              flex: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: TextField(
                                  decoration: textFieldDecoration.copyWith(
                                    hintText: 'Character Type',
                                  ),
                                  maxLength: 20,
                                ),
                              ),
                            ),

                            /// HP
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: TextField(
                                  decoration: textFieldDecoration.copyWith(
                                    hintText: 'Max HP',
                                  ),
                                  keyboardType: TextInputType.number,
                                  maxLength: 3,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      /// Row 3: Attributes
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            attribute(),
                            attribute(),
                            attribute(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]);
}

Container attribute() {
  return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Colors.black26,
        border: Border.all(
          color: Colors.black54,
          width: 3,
        ),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Attribute Name

          Expanded(
            child: TextField(
              decoration: textFieldDecoration.copyWith(
                hintText: 'Attr',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              maxLength: 4,
              textAlign: TextAlign.center,
            ),
          ),

          /// Attribute Value
          Expanded(
            child: TextField(
              decoration: textFieldDecoration.copyWith(
                hintText: '00',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none
              ),
              maxLength: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ));
}
