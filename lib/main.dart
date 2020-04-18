import 'package:flutter/material.dart';

import 'calculator_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      home: CalculatorPage(),
    );
  }
}
