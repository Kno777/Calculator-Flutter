import 'package:calculator_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'calculatorButtons.dart';
import 'displayResults.dart';
import 'calculator_logic_parse.dart';
import 'splash_screen.dart';
import 'calculator_logic_start.dart';
import 'dart:async';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator App",
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          title: const Text(
            "Calculator",
          ),
          backgroundColor: Colors.black,
        ),
        body: const SafeArea(
          child: MyHomePage(),
        ),
      ),
    );
  }
}

