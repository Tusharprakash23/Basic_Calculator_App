import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(), // Dark theme for modern look
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String expression = "";
  String output = "0";

  void buttonPressed(String value) {
    setState(() {

      if (value == "C") {
        expression = "";
        output = "0";
      }
      else if (value == "⌫") {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      }

      else if (value == "=") {
        try {
          String exp = expression.replaceAll("×", "*").replaceAll("÷", "/");
          output = _evaluate(exp);
        } catch (_) {
          output = "Error";
        }
      }
      else {
        expression += value;
      }
    });
  }

  // Simple math formula
  String _evaluate(String exp) {
    try {
      final parts = exp.split(RegExp(r'([+\-*/])'));
      if (parts.length < 2) return exp;

      double num1 = double.parse(parts[0]);
      double num2 = double.parse(parts[1]);
      String operator = exp.replaceAll(RegExp(r'[0-9.]'), '');

      double result = 0;

      if (operator == "+") result = num1 + num2;
      if (operator == "-") result = num1 - num2;
      if (operator == "*") result = num1 * num2;
      if (operator == "/") result = num1 / num2;

      return result.toString();
    } catch (_) {
      return "Error";
    }
  }

  //  calculator button UI
  Widget calcButton(String text, {Color? color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey[850],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 18),
          ),
          onPressed: () => buttonPressed(text),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),

          // for displaying the expression
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              expression,
              style: TextStyle(fontSize: 28, color: Colors.grey[400]),
            ),
          ),

          // final result display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 52,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const Divider(),

          // Buttons Grid
          Row(children: [
            calcButton("7"),
            calcButton("8"),
            calcButton("9"),
            calcButton("⌫", color: Colors.orange),
          ]),
          Row(children: [
            calcButton("4"),
            calcButton("5"),
            calcButton("6"),
            calcButton("÷", color: Colors.orange),
          ]),
          Row(children: [
            calcButton("1"),
            calcButton("2"),
            calcButton("3"),
            calcButton("×", color: Colors.orange),
          ]),
          Row(children: [
            calcButton("0"),
            calcButton("C", color: Colors.red),
            calcButton("=", color: Colors.green),
            calcButton("+", color: Colors.orange),
          ]),
        ],
      ),
    );
  }
}
