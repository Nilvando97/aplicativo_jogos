import 'package:flutter/material.dart';

class JogoDaForca with ChangeNotifier {
  String _palavra = 'LINCE';
  List<String> _letrasAdivinhadas = [];
  int _tentativasRestantes = 6;

  String get palavra => _palavra;
  List<String> get letrasAdivinhadas => _letrasAdivinhadas;
  int get tentativasRestantes => _tentativasRestantes;

  void adivinharLetra(String letra) {
    if (_palavra.contains(letra) && !_letrasAdivinhadas.contains(letra)) {
      _letrasAdivinhadas.add(letra);
    } else {
      _tentativasRestantes--;
    }
    notifyListeners();
  }

  bool jogoVencido() {
    for (var letra in _palavra.split('')) {
      if (!_letrasAdivinhadas.contains(letra)) {
        return false;
      }
    }
    return true;
  }

  bool jogoPerdido() {
    return _tentativasRestantes <= 0;
  }

  void reiniciarJogo() {
    _palavra = 'FLUTTER';
    _letrasAdivinhadas = [];
    _tentativasRestantes = 6;
    notifyListeners();
  }
}
