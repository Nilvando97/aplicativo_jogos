import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/jogo_da_velha_model.dart';
import 'views/jogo_da_velha_interface.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => JogoDaVelhaModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Velha',
      home: TelaJogoDaVelha(),
    );
  }
}
