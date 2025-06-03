import 'package:flutter/material.dart';
import 'package:sec4_calculator/screens/calculator_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CalculatorScreen.routName,
      routes: {CalculatorScreen.routName: (context) => CalculatorScreen()},
    );
  }
}
