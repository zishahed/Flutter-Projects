import 'package:flutter/material.dart';
import 'package:roll_dice_2d/roll_dice_2d.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'RollDice2D Demo', home: DiceDemoPage());
  }
}

class DiceDemoPage extends StatefulWidget {
  const DiceDemoPage({super.key});

  @override
  State<DiceDemoPage> createState() => _DiceDemoPageState();
}

class _DiceDemoPageState extends State<DiceDemoPage> {
  int _currentDiceValue = 6; // To store the dice value
  Key _diceKey = UniqueKey(); // To re-trigger the roll animation

  void _rollTheDice() {
    setState(() {
      _diceKey = UniqueKey();
    });
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
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 250, 250, 250),
          ),
        ),
      ),
      body: Column(
        children: [
          // Player labels
          Padding(
            padding: const EdgeInsetsGeometry.symmetric(
              vertical: 24.0,
              horizontal: 24.0,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 40.0, 0.0),
                  child: Text(
                    "Player 1",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                  child: Text(
                    "Player 2",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Dice animation
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  const SizedBox(height: 20),
                  Text(
                    'Dice Value: $_currentDiceValue',
                    style: Theme.of(context).textTheme.headlineMedium,
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
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
