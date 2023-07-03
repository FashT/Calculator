import 'package:math_expressions/math_expressions.dart';
import 'mybutton.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _userQuestion = '';
  var _answerText = '';

  final List<String> buttons = [
    'C',
    'Del',
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
  final fontData = TextStyle(fontSize: 30, color: Colors.deepPurple);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 50),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _userQuestion,
                        style: fontData,
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        _answerText,
                        style: fontData,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              child: GridView.builder(
                // ignore: prefer_const_constructors
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                           _userQuestion = '';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.white);
                  } else if (index == 1) {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                            _userQuestion = _userQuestion.substring(
                                0, _userQuestion.length - 1);
                          });
                        }, 
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white);

                  } 
                   else if (index == buttons.length-1) {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                          equalPressed();
                          });
                        }, 
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white);
                   }
                  
                  else {
                    return MyButton(
                        buttonTapped: () {
                          setState(() {
                            _userQuestion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOpreator(buttons[index])
                            ? Colors.deepPurple
                            : Colors.deepPurple[50],
                        textColor: isOpreator(buttons[index])
                            ? Colors.white
                            : Colors.deepPurple);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOpreator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
  void equalPressed(){
String finalQuestion = _userQuestion;

Parser p =  Parser();
Expression exp = p.parse(finalQuestion);
ContextModel cm = ContextModel();
double eval = exp.evaluate(EvaluationType.REAL, cm);
_userQuestion = eval.toStringAsFixed(0);
  }
}
