import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/jogo_da_velha_model.dart';


class TelaJogoDaVelha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modelo = Provider.of<JogoDaVelhaModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              modelo.reiniciarJogo();
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: 9,
            itemBuilder: (context, indice) {
              return GestureDetector(
                onTap: () {
                  modelo.fazerJogada(indice);
                },
                child: Container(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      modelo.tabuleiro[indice],
                      style: const TextStyle(fontSize: 40, color: Colors.red),
                    ),
                  ),
                ),
              );
            },
          ),
        const SizedBox(height: 20),
          if (modelo.jogoFinalizado)
            Text(
              modelo.vencedor != null
                  ? 'Jogador ${modelo.vencedor} Venceu!'
                  : 'Empate!',
              style: TextStyle(fontSize: 30),
            ),
        ],
      ),
    );
  }
}
