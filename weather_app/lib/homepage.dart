import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color textColor = Color.fromARGB(255, 24, 58, 56);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 5.0,
        shadowColor: Colors.black.withValues(),

        title: Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26.0,
            color: Colors.black,
          ),
        ),

        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            "30°C",
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),

                          const SizedBox(height: 20),
                          Icon(Icons.cloud, size: 64.0, color: textColor),

                          const SizedBox(height: 20),
                          Text(
                            "Rain",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontStyle: FontStyle.italic,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //weather forcast cards
            const SizedBox(height: 30),
            Placeholder(fallbackHeight: 150),
            //aditional cards
            const SizedBox(height: 30),
            Placeholder(fallbackHeight: 150),
          ],
        ),
      ),
    );
  }
}
