import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Padding(padding: EdgeInsets.all(80)),
            Center(
              child: CircularButton(
                imagePath: 'assets/images/jogoDaVelha.png',
                onTap: () {
                  Navigator.pushNamed(context, '/jogoDaVelha');
                  print("clicando");
                },
              ),
            ),
            const Text("Jogo da velha"),
            const SizedBox(height: 15),
            CircularButton(
              imagePath: 'assets/images/jogoDaForca.png',
              onTap: () {
                Navigator.pushNamed(context, '/jogoDaForca');
              },
            ),
            const Text("Jogo da Forca"),
            const SizedBox(height: 15),
            CircularButton(
              imagePath: 'assets/images/termo.png',
              onTap: () {
                Navigator.pushNamed(context, '/jogoDoTermo');
              },
            ),
            const Text("Jogo da Termo"),
          ],
        ),
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  CircularButton({required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 40.0,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }
}
