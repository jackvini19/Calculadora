import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _expression = '';
  String _result = '';

  void _updateExpression(String value) {
    setState(() {
      _expression += value;
      return _expression;
    });
  }

  void deleteEndDigit() {
    if (_expression.length > 0) {
      _expression = _expression.substring(0, _expression.length - 1);
    }
  }

  void _handleButtonPressed(String label) {
    if (label == 'C') {
      _clear();
    } else if (label == '<-') {
      deleteEndDigit();
    } else if (label == ".") {
      if (_expression.contains(".")) {
        print("Already exist");
        return;
      } else {
        _expression = _expression + label;
      }
    } else {
      _updateExpression(label);
    }
  }

  void _evaluateExpression() {
    try {
      final expression = Parser().parse(_expression);
      final evaluated =
          expression.evaluate(EvaluationType.REAL, ContextModel());
      setState(() {
        _result = evaluated.toString();
      });
    } catch (e) {
      setState(() {
        _result = 'Error';
      });
    }
  }

  void _clear() {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(45.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _expression,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(35.0),
              alignment: Alignment.topRight,
              child: Text(
                _result,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Divider(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('+'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('0'),
              _buildButton('.'),
              _buildButton('C', textColor: Colors.redAccent),
              _buildButton('/', textColor: Color.fromARGB(255, 0, 0, 0)),
            ],
          ),
          SizedBox(height: 60.0),
          ElevatedButton(
            child: Text(
              '<-',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: deleteEndDigit,
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 218, 65, 65),
              onPrimary: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          SizedBox(height: 60.0),
          ElevatedButton(
            child: Text(
              '=',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: _evaluateExpression,
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton(String label, {Color textColor = Colors.black}) {
    return ElevatedButton(
      child: Text(
        label,
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
      onPressed: () => _handleButtonPressed(label),
    );
  }
}
