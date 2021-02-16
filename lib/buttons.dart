import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color colour;
  final Color textColour;
  final String buttonText;
  final buttonTapped;

  MyButton({this.colour, this.textColour, this.buttonText, this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: colour,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColour, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
