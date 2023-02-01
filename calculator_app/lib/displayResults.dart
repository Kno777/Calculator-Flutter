import 'package:flutter/material.dart';

class DisplayResult extends StatelessWidget {
  const DisplayResult({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.only(right: 24, bottom: 24),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 45,
          color: Colors.white,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
