import 'package:flutter/material.dart';
import 'colors.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String result = "5";
  String operation = "2 + 3";

  @override
  Widget build(BuildContext context) {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(operation,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: colorInput,
                        fontSize: 32.0,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(result,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: isDark ? colorDarkResult : colorResult,
                        fontSize: 60.0,
                        fontStyle: FontStyle.normal,
                      )),
                ),
              ),
              buildHorizontalLine(),
              Row(
                children: <Widget>[
                  buildWideInputButton(context, "DEL"),
                  buildVerticalLine(),
                  buildInputButton(context, "%"),
                  buildVerticalLine(),
                  buildInputButton(context, "÷"),
                ],
              ),
              buildHorizontalLine(),
              Row(
                children: <Widget>[
                  buildInputButton(context, "7"),
                  buildVerticalLine(),
                  buildInputButton(context, "8"),
                  buildVerticalLine(),
                  buildInputButton(context, "9"),
                  buildVerticalLine(),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                          alignment: Alignment(0.0, 1.0),
                          child: Text("*", style: buildInputTextStyle(fontSize: 71.0, fontWeight: FontWeight.w100))),
                    ),
                  )
                ],
              ),
              buildHorizontalLine(),
              Row(
                children: <Widget>[
                  buildInputButton(context, "4"),
                  buildVerticalLine(),
                  buildInputButton(context, "5"),
                  buildVerticalLine(),
                  buildInputButton(context, "6"),
                  buildVerticalLine(),
                  buildInputButton(context, "-"),
                ],
              ),
              buildHorizontalLine(),
              Row(
                children: <Widget>[
                  buildInputButton(context, "1"),
                  buildVerticalLine(),
                  buildInputButton(context, "2"),
                  buildVerticalLine(),
                  buildInputButton(context, "3"),
                  buildVerticalLine(),
                  buildInputButton(context, "+", fontSize: 45.0, fontWeight: FontWeight.w400),
                ],
              ),
              buildHorizontalLine(),
              Row(
                children: <Widget>[
                  buildInputButton(context, "."),
                  buildVerticalLine(),
                  buildInputButton(context, "0"),
                  buildVerticalLine(),
                  buildWideInputButton(context, "=", fontFamily: 'Rajdhani', fontSize: 60.0, color: colorEqualsSign),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildWideInputButton(BuildContext context, String input,
      {String fontFamily = 'Raleway',
      Color color = colorInput,
      double fontSize = 32.0,
      FontWeight fontWeight = FontWeight.w500}) {
    var isEqualSign = input == "=";
    return Container(
      color: isEqualSign ? colorEqualsBackground : Colors.transparent,
      height: MediaQuery.of(context).size.width / 4,
      width: MediaQuery.of(context).size.width / 2 - (input == "DEL" ? 5 : 0),
      child: Center(
        child: Text(input,
            style:
                buildInputTextStyle(fontFamily: fontFamily, color: color, fontSize: fontSize, fontWeight: fontWeight)),
      ),
    );
  }

  Container buildInputButton(BuildContext context, String input,
      {String fontFamily = 'Raleway',
      Color color = colorInput,
      double fontSize = 32.0,
      FontWeight fontWeight = FontWeight.w500}) {
    return Container(
      width: MediaQuery.of(context).size.width / 4 - 3,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Center(
          child: Text(input,
              style: buildInputTextStyle(
                  fontFamily: fontFamily, color: color, fontSize: fontSize, fontWeight: fontWeight)),
        ),
      ),
    );
  }

  TextStyle buildInputTextStyle(
      {String fontFamily = 'Raleway',
      Color color = colorInput,
      double fontSize = 32.0,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        fontFamily: fontFamily, color: color, fontSize: fontSize, fontWeight: fontWeight, fontStyle: FontStyle.normal);
  }

  Container buildVerticalLine() {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      width: 1.0,
      height: MediaQuery.of(context).size.width / 4,
      color: isDark ? colorDarkLine : colorLine,
    );
  }

  Container buildHorizontalLine() {
    bool isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1.0,
      color: isDark ? colorDarkLine : colorLine,
    );
  }
}
