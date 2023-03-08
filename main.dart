import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeApp(),
    ));

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  String output = "0";
  // bool _usedoperand = false;
  String _out = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  //int _bufferIndex = 0;
  //final _buffer = [0.0, 0.0];

  void deleteEndDigit() {
    _out = _out.length > 1 ? _out.substring(0, _out.length - 1) : '0';
  }

  //void _addDigit(String digit) {
  // if (_usedoperand) _out = '0';

  //  if (_out.contains('.') && digit == '.') digit = '';
  //  if (_out == '0' && digit != '.') _out = '';

  // _out += digit;

  // _buffer[_bufferIndex] = double.tryParse(_out)!;
  // _usedoperand = false;
  // }

  buttonPressed(String btnVal) {
    print(btnVal);
    if (btnVal == "C") {
      _out = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (btnVal == '<-') {
      deleteEndDigit();
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "*" ||
        btnVal == "/") {
      num1 = double.parse(output);
      operand = btnVal;
      _out = "0";
      output = output + btnVal;
    } else if (btnVal == ".") {
      if (_out.contains(".")) {
        print("Already exist");
        return;
      } else {
        _out = _out + btnVal;
      }
    } else if (btnVal == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _out = (num2 + num1).toString();
      }
      if (operand == "-") {
        _out = (num1 - num2).toString();
      }
      if (operand == "*") {
        _out = (num2 * num1).toString();
      }
      if (operand == "/") {
        _out = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      //_out = "0";
    } else {
      _out = _out + btnVal;
    }

    setState(() {
      output = double.parse(_out).toStringAsFixed(2);
    });
  }

  Widget buildButton(String ButtonVal) {
    // ignore: unnecessary_new
    return new Expanded(
        child: Container(
      padding: EdgeInsets.all(0.0),
      margin: EdgeInsets.all(10.0),
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 21, 255, 0),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            offset: Offset(2.0, 2.0),
          ),
          //
          BoxShadow(
            color: Color.fromARGB(255, 204, 186, 20),
            offset: Offset(-2.0, -2.0),
          ),
        ],
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(30.0),
        child: Text(
          ButtonVal,
          style: TextStyle(fontSize: 22.0),
        ),
        onPressed: () => buttonPressed(ButtonVal),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 79, 248),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 50.0),
                child: Text(
                  output,
                  style: TextStyle(fontSize: 60.0),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildButton("."),
                      buildButton("C"),
                      buildButton("<-"),
                      buildButton("*")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("7"),
                      buildButton("8"),
                      buildButton("9"),
                      buildButton("/")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("4"),
                      buildButton("5"),
                      buildButton("6"),
                      buildButton("+")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("1"),
                      buildButton("2"),
                      buildButton("3"),
                      buildButton("-")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildButton("0"),
                      buildButton("="),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
