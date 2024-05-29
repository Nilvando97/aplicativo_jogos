import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/jogo_do_termo_models.dart';

class TelaDoJogoDoTermo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jogo = Provider.of<JogoDoTermoModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo do Termo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: jogo.tentativas.length,
              itemBuilder: (context, index) {
                final tentativa = jogo.tentativas[index];
                final resultado = jogo.verificarTentativa(tentativa);
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(tentativa.length, (i) {
                      return Container(
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: resultado[i] == 2
                              ? Colors.green
                              : resultado[i] == 1
                                  ? Colors.yellow
                                  : Colors.grey,
                        ),
                        child: Text(
                          tentativa[i],
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              ...'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((letra) {
                return IconButton(
                  onPressed: () {
                    jogo.adicionarLetra(letra);
                  },
                  icon: Text(letra),
                );
              }).toList(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: jogo.tentativaAtual.isNotEmpty
                    ? () {
                        jogo.submeterTentativa();
                      }
                    : null,
                child: Text('Confirmar'),
              ),
              IconButton(
                onPressed: jogo.tentativaAtual.isNotEmpty
                    ? () {
                        jogo.removerLetra();
                      }
                    : null,
                icon: Icon(Icons.backspace),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              jogo.tentativaAtual,
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
    );
  }
}
