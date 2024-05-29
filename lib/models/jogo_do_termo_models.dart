import 'package:flutter/material.dart';

class JogoDoTermoModel extends ChangeNotifier {
  final String palavraSecreta;
  List<String> tentativas = [];
  String tentativaAtual = '';

  JogoDoTermoModel({this.palavraSecreta = 'TREINAMENTO'});

  void adicionarLetra(String letra) {
    if (tentativaAtual.length < palavraSecreta.length) {
      tentativaAtual += letra;
      notifyListeners();
    }
  }

  void removerLetra() {
    if (tentativaAtual.isNotEmpty) {
      tentativaAtual = tentativaAtual.substring(0, tentativaAtual.length - 1);
      notifyListeners();
    }
  }

  void submeterTentativa() {
    if (tentativaAtual.length == palavraSecreta.length) {
      tentativas.add(tentativaAtual);
      tentativaAtual = '';
      notifyListeners();
    }
  }

  List<int> verificarTentativa(String tentativa) {
    List<int> resultado = List.filled(palavraSecreta.length, 0);
    for (int i = 0; i < tentativa.length; i++) {
      if (tentativa[i] == palavraSecreta[i]) {
        resultado[i] = 2; // Letra correta na posição correta
      } else if (palavraSecreta.contains(tentativa[i])) {
        resultado[i] = 1; // Letra correta na posição errada
      }
    }
    return resultado;
  }
}
