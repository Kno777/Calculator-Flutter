import 'package:calculator_app/main.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'calculator_logic_start.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MaterialApp(
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
                child: Calculation(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
          child: Image.asset('assets/calc_logo.png'),
      ),
    );
  }
}
