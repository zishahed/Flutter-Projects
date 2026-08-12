import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 247, 250),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Currency Converter",
              style: TextStyle(
                color: Color.fromARGB(255, 31, 41, 55),
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          // Using Sized Box
          // TextField     CurrencyUnit
          // OutputField   CurrencyUnit
          // Logic triggers on every digit typed
        ),
      ),
    );
  }
}
