import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> currency = ["USD", "BDT", "JPY", "INR", "EUR"];
  final Map<String, double> rates = {
    "USD": 1.0,
    "BDT": 122.724,
    "EUR": 0.85,
    "INR": 86.5,
    "JPY": 147.0,
  };
  final padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 18);
  final TextEditingController textEditingController = TextEditingController();
  double convertedAmount = 0;

  // Conversion Logic
  double convertCurrency(double amount, String from, String to) {
    final amountRelativeToUSD = amount / rates[from]!;
    return amountRelativeToUSD * rates[to]!;
  }

  String fromCurrency = "USD";
  String toCurrency = "BDT";

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Color.fromARGB(255, 31, 41, 55), width: 2.0),
  );

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
            const SizedBox(height: 40),

            SizedBox(
              width: 450,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditingController,

                        onChanged: (value) {
                          final double? amount = double.tryParse(value);
                          if (amount == null) {
                            setState(() {
                              convertedAmount = 0;
                            });
                            return;
                          }
                          setState(() {
                            convertedAmount = convertCurrency(
                              amount,
                              fromCurrency,
                              toCurrency,
                            );
                          });
                        },

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
                        initialValue: fromCurrency,

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

                        onChanged: (value) {
                          setState(() {
                            fromCurrency = value!;
                          });

                          final double? amount = double.tryParse(
                            textEditingController.text,
                          );

                          if (amount != null) {
                            setState(() {
                              convertedAmount = convertCurrency(
                                amount,
                                fromCurrency,
                                toCurrency,
                              );
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 12)),

            SizedBox(
              width: 390,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color.fromARGB(255, 31, 41, 55),
                          width: 2,
                        ),
                      ),

                      child: Row(
                        children: [
                          const Icon(
                            Icons.monetization_on_outlined,
                            color: Color.fromARGB(255, 107, 114, 128),
                          ),

                          const SizedBox(width: 12),

                          Text(
                            convertedAmount == 0
                                ? "Converted Amount"
                                : convertedAmount.toStringAsFixed(2),

                            style: TextStyle(
                              color: convertedAmount == 0
                                  ? const Color.fromARGB(255, 107, 114, 128)
                                  : const Color.fromARGB(255, 31, 41, 55),

                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  SizedBox(
                    width: 120,
                    child: DropdownButtonFormField<String>(
                      initialValue: toCurrency,

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

                      onChanged: (value) {
                        setState(() {
                          toCurrency = value!;
                        });

                        final double? amount = double.tryParse(
                          textEditingController.text,
                        );

                        if (amount != null) {
                          setState(() {
                            convertedAmount = convertCurrency(
                              amount,
                              fromCurrency,
                              toCurrency,
                            );
                          });
                        }
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
