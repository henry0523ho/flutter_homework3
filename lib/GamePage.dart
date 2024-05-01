import 'package:flutter/material.dart';
import 'package:homework3/FinishPage.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('GamePage'),
      ),
      body: Center(
        child: ElevatedButton(
          child:const Text('Go to FinishPage'),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const FinishPage(winner: "Player1")),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
    );
  }
}