import 'package:flutter/material.dart';
import 'package:homework3/finish_page.dart';
import 'package:homework3/game_score.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool finished = false;
  int round = 1;
  int turn = 1;
  GameScore player1Score = GameScore("Player1");
  GameScore player2Score = GameScore("Player2");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GamePage'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go to FinishPage'),
          onPressed: () {
            finish();
          },
        ),
      ),
    );
  }

  void finish() {
    if (player1Score.getFullScore()['total']! >
        player2Score.getFullScore()['total']!) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const FinishPage(content: "Player1獲勝")),
        (Route<dynamic> route) => false,
      );
    } else if (player2Score.getFullScore()['total']! ==
        player1Score.getFullScore()['total']!) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const FinishPage(content: "平手")),
        (Route<dynamic> route) => false,
      );
    }else{
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const FinishPage(content: "Player2獲勝")),
        (Route<dynamic> route) => false,
      );
    }
  }
}
