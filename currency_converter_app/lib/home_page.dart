import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> currency = ["USD", "BDT", "JPY", "INR", "EUR"];

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
            const SizedBox(height: 40),

            SizedBox(
              width: 450,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.monetization_on_outlined),
                        prefixIconColor: Color.fromARGB(255, 107, 114, 128),

                        hintText: "Please enter Amount",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 107, 114, 128),
                        ),

                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  SizedBox(
                    width: 120,
                    child: DropdownButtonFormField<String>(
                      initialValue: currency[0],

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                      ),

                      items: currency.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),

                      onChanged: (initialValue) {
                        debugPrint("Selected currency: $initialValue");
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
