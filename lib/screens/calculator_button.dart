import 'package:flutter/material.dart';
import 'package:sec4_calculator/core/calculatorcolors.dart';

typedef OnClick = void Function(String);

class CalculatorButton extends StatelessWidget {
  String title;
  double fontSize;
  Color color;
  OnClick onClick;

  CalculatorButton({
    super.key,
    required this.title,
    required this.fontSize,
    required this.color,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        onPressed: () {
          onClick(title);
        },
        child:
            title == ""
                ? Icon(Icons.backspace, color: CalculatorColors.white, size: 25)
                : Text(
                  title,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: CalculatorColors.white,
                  ),
                ),
      ),
    );
  }
}
