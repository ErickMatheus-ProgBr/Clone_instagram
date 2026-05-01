import 'package:flutter/material.dart';

class ScreenSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double devicePixelRatio;

  // Método para inicializar os valores (deve ser chamado no início da build)
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;
  }

  // Atalhos para proporções comuns no Layout
  static double get buttonWidth => screenWidth * 0.9;
  static double get inputWidth => screenWidth * 0.9;
  static double get logoSize => screenHeight * 0.9;
}
