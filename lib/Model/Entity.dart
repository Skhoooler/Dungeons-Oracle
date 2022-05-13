import 'package:flutter/material.dart';

import '../Utils/textFieldStyling.dart';
import '../Utils/customWidgets.dart' as custom_widgets;
import '../Utils/colors.dart' as colors;

/// Entity Class stores all of the information about entitites (players, npc, enemies)
class Entity{
  //final int _id;
  String name;
  String type;
  String level;
  String health;
  Map<String, String>? attribute1;
  Map<String, String>? attribute2;
  Map<String, String>? attribute3;
  bool _isAlive;
  entity_type? entityType;

  // Image

  // Default Constructor
  Entity({
    required this.name,
    required this.type,
    required this.level,
    required this.health,
    this.attribute1,
    this.attribute2,
    this.attribute3,
    required this.entityType,
  }) : _isAlive = true;

  // Blank Constructor
  Entity.blank({
    this.name = "",
    this.type = "",
    this.level = "",
    this.health = "",
    this.attribute1,
    this.attribute2,
    this.attribute3,
    this.entityType,
  }) : _isAlive = true;

  Widget addEntity() {
    var att1Key;
    var att1Val;

    var att2Key;
    var att2Val;

    var att3Key;
    var att3Val;

    return custom_widgets.DOContainer(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      color: colors.primaryColor,
      child: Column(
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
                    child: custom_widgets.DOContainer(
                      height: 155,
                      color: colors.secondaryColor,
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
                                      child: TextFormField(
                                        onChanged: (String value) async {
                                          name = value;
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Character name missing';
                                          }
                                          return null;
                                        },
                                        decoration:
                                            textFieldDecoration.copyWith(
                                          hintText: 'Character Name',
                                        ),
                                        maxLength: 20,
                                      ),
                                    ),
                                  ),
                                ),

                                /// Level
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      child: TextFormField(
                                        onChanged: (String value) async {
                                          level = value;
                                        },
                                        decoration:
                                            textFieldDecoration.copyWith(
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
                                    child: TextFormField(
                                      onChanged: (String value) async {
                                        type = value;
                                      },
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
                                    child: TextFormField(
                                      onChanged: (String value) async {
                                        health = value;
                                      },
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
                                _attribute(att1Key, att1Val, 1),
                                _attribute(att2Key, att2Val, 2),
                                _attribute(att3Key, att3Val, 3),
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
          ]),
    );
  }

  Container _attribute(key, value, num) {
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
            child: TextFormField(
              onChanged: (String value) async {
                key = value;

                if (num == 1) {
                  attribute1 = {key:value};
                }
                else if (num == 2) {
                  attribute2 = {key:value};
                }
                else {
                  attribute3 = {key:value};
                }
              },
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
            child: TextFormField(
              onChanged: (String val) async {
                value = val;

                if (num == 1) {
                  attribute1 = {key:value};
                }
                else if (num == 2) {
                  attribute2 = {key:value};
                }
                else {
                  attribute3 = {key:value};
                }
              },
              decoration: textFieldDecoration.copyWith(
                  hintText: '00',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
              maxLength: 2,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}

enum entity_type {
  player,
  npc,
  enemy,
}
