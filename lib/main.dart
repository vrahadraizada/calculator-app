import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';
  final myTextStyle = TextStyle(fontSize: 30, color: Colors.grey[900]);
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'Ans',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(userQuestion, style: TextStyle(fontSize: 20)),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer, style: TextStyle(fontSize: 20)),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  if (index == buttons.length - 1) {
                    return MyButton(
                      buttonTapped: () => setState(() => equalPressed()),
                      buttonText: buttons[index],
                      colour: Colors.amber,
                      textColour: Colors.grey[900],
                    );
                  } else if (index == buttons.length - 2) {
                    return MyButton(
                      buttonTapped: () => setState(() => equalPressed()),
                      buttonText: buttons[index],
                      colour: Colors.white,
                      textColour: Colors.grey[900],
                    );
                  } else if (index == 0) {
                    return MyButton(
                      buttonTapped: () => setState(() => userQuestion = ''),
                      buttonText: buttons[index],
                      colour: Colors.grey[900],
                      textColour: Colors.white,
                    );
                  } else if (index == 1) {
                    return MyButton(
                      buttonTapped: () => setState(() {
                        userQuestion =
                            userQuestion.substring(0, userQuestion.length - 1);
                      }),
                      buttonText: buttons[index],
                      colour: Colors.grey[900],
                      textColour: Colors.white,
                    );
                  } else {
                    return MyButton(
                      buttonTapped: () {
                        setState(() => userQuestion += buttons[index]);
                      },
                      buttonText: buttons[index],
                      colour: isOperator(buttons[index])
                          ? Colors.grey[900]
                          : Colors.white,
                      textColour: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.grey[900],
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '+' || x == '-' || x == 'x') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    double eval = Parser()
        .parse(finalQuestion)
        .evaluate(EvaluationType.REAL, ContextModel());
    userAnswer = eval.toString();
  }
}

// final List<String> buttons =
//   [
//     'C', 'DEL', '%', '/',
//     '9', '8', '7', 'x',
//     '6', '5', '4', '-',
//     '3', '3', '1', '',
//     '0', '.', 'Ans', '=',
//   ];
