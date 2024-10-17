import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VerifyResultScreen extends StatelessWidget {
  final double score;

  const VerifyResultScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSad = score < 50;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Résultat de Vérification"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSad
                ? Lottie.network('https://lottie.host/c7db0e24-6fc8-4d0c-9abe-4dbe3844f385/uNRdvhQsi1.json') // Animation triste
                : Lottie.network('https://lottie.host/1dd9c98a-6f0a-41e5-8fc4-c8aa8b0e4cdd/1eC55qWtqT.json'), // Animation heureuse
            SizedBox(height: 20),
            Text(
              isSad
                  ? "Désolé, votre score est de ${score.toStringAsFixed(2)} %"
                  : "Félicitations! Votre score est de ${score.toStringAsFixed(2)} %",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Retourner à la route racine "/"
                Navigator.popAndPushNamed(context, '/');
              },
              child: Text("Retour à l'accueil"),
            ),
          ],
        ),
      ),
    );
  }
}
