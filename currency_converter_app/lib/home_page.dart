import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Currency Converter",
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 40.0,
                fontWeight: FontWeight.bold, // w700 = bold, w400 = normal
              ),
            ),
            TextField(
              style: TextStyle(color: Colors.indigo),
              decoration: InputDecoration(
                labelText: "Please enter the amount in USD",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
