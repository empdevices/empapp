import 'package:flutter/material.dart';

class ColorProvider extends ChangeNotifier {
  // Initial color
  Color _primaryColor = Colors.blue;

  // Getter for the color
  Color get primaryColor => _primaryColor;

  // Setter for the color
  set primaryColor(Color color) {
    _primaryColor = color;
    notifyListeners();
  }

  // Method to change the color
  void changeColor(Color color) {
    primaryColor = color;
  }
}
