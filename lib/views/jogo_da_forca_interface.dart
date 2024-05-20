import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/jogo_da_forca_model.dart';

class TelaJogoDaForca extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var jogo = Provider.of<JogoDaForca>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Jogo da Forca'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              jogo.reiniciarJogo();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tentativas restantes: ${jogo.tentativasRestantes}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          construirPalavra(jogo),
          SizedBox(height: 20),
          construirTeclado(jogo, context),
          if (jogo.jogoVencido())
            Text(
              'Você Venceu!',
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
          if (jogo.jogoPerdido())
            Text(
              'Você Perdeu!',
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
        ],
      ),
    );
  }

  Widget construirPalavra(JogoDaForca jogo) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: jogo.palavra.split('').map((letra) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            jogo.letrasAdivinhadas.contains(letra) ? letra : '_',
            style: TextStyle(fontSize: 32),
          ),
        );
      }).toList(),
    );
  }

  Widget construirTeclado(JogoDaForca jogo, BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('').map((letra) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed:
                jogo.letrasAdivinhadas.contains(letra) || jogo.jogoPerdido()
                    ? null
                    : () {
                        jogo.adivinharLetra(letra);
                      },
            child: Text(letra),
          ),
        );
      }).toList(),
    );
  }
}
