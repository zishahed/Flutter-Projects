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
  int _currentDiceValue = 1; // To store the dice value
  Key _diceKey = UniqueKey(); // To re-trigger the roll animation

  void _rollTheDice() {
    // To re-trigger the animation and onRoll, we change the key of RollDice2D.
    // This causes the widget to be rebuilt and its initState (including the roll) to run again.
    setState(() {
      _diceKey = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RollDice2D Example')),
      body: Center(
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
                print('Dice rolled, final value: $value');
              },
              color: DiceColor.red, // Or DiceColor.white
              rollingTimes:
                  5, // Number of times the dice face changes during animation
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
              child: const Text('Roll Again'),
            ),
          ],
        ),
      ),
    );
  }
}
