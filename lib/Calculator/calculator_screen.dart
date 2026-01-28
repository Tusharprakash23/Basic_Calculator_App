import 'package:flutter/material.dart';
import 'calculator_button.dart';
import 'calculator_logic.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
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
        String exp = expression.replaceAll("×", "*").replaceAll("÷", "/");
        output = CalculatorLogic.evaluate(exp);
      }

      else {
        expression += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Calculator"), centerTitle: true),

      body: Column(
        children: [

          const SizedBox(height: 20),

          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              expression,
              style: TextStyle(fontSize: 28, color: Colors.grey[400]),
            ),
          ),

          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              output,
              style: const TextStyle(fontSize: 52, fontWeight: FontWeight.bold),
            ),
          ),

          const Divider(),

          Row(children: [
            CalculatorButton(text: "7", onTap: buttonPressed),
            CalculatorButton(text: "8", onTap: buttonPressed),
            CalculatorButton(text: "9", onTap: buttonPressed),
            CalculatorButton(text: "⌫", color: Colors.blue, onTap: buttonPressed),
          ]),

          Row(children: [
            CalculatorButton(text: "4", onTap: buttonPressed),
            CalculatorButton(text: "5", onTap: buttonPressed),
            CalculatorButton(text: "6", onTap: buttonPressed),
            CalculatorButton(text: "÷", color: Colors.blue, onTap: buttonPressed),
          ]),

          Row(children: [
            CalculatorButton(text: "1", onTap: buttonPressed),
            CalculatorButton(text: "2", onTap: buttonPressed),
            CalculatorButton(text: "3", onTap: buttonPressed),
            CalculatorButton(text: "×", color: Colors.blue, onTap: buttonPressed),
          ]),

          Row(children: [
            CalculatorButton(text: "0", onTap: buttonPressed),
            CalculatorButton(text: "C", color: Colors.red, onTap: buttonPressed),
            CalculatorButton(text: "=", color: Colors.green, onTap: buttonPressed),
            CalculatorButton(text: "+", color: Colors.blue, onTap: buttonPressed),
          ]),
        ],
      ),
    );
  }
}
