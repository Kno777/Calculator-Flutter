import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
   const CalculatorButton(
      {Key? key, required this.lable,
      required this.onTap,
      required this.buttonbackgroundColor,
      this.buttonColor,
      this.buttonSize=90}) : super(key: key);

   final String lable;
   final Color? buttonbackgroundColor;
   final Color? buttonColor;
   final double buttonSize;
   final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(6.0),
      child: Container(
        height: buttonSize,
        width: buttonSize,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(1, 1),
              blurRadius: 2,
            ),
          ],
          borderRadius: BorderRadius.all(
              Radius.circular(buttonSize / 2),
          ),
          color: buttonbackgroundColor,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: buttonbackgroundColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          onPressed: onTap,
          child: Center(
            child: Text(
              lable,
              style: TextStyle(
                fontSize: 32,
                color: buttonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
