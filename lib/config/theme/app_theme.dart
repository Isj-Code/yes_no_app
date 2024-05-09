import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);
const List<Color> _colorsTheme = [
  _customColor,
  Colors.yellow,
  Colors.red,
  Colors.teal,
  Colors.blue,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorsTheme.length,
            'Colors must be between 0 and ${_colorsTheme.length}');

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorsTheme[selectedColor],
    );
  }
}
