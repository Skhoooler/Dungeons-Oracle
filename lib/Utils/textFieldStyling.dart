import 'package:flutter/material.dart';

const textFieldDecoration = InputDecoration(
  // Hints
  hintMaxLines: 1,

  // Size
  isCollapsed: true,
  isDense: true,
  contentPadding: EdgeInsets.zero,

  helperStyle: TextStyle(color: Colors.black26),

  // Label
  floatingLabelBehavior: FloatingLabelBehavior.auto,

  // Border
  border: UnderlineInputBorder(),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Colors.deepPurple),
  ),

  // Other
  counterText: "",
);
