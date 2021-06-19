import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MainScreen extends StatefulWidget {
  static final String route = '/';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color actionColor = Colors.orange;
  String mainCalcContent = '';

  void remove(String content) {
    setState(() => {mainCalcContent = ''});
  }

  void addContent(String content) {
    setState(() => mainCalcContent += content);
  }

  void count(String text) {
    Expression expression = Parser().parse(mainCalcContent);
    ContextModel contextModel = ContextModel();

    setState(() {
      mainCalcContent =
          expression.evaluate(EvaluationType.REAL, contextModel).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: actionColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(500.0)),
              ),
              alignment: Alignment.center,
              width: 50,
              height: 100,
              child: Text(
                mainCalcContent,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Button(
                  content: "AC",
                  callback: remove,
                  backgroundColor: actionColor,
                ),
                Button(
                  content: "LessIsMore",
                  width: 170,
                ),
                Button(
                  content: "/",
                  callback: addContent,
                  backgroundColor: actionColor,
                ),
              ],
            ),
            Row(
              children: [
                Button(
                  content: "7",
                  callback: addContent,
                ),
                Button(
                  content: "8",
                  callback: addContent,
                ),
                Button(
                  content: "9",
                  callback: addContent,
                ),
                Button(
                  content: "*",
                  backgroundColor: actionColor,
                  callback: addContent,
                )
              ],
            ),
            Row(
              children: [
                Button(
                  content: "4",
                  callback: addContent,
                ),
                Button(
                  content: "5",
                  callback: addContent,
                ),
                Button(
                  content: "6",
                  callback: addContent,
                ),
                Button(
                  content: "-",
                  backgroundColor: actionColor,
                  callback: addContent,
                )
              ],
            ),
            Row(
              children: [
                Button(
                  content: "1",
                  callback: addContent,
                ),
                Button(
                  content: "2",
                  callback: addContent,
                ),
                Button(
                  content: "3",
                  callback: addContent,
                ),
                Button(
                  content: "+",
                  backgroundColor: actionColor,
                  callback: addContent,
                )
              ],
            ),
            Row(
              children: [
                Button(
                  content: "0",
                  callback: addContent,
                  width: 170,
                ),
                Button(
                  content: ".",
                  callback: addContent,
                ),
                Button(
                  content: "=",
                  backgroundColor: actionColor,
                  callback: count,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
