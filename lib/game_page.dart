import 'package:flutter/material.dart';
import 'package:homework3/finish_page.dart';
import 'package:homework3/home_page.dart';
import 'package:homework3/game_score.dart';
import 'package:dice_icons/dice_icons.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool finished = false;
  int round = 1;
  int turn = 1;
  int roll = 3;
  GameScore player1Score = GameScore("Player1");
  GameScore player2Score = GameScore("Player2");
  List<int> dice = [1, 2, 3, 4, 5];
  int diceLock = 0x11111;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GamePage'),
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.blue,
                child: Row(
                  children: [
                    Text("${player1Score.name} ",
                        style: const TextStyle(fontSize: 20)),
                    // const Spacer(),
                    Text(player1Score.getFullScore()['total'].toString(),
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              const Text("  vs  ", style: TextStyle(fontSize: 20)),
              Container(
                color: Colors.blue,
                child: Row(
                  children: [
                    Text(player2Score.getFullScore()['total'].toString(),
                        style: const TextStyle(fontSize: 20)),
                    // const Spacer(),
                    Text(" ${player2Score.name}",
                        style: const TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              // const Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     Text("Minor", style: TextStyle(fontSize: 20)),
              //     Text("Major", style: TextStyle(fontSize: 20)),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(DiceIcons.dice1, size: 50)),
                  Text(formatNumber(player1Score.getScore('ace')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('ace')),
                      style: const TextStyle(fontSize: 20)),
                  const Text("3x", style: TextStyle(fontSize: 25)),
                  Text(formatNumber(player1Score.getScore('threeOfAKind')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('threeOfAKind')),
                      style: const TextStyle(fontSize: 20))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(DiceIcons.dice2, size: 50)),
                  Text(formatNumber(player1Score.getScore('twos')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('twos')),
                      style: const TextStyle(fontSize: 20)),
                  const Text("5x", style: TextStyle(fontSize: 25)),
                  Text(formatNumber(player1Score.getScore('fourOfAKind')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('fourOfAKind')),
                      style: const TextStyle(fontSize: 20))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(DiceIcons.dice3, size: 50)),
                  Text(formatNumber(player1Score.getScore('threes')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('threes')),
                      style: const TextStyle(fontSize: 20)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.home, size: 50)),
                  Text(formatNumber(player1Score.getScore('fullHouse')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('fullHouse')),
                      style: const TextStyle(fontSize: 20))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(DiceIcons.dice4, size: 50)),
                  Text(formatNumber(player1Score.getScore('fours')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('fours')),
                      style: const TextStyle(fontSize: 20)),
                  const Text("小順", style: TextStyle(fontSize: 25)),
                  Text(formatNumber(player1Score.getScore('smallStraight')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('smallStraight')),
                      style: const TextStyle(fontSize: 20))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(DiceIcons.dice5, size: 50)),
                  Text(formatNumber(player1Score.getScore('fives')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('fives')),
                      style: const TextStyle(fontSize: 20)),
                  const Text("大順", style: TextStyle(fontSize: 25)),
                  Text(formatNumber(player1Score.getScore('largeStraight')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('largeStraight')),
                      style: const TextStyle(fontSize: 20))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(DiceIcons.dice6, size: 50)),
                  Text(formatNumber(player1Score.getScore('sixs')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('sixs')),
                      style: const TextStyle(fontSize: 20)),
                  const Text("Yatzy", style: TextStyle(fontSize: 25)),
                  Text(formatNumber(player1Score.getScore('yahtzee')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('yahtzee')),
                      style: const TextStyle(fontSize: 20))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("bonus", style: TextStyle(fontSize: 25)),
                  Text(formatNumber(player1Score.getFullScore()['bonus']),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player1Score.getFullScore()['bonus']),
                      style: const TextStyle(fontSize: 20)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.question_mark_rounded, size: 30)),
                  Text(formatNumber(player1Score.getScore('chance')),
                      style: const TextStyle(fontSize: 20)),
                  Text(formatNumber(player2Score.getScore('chance')),
                      style: const TextStyle(fontSize: 20))
                ],
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            IconButton(
              onPressed: () {
                toggleDiceLock(0);
              },
              icon: const Icon(DiceIcons.dice4, size: 50),
            ),
            IconButton(
                onPressed: () {
                  toggleDiceLock(1);
                },
                icon: const Icon(DiceIcons.dice4, size: 50)),
            IconButton(
                onPressed: () {
                  toggleDiceLock(2);
                },
                icon: const Icon(DiceIcons.dice4, size: 50)),
            IconButton(
                onPressed: () {
                  toggleDiceLock(3);
                },
                icon: const Icon(DiceIcons.dice4, size: 50)),
            IconButton(
                onPressed: () {
                  toggleDiceLock(4);
                },
                icon: const Icon(DiceIcons.dice4, size: 50)),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (roll == 0) {
                        roll = 3;
                        if (turn == 1) {
                          turn = 2;
                        } else {
                          turn = 1;
                          round += 1;
                        }
                      } else {
                        roll -= 1;
                      }
                    });
                  },
                  child: Text("Roll $roll")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Play")),
            ],
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to FinishPage'),
              onPressed: () {
                finish();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDiceRow() {
    Widget ret =
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          for(int i=0;i<5;++i){
            IconButton();
          }
      IconButton(
        onPressed: () {
          toggleDiceLock(0);
        },
        icon: const Icon(DiceIcons.dice4, size: 50),
      ),
      IconButton(
          onPressed: () {
            toggleDiceLock(1);
          },
          icon: const Icon(DiceIcons.dice4, size: 50)),
      IconButton(
          onPressed: () {
            toggleDiceLock(2);
          },
          icon: const Icon(DiceIcons.dice4, size: 50)),
      IconButton(
          onPressed: () {
            toggleDiceLock(3);
          },
          icon: const Icon(DiceIcons.dice4, size: 50)),
      IconButton(
          onPressed: () {
            toggleDiceLock(4);
          },
          icon: const Icon(DiceIcons.dice4, size: 50)),
    ]);
    return ret;
  }

  void rollDice() {
    for (int i = 0; i < 5; i++) {
      if (diceLocked(i) == false) {
        dice[i] =
            (1 + (6 * (DateTime.now().microsecondsSinceEpoch % 1000) ~/ 1000));
      }
    }
  }

  String formatNumber(int? number) {
    if (number == null) {
      return "  ";
    }
    // if(number==0){
    //   return "  ";
    // }
    String ret = number.toString();
    while (ret.length < 2) {
      ret = " $ret";
    }
    return ret;
  }

  void toggleDiceLock(int i) {
    setDiceLock(i, !diceLocked(i));
  }

  void setDiceLock(int i, bool b) {
    if (b) {
      if (diceLocked(i) == false) {
        diceLock -= (2 ^ i);
      }
    } else {
      if (diceLocked(i)) {
        diceLock += (2 ^ i);
      }
    }
  }

  bool diceLocked(int i) {
    return (2 ^ i) & diceLock != 0;
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
        MaterialPageRoute(
            builder: (context) => const FinishPage(content: "平手")),
        (Route<dynamic> route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => const FinishPage(content: "Player2獲勝")),
        (Route<dynamic> route) => false,
      );
    }
  }
}
