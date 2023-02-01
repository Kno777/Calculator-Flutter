import 'package:calculator_app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'calculatorButtons.dart';
import 'displayResults.dart';
import 'calculator_logic_parse.dart';
import 'splash_screen.dart';
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

class Calculation extends StatefulWidget {
  const Calculation({Key? key}) : super(key: key);

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  LogicParse dataParse = LogicParse();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DisplayResult(
          text: '${dataParse.text}',
        ),
        Row(
          children: [
            _getButton(
                text: 'AC',
                onTap: () => _buttonClick('AC'),
                buttonbackgroundColor: Colors.grey,
                buttonColor: Colors.black),
            _getButton(
                text: '%',
                onTap: () => _buttonClick('%'),
                buttonbackgroundColor: Colors.grey,
                buttonColor: Colors.black),
            _getButton(
                text: '//',
                onTap: () => _buttonClick('//'),
                buttonbackgroundColor: Colors.grey,
                buttonColor: Colors.black),
            _getButton(
                text: '/',
                onTap: () => _buttonClick('/'),
                buttonbackgroundColor: Colors.orange),
          ],
        ),
        Row(
          children: [
            _getButton(text: '7', onTap: () => _buttonClick('7')),
            _getButton(text: '8', onTap: () => _buttonClick('8')),
            _getButton(text: '9', onTap: () => _buttonClick('9')),
            _getButton(
                text: 'x',
                onTap: () => _buttonClick('*'),
                buttonbackgroundColor: Colors.orange),
          ],
        ),
        Row(
          children: [
            _getButton(text: '4', onTap: () => _buttonClick('4')),
            _getButton(text: '5', onTap: () => _buttonClick('5')),
            _getButton(text: '6', onTap: () => _buttonClick('6')),
            _getButton(
                text: '-',
                onTap: () => _buttonClick('-'),
                buttonbackgroundColor: Colors.orange),
          ],
        ),
        Row(
          children: [
            _getButton(text: '1', onTap: () => _buttonClick('1')),
            _getButton(text: '2', onTap: () => _buttonClick('2')),
            _getButton(text: '3', onTap: () => _buttonClick('3')),
            _getButton(
                text: '+',
                onTap: () => _buttonClick('+'),
                buttonbackgroundColor: Colors.orange),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: _getButton(text: '0', onTap: () => _buttonClick('0')),
            ),
            _getButton(
              text: ',',
              onTap: () => _buttonClick(','),
            ),
            _getButton(
              text: '=',
              onTap: () => _buttonClick('='),
              buttonbackgroundColor: Colors.orange,
              buttonColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  Widget _getButton(
      {required String text,
      required VoidCallback onTap,
      Color buttonbackgroundColor = Colors.blueGrey,
      Color buttonColor = Colors.white,
      double buttonSize = 90}) {
    return CalculatorButton(
      lable: text,
      onTap: onTap,
      buttonbackgroundColor: buttonbackgroundColor,
      buttonColor: buttonColor,
      buttonSize: buttonSize,
    );
  }

  void _buttonClick(String buttonValue){

    if (buttonValue == 'AC'){
      dataParse.num1=0;
      dataParse.num2=0;
      dataParse.operator='';
      dataParse.result = '';
      dataParse.finalResult='0';
      dataParse.equalOperator = '';
      dataParse.text = '0';

    } else if(dataParse.equalOperator == '=' && buttonValue == '='){

      if (dataParse.equalOperator == '+'){
        dataParse.finalResult = add();
      }
      else if(dataParse.equalOperator == '-'){
        dataParse.finalResult = sub();
      }
      else if (dataParse.equalOperator == '*'){
        dataParse.finalResult = mul();
      }
      else if (dataParse.equalOperator == '/'){
        dataParse.finalResult = div();
      }
      else if (dataParse.equalOperator == '//'){
        dataParse.finalResult = realNumberdiv();
      }
      else if (dataParse.equalOperator == '%'){
        dataParse.finalResult = module();
      }

    } else if (buttonValue == '+' || buttonValue == '-' || buttonValue == '*' || buttonValue == '/' || buttonValue == '//' || buttonValue == '=' || buttonValue == '%'){

      if (dataParse.num1 == 0){
        if (isNumber(dataParse.result)){
          dataParse.num1 = double.parse(dataParse.result);
        }
      }else {
        if (isNumber(dataParse.result)){
          dataParse.num2 = double.parse(dataParse.result);
        }
      }

      if(buttonValue == '='){
        print("ayoooo");
      }

      if (dataParse.operator == '+'){
        dataParse.finalResult = add();
      }
      else if(dataParse.operator == '-'){
        dataParse.finalResult = sub();
      }
      else if (dataParse.operator == '*'){
        dataParse.finalResult = mul();
      }
      else if (dataParse.operator == '/'){
        dataParse.finalResult = div();
      }
      else if (dataParse.operator == '//'){
        dataParse.finalResult = realNumberdiv();
      }
      else if (dataParse.operator == '%'){
        dataParse.finalResult = module();
      }

      dataParse.equalOperator = dataParse.operator;
      dataParse.operator = buttonValue;
      dataParse.result = '';

    }
    else {
      dataParse.result += buttonValue;
      dataParse.finalResult = dataParse.result;
    }

    setState(() {
      dataParse.text = dataParse.finalResult;
      print('Operator ${dataParse.operator}');
      print('Equal opr ${dataParse.equalOperator}');
      print('Result ${dataParse.result}');
      print('Final Result ${dataParse.finalResult}');
      print('======================================');
    });
  }

  String add(){
    dataParse.result = (dataParse.num1 + dataParse.num2).toString();
    dataParse.num1 = double.parse(dataParse.result);
    return dataParse.result;
  }

  String sub(){
    dataParse.result = (dataParse.num1 - dataParse.num2).toString();
    dataParse.num1 = double.parse(dataParse.result);
    return dataParse.result;
  }

  String mul(){
    dataParse.result = (dataParse.num1 * dataParse.num2).toString();
    dataParse.num1 = double.parse(dataParse.result);
    return dataParse.result;
  }

  String div(){
    try{
      dataParse.result = (dataParse.num1 / dataParse.num2).toString();
      dataParse.num1 = double.parse(dataParse.result);
    }on IntegerDivisionByZeroException {
      dataParse.num1 = 0;
    } finally {
      return dataParse.result;
    }
  }

  String realNumberdiv(){
    try{
      dataParse.result = (dataParse.num1 ~/ dataParse.num2).toString();
      dataParse.num1 = double.parse(dataParse.result);
    }on IntegerDivisionByZeroException {
      dataParse.num1 = 0;
    } finally {
      return dataParse.result;
    }
  }

  String module(){
    dataParse.result = (dataParse.num1 % dataParse.num2).toString();
    dataParse.num1 = double.parse(dataParse.result);
    return dataParse.result;
  }

  bool isNumber(String text){
    for (int i = 0; i < text.length; i++){
      if (text[i] == '1' || text[i] == '2' || text[i] == '3' || text[i] == '4' || text[i] == '5'|| text[i] == '6' || text[i] == '7' || text[i] == '8' || text[i] == '9' || text[i] == '0'){
        return true;
      }
    }
    return false;
  }

}
