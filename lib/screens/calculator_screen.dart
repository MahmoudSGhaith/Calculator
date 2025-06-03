import 'package:flutter/material.dart';
import 'package:sec4_calculator/core/calculatorcolors.dart';
import 'package:sec4_calculator/screens/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routName = "CalculatorScreen";

  CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: CalculatorColors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        title: "C",
                        fontSize: 25,
                        color: CalculatorColors.deepOrange,
                        onClick: clearAll,
                      ),
                      CalculatorButton(
                        title: "%",
                        fontSize: 25,
                        color: CalculatorColors.deepOrange,
                        onClick: onPercentageClick,
                      ),
                      CalculatorButton(
                        title: "",
                        fontSize: 25,
                        color: CalculatorColors.deepOrange,
                        onClick: backSpace,
                      ),
                      CalculatorButton(
                        title: "/",
                        fontSize: 25,
                        color: CalculatorColors.deepOrange,
                        onClick: onOperatorClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        title: "7",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "8",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "9",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "*",
                        fontSize: 25,
                        color: CalculatorColors.deepOrange,
                        onClick: onOperatorClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        title: "4",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "5",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "6",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "-",
                        fontSize: 25,
                        color: CalculatorColors.deepOrange,
                        onClick: onOperatorClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        title: "1",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "2",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "3",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "+",
                        fontSize: 25,
                        color: CalculatorColors.deepOrange,
                        onClick: onOperatorClick,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        title: "00",
                        fontSize: 18,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "0",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: ".",
                        fontSize: 25,
                        color: CalculatorColors.grey,
                        onClick: onDigitClick,
                      ),
                      CalculatorButton(
                        title: "=",
                        fontSize: 25,
                        color: CalculatorColors.deepOrange,
                        onClick: onEqualClick,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String savedNumber = "";
  String savedOperator = "";

  void onDigitClick(String value) {
    if (value == "." && text.contains(".")) return;
    text += value;
    setState(() {});
  }

  void onPercentageClick(String _) {
    if (text.isNotEmpty) {
      double value = double.parse(text);
      if (savedOperator.isNotEmpty && savedNumber.isNotEmpty) {
        double base = double.parse(savedNumber);
        text = ((base * value) / 100).toString();
      } else {
        text = (value / 100).toString();
      }

      setState(() {});
    }
  }

  void onEqualClick(String _) {
    text = calculate(text, savedOperator, savedNumber);
    savedOperator = "";
    savedNumber = "";
    setState(() {});
  }

  void clearAll(String _) {
    text = "";
    savedNumber = "";
    savedOperator = "";
    setState(() {});
  }

  void backSpace(String _) {
    if (text.isEmpty) return;
    text = text.substring(0, text.length - 1);
    setState(() {});
  }

  void onOperatorClick(String operator) {
    if (savedOperator.isEmpty) {
      savedNumber = text;
      savedOperator = operator;
      text = "";
      setState(() {});
    } else {
      savedNumber = calculate(text, savedOperator, savedNumber);
      savedOperator = operator;
      text = "";
      setState(() {});
    }
  }

  String calculate(String text, String savedOperator, String savedNumber) {
    double number1 = double.parse(savedNumber);
    double number2 = double.parse(text);
    double result = 0;
    if (savedOperator == "+") {
      result = number1 + number2;
    } else if (savedOperator == "-") {
      result = number1 - number2;
    } else if (savedOperator == "*") {
      result = number1 * number2;
    } else if (savedOperator == "/") {
      if (number2 == 0) {
        return "error";
      }
      result = (number1 / number2);
    }
    return "$result";
  }
}
