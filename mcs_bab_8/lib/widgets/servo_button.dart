import 'package:flutter/material.dart';

class ServoButton extends StatelessWidget {
  String textLeftButton;
  String textRightButton;
  Color colorLeftButton;
  Color colorRightButton;
  Function() onTapLeftButton;
  Function() onTapRightButton;

  ServoButton({
    super.key,
    required this.textLeftButton,
    required this.textRightButton,
    required this.colorLeftButton,
    required this.colorRightButton,
    required this.onTapLeftButton,
    required this.onTapRightButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            backgroundColor: colorLeftButton,
          ),
          child: Text(
            textLeftButton,
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: () {onTapLeftButton();},
        ),

        const SizedBox(width: 20),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            backgroundColor: colorRightButton,
          ),
          child: Text(
            textRightButton,
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: () {onTapRightButton();},
        ),
      ],
    );
  }
}