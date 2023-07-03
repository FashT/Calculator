import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final textColor;
  final color;
  final buttonTapped;
  const MyButton(
      {required this.buttonText, required this.color, required this.textColor, required this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
