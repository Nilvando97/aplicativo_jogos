import 'package:flutter/material.dart';

class JogoDaVelhaModel extends ChangeNotifier {
  List<String> _tabuleiro = List.filled(9, '');
  String _jogadorAtual = 'X';
  String? _vencedor;
  bool _jogoFinalizado = false;

  List<String> get tabuleiro => _tabuleiro;
  String get jogadorAtual => _jogadorAtual;
  String? get vencedor => _vencedor;
  bool get jogoFinalizado => _jogoFinalizado;

  void fazerJogada(int indice) {
    if (_tabuleiro[indice] == '' && !_jogoFinalizado) {
      _tabuleiro[indice] = _jogadorAtual;
      if (_verificarVencedor()) {
        _vencedor = _jogadorAtual;
        _jogoFinalizado = true;
      } else if (!_tabuleiro.contains('')) {
        _jogoFinalizado = true;
      } else {
        _jogadorAtual = _jogadorAtual == 'X' ? 'O' : 'X';
      }
      notifyListeners();
    }
  }

  void reiniciarJogo() {
    _tabuleiro = List.filled(9, '');
    _jogadorAtual = 'X';
    _vencedor = null;
    _jogoFinalizado = false;
    notifyListeners();
  }

  bool _verificarVencedor() {
    const List<List<int>> padroesDeVitoria = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var padrao in padroesDeVitoria) {
      if (_tabuleiro[padrao[0]] == _jogadorAtual &&
          _tabuleiro[padrao[1]] == _jogadorAtual &&
          _tabuleiro[padrao[2]] == _jogadorAtual) {
        return true;
      }
    }
    return false;
  }
}
