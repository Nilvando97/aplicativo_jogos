import 'package:aplicativo_jogos/models/jogo_da_forca_model.dart';
import 'package:aplicativo_jogos/views/tela_inicial.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/jogo_da_velha_model.dart';
import 'views/jogo_da_forca_interface.dart';
import 'views/jogo_da_velha_interface.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JogoDaVelhaModel()),
        ChangeNotifierProvider(create: (context) => JogoDaForca()),
      ],
      child: MeuAplicativo(),
    ),
  );
}

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Velha',
      initialRoute: '/',
      routes: {
        '/': (context) => TelaInicial(),
        '/jogoDaVelha': (context) => TelaJogoDaVelha(),
        '/jogoDaForca': (context) => TelaJogoDaForca(),
      },
    );
  }
}
