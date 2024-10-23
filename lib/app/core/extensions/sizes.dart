import 'package:flutter/material.dart';

class Sizes {
  // Construtor privado
  Sizes._();

  double _width = 0;
  double _height = 0;

// Valor inicial baseado no protótipo
  static const Size _designSize = Size(414.0, 896.0);

  static final Sizes _instance = Sizes._();

// construtor singleton
  factory Sizes() => _instance;

  double get width => _width;
  double get height => _height;

// método de configuração inicial
  static void init(
    BuildContext context, {
    Size designSize = _designSize,
  }) {
// verifica se existe dados de MediaQuery
    final deviceData = MediaQuery.maybeOf(context);

// caso não exista, recebe o valor inicial do protótipo
    final deviceSize = deviceData?.size ?? _designSize;

// atualizar os getters
    _instance._height = deviceSize.height;
    _instance._width = deviceSize.width;
  }
}

extension SizesExt on num {
  // calcular o valor proporcional baseado na largura do dispositivo
  // em relação ao protótipo
  double get w {
    return (this * Sizes._instance.width) / Sizes._designSize.width;
  }

  // calcular o valor proporcional baseado na altura do dispositivo
  // em relação ao protótipo
  double get h {
    return (this * Sizes._instance.height) / Sizes._designSize.height;
  }
}
