import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String input = "";
  String result = "0";
  String operator = "";
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String value) {
    setState(() {
      if (value == "C") {
        input = "";
        result = "0";
        num1 = 0;
        num2 = 0;
        operator = "";
      } else if (value == "=") {
        if (operator.isNotEmpty) {
          num2 = double.parse(input);
          switch (operator) {
            case "+":
              result = (num1 + num2).toString();
              break;
            case "-":
              result = (num1 - num2).toString();
              break;
            case "*":
              result = (num1 * num2).toString();
              break;
            case "/":
              result = num2 != 0 ? (num1 / num2).toString() : "Error";
              break;
          }
          input = "";
          operator = "";
        }
      } else if (["+", "-", "*", "/"].contains(value)) {
        if (input.isNotEmpty) {
          num1 = double.parse(input);
          operator = value;
          input = "";
        }
      } else {
        input += value;
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () => buttonPressed(text),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(20),
            backgroundColor: Colors.blueGrey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
