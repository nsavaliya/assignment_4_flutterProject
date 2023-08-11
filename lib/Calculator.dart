import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";// Holds the current output displayed on the calculator screen
  String _currentInput = "";// Holds the current input being entered by the user
  double _num1 = 0.0;// for the first operand for calculations
  double _num2 = 0.0;// for the second operand for calculations
  String _operator = "";//operand for the current location


 // Function to handle button press events
  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "0";
        _currentInput = "";
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = "";
        return;
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" ||
          buttonText == "/") {
       // Handle arithmetic operator button press
        _num1 = double.parse(_currentInput);
        _operator = buttonText;
        _currentInput = "";
        return;
      } else if (buttonText == "=") {
         // Perform calculation and display result
        _num2 = double.parse(_currentInput);
        switch (_operator) {
          case "+":
            _output = (_num1 + _num2).toString();
            break;
          case "-":
            _output = (_num1 - _num2).toString();
            break;
          case "*":
            _output = (_num1 * _num2).toString();
            break;
          case "/":
            _output = (_num1 / _num2).toString();
            break;
        }
        _num1 = 0.0;
        _num2 = 0.0;
        _operator = "";
        return;
        //the pressed button's value to the current input
      } else {
        _currentInput += buttonText;
        _output = _currentInput;
      }
    });
  }
 // Function to build calculator button with specified buttonText
  Widget _buildButton(String buttonText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0), // Add vertical and horizontal margins
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Change button color here
                textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                minimumSize: Size(80.0, 80.0), // Set width and height
                padding: EdgeInsets.all(0.0), // No padding
              ),
              onPressed: () => _buttonPressed(buttonText),
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator Page')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: Text(
                _output,
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(height: 0.0),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ]),
                Row(children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("*"),
                ]),
                Row(children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ]),
                Row(children: [
                  _buildButton("C"),
                  _buildButton("0"),
                  _buildButton("="),
                  _buildButton("+"),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
