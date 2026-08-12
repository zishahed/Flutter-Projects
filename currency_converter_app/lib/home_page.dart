import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> currency = ["USD", "BDT", "JPY", "INR", "EUR"];

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );

    final padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 18);

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
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: false, // denying - sign, negative numbers
                        decimal: true, // allowing dot
                      ),

                      // this controls what Flutter accepts
                      // by typing this Formatter I am denying the use of
                      // negative (-) sign even though it is in the keyboard
                      // this is imported from services.dart package
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d*'),
                        ),
                      ],

                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.monetization_on_outlined),
                        prefixIconColor: Color.fromARGB(255, 107, 114, 128),

                        hintText: "Please enter Amount",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 107, 114, 128),
                        ),

                        filled: true,
                        fillColor: Colors.white,

                        focusedBorder: border,
                        enabledBorder: border,

                        contentPadding: padding,
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

                        focusedBorder: border,
                        enabledBorder: border,

                        contentPadding: padding,
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

            Padding(padding: EdgeInsets.all(12)),

            SizedBox(
              width: 450,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.monetization_on_outlined),
                        prefixIconColor: Color.fromARGB(255, 107, 114, 128),

                        hintText: "Converted Amount",
                        hintStyle: const TextStyle(
                          color: Color.fromARGB(255, 107, 114, 128),
                        ),
                        filled: true,
                        fillColor: Colors.white,

                        focusedBorder: border,
                        enabledBorder: border,

                        contentPadding: padding,
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

                        focusedBorder: border,
                        enabledBorder: border,

                        contentPadding: padding,
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
