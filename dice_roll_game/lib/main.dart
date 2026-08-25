import 'package:flutter/material.dart';
import 'package:roll_dice_2d/roll_dice_2d.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'RollDice2D Demo', home: const DiceDemoPage());
  }
}

class DiceDemoPage extends StatefulWidget {
  const DiceDemoPage({super.key});

  @override
  State<DiceDemoPage> createState() => _DiceDemoPageState();
}

class _DiceDemoPageState extends State<DiceDemoPage> {
  int player1Score = 0;
  int player2Score = 0;

  int player1LastRoll = 0;
  int player2LastRoll = 0;

  int currentPlayer = 1;
  int currentDiceValue = 1;

  bool gameOver = false;

  final int winningScore = 30;

  int _currentDiceValue = 6; // To store the dice value
  Key _diceKey = UniqueKey(); // To re-trigger the roll animation

  void _rollTheDice() {
    if (gameOver) {
      return;
    }
    setState(() {
      _diceKey = UniqueKey();
    });
  }

  void handleDiceRoll(int value) {
    setState(() {
      currentDiceValue = value;

      if (currentPlayer == 1) {
        player1Score += value;
        player1LastRoll = value;

        if (player1Score >= winningScore) {
          gameOver = true;
        } else {
          currentPlayer = 2;
        }
      } else {
        player2Score += value;
        player2LastRoll = value;

        if (player2Score >= winningScore) {
          gameOver = true;
        } else {
          currentPlayer = 1;
        }
      }
    });
  }

  void resetGame() {
    setState(() {
      player1Score = 0;
      player2Score = 0;

      player1LastRoll = 0;
      player2LastRoll = 0;

      currentPlayer = 1;
      currentDiceValue = 1;

      gameOver = false;

      _diceKey = UniqueKey();
    });
  }

  String get gameStatus {
    if (gameOver) {
      if (player1Score >= winningScore) {
        return "Player 1 Wins!";
      } else {
        return "Player 2 Wins!";
      }
    }

    return "Player $currentPlayer's Turn";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),

      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          'Roll Dice 2D Game',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 250, 250, 250),
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            // Player labels
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
                      child: Column(
                        children: [
                          Text(
                            "Player 1",
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$player1Score",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                      child: Column(
                        children: [
                          Text(
                            "Player 2",
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$player2Score",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 100),
            const Text(
              "Player 1's turn",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: Colors.teal,
              ),
            ),

            // Dice animation
            const SizedBox(height: 100.0),
            RollDice2D(
              key: _diceKey, // Assign the key here
              onRoll: (int value) {
                // This callback is triggered after the rolling animation completes (if any).
                // It provides the final value of the dice.
                setState(() {
                  _currentDiceValue = value;
                });
              },
              color: DiceColor.white, // Or DiceColor.white
              rollingTimes: 5,
              // Number of times the dice face changes during animation
              // If 1 or less, shows initial face and calls onRoll immediately.
              speed:
                  150, // Duration in milliseconds for each face change animation
            ),

            const SizedBox(height: 40),
            Text(
              'Dice Value: $_currentDiceValue',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rollTheDice,
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromARGB(255, 237, 255, 254),
                ),
              ),
              child: const Text(
                'Roll Again',
                style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
              ),
            ),

            const SizedBox(height: 60),
            IconButton(
              onPressed: resetGame,
              icon: const Icon(Icons.refresh, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}
