import 'package:flutter/material.dart';
import 'calculator_logic_parse.dart';
import 'calculatorButtons.dart';
import 'displayResults.dart';
import 'splash_screen.dart';
import 'main.dart';

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
        Expanded(
          child: DisplayResult(
            text: '${dataParse.text}',
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: CalculatorButton(
                        lable: 'AC',
                        onTap: () => _buttonClick('AC'),
                        buttonbackgroundColor: Colors.grey,
                        buttonColor: Colors.black),
                  ),
                  Expanded(
                    child: CalculatorButton(
                        lable: '%',
                        onTap: () => _buttonClick('%'),
                        buttonbackgroundColor: Colors.grey,
                        buttonColor: Colors.black),
                  ),
                  Expanded(
                    child: CalculatorButton(
                        lable: '//',
                        onTap: () => _buttonClick('//'),
                        buttonbackgroundColor: Colors.grey,
                        buttonColor: Colors.black),
                  ),
                  Expanded(
                    child: CalculatorButton(
                        lable: '/',
                        onTap: () => _buttonClick('/'),
                        buttonbackgroundColor: Colors.orange),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CalculatorButton(
                      lable: '7',
                      onTap: () => _buttonClick('7'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      lable: '8',
                      onTap: () => _buttonClick('8'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      lable: '9',
                      onTap: () => _buttonClick('9'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                        lable: 'x',
                        onTap: () => _buttonClick('*'),
                        buttonbackgroundColor: Colors.orange),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CalculatorButton(
                      lable: '4',
                      onTap: () => _buttonClick('4'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      lable: '5',
                      onTap: () => _buttonClick('5'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      lable: '6',
                      onTap: () => _buttonClick('6'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                        lable: '-',
                        onTap: () => _buttonClick('-'),
                        buttonbackgroundColor: Colors.orange),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CalculatorButton(
                      lable: '1',
                      onTap: () => _buttonClick('1'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      lable: '2',
                      onTap: () => _buttonClick('2'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      lable: '3',
                      onTap: () => _buttonClick('3'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                        lable: '+',
                        onTap: () => _buttonClick('+'),
                        buttonbackgroundColor: Colors.orange),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: CalculatorButton(
                      lable: '0',
                      onTap: () => _buttonClick('0'),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      lable: ',',
                      onTap: () => _buttonClick(','),
                      buttonbackgroundColor: Colors.blueGrey,
                    ),
                  ),
                  Expanded(
                    child: CalculatorButton(
                      lable: '=',
                      onTap: () => _buttonClick('='),
                      buttonbackgroundColor: Colors.orange,
                      buttonColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],),
        ),
      ],
    );
  }


  // BAD Idea // shat qich depqerum petqa vor function Widget return ani
  // Widget _getButton(
  //     {required String text,
  //     required VoidCallback onTap,
  //     Color buttonbackgroundColor = Colors.blueGrey,
  //     Color buttonColor = Colors.white,
  //     double buttonSize = 90}) {
  //   return CalculatorButton(
  //     lable: text,
  //     onTap: onTap,
  //     buttonbackgroundColor: buttonbackgroundColor,
  //     buttonColor: buttonColor,
  //     buttonSize: buttonSize,
  //   );
  // }

  void _buttonClick(String buttonValue) {
    if (buttonValue == 'AC') {
      dataParse.num1 = 0;
      dataParse.num2 = 0;
      dataParse.operator = '';
      dataParse.result = '';
      dataParse.finalResult = '0';
      dataParse.equalOperator = '';
      dataParse.text = '0';
    } else if (dataParse.equalOperator == '=' && buttonValue == '=') {
      if (dataParse.equalOperator == '+') {
        dataParse.finalResult = add();
      } else if (dataParse.equalOperator == '-') {
        dataParse.finalResult = sub();
      } else if (dataParse.equalOperator == '*') {
        dataParse.finalResult = mul();
      } else if (dataParse.equalOperator == '/') {
        dataParse.finalResult = div();
      } else if (dataParse.equalOperator == '//') {
        dataParse.finalResult = realNumberdiv();
      } else if (dataParse.equalOperator == '%') {
        dataParse.finalResult = module();
      }
    } else if (buttonValue == '+' ||
        buttonValue == '-' ||
        buttonValue == '*' ||
        buttonValue == '/' ||
        buttonValue == '//' ||
        buttonValue == '=' ||
        buttonValue == '%') {
      if (dataParse.num1 == 0) {
        if (isNumber(dataParse.result)) {
          dataParse.num1 = double.parse(dataParse.result);
        }
      } else {
        if (isNumber(dataParse.result)) {
          dataParse.num2 = double.parse(dataParse.result);
        }
      }

      if (dataParse.operator == '+') {
        dataParse.finalResult = add();
      } else if (dataParse.operator == '-') {
        dataParse.finalResult = sub();
      } else if (dataParse.operator == '*') {
        dataParse.finalResult = mul();
      } else if (dataParse.operator == '/') {
        dataParse.finalResult = div();
      } else if (dataParse.operator == '//') {
        dataParse.finalResult = realNumberdiv();
      } else if (dataParse.operator == '%') {
        dataParse.finalResult = module();
      }

      dataParse.equalOperator = dataParse.operator;
      dataParse.operator = buttonValue;
      dataParse.result = '';
    } else {
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

  String add() {
    dataParse.result = (dataParse.num1 + dataParse.num2).toString();
    dataParse.num1 = double.parse(dataParse.result);
    return dataParse.result;
  }

  String sub() {
    dataParse.result = (dataParse.num1 - dataParse.num2).toString();
    dataParse.num1 = double.parse(dataParse.result);
    return dataParse.result;
  }

  String mul() {
    dataParse.result = (dataParse.num1 * dataParse.num2).toString();
    dataParse.num1 = double.parse(dataParse.result);
    return dataParse.result;
  }

  String div() {
    try {
      dataParse.result = (dataParse.num1 / dataParse.num2).toString();
      dataParse.num1 = double.parse(dataParse.result);
    } on IntegerDivisionByZeroException {
      dataParse.num1 = 0;
    }
    return dataParse.result;
  }

  String realNumberdiv() {
    try {
      dataParse.result = (dataParse.num1 ~/ dataParse.num2).toString();
      dataParse.num1 = double.parse(dataParse.result);
    } on IntegerDivisionByZeroException {
      dataParse.num1 = 0;
    }
    return dataParse.result;
  }

  String module() {
    dataParse.result = (dataParse.num1 % dataParse.num2).toString();
    dataParse.num1 = double.parse(dataParse.result);
    return dataParse.result;
  }

  bool isNumber(String text) {
    for (int i = 0; i < text.length; i++) {
      if (text[i] == '1' ||
          text[i] == '2' ||
          text[i] == '3' ||
          text[i] == '4' ||
          text[i] == '5' ||
          text[i] == '6' ||
          text[i] == '7' ||
          text[i] == '8' ||
          text[i] == '9' ||
          text[i] == '0') {
        return true;
      }
    }
    return false;
  }
}