import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "CLEAR") {
      // Clear button logic
      setState(() {
        output = "0";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      });
    } else if (buttonText == "=") {
      // Calculate result logic
      setState(() {
        num2 = double.parse(output);

        if (operand == "+") {
          output = (num1 + num2).toString();
        } else if (operand == "-") {
          output = (num1 - num2).toString();
        } else if (operand == "×") {
          output = (num1 * num2).toString();
        } else if (operand == "÷") {
          output = (num1 / num2).toString();
        }

        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      });
    } else {
      // Number or operand button logic
      setState(() {
        if (buttonText == "+" || buttonText == "-" || buttonText == "×" || buttonText == "÷") {
          operand = buttonText;
          num1 = double.parse(output);
          output = "0";
        } else {
          if (output == "0") {
            output = buttonText;
          } else {
            output += buttonText;
          }
        }
      });
    }
  }

  Widget buildButton(String buttonText, Color buttonColor) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(24.0)),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              output,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: <Widget>[
                  buildButton("7", Colors.white),
                  buildButton("8", Colors.white),
                  buildButton("9", Colors.white),
                  buildButton("÷", Colors.grey),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4", Colors.white),
                  buildButton("5", Colors.white),
                  buildButton("6", Colors.white),
                  buildButton("×", Colors.grey),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1", Colors.white),
                  buildButton("2", Colors.white),
                  buildButton("3", Colors.white),
                  buildButton("-", Colors.grey),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton(".", Colors.white),
                  buildButton("0", Colors.white),
                  buildButton("00", Colors.white),
                  buildButton("+", Colors.grey),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("CLEAR", Colors.grey),
                  buildButton("=", Colors.grey),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
