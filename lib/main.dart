import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quations_app/result.dart';
import 'quiz.dart';
import 'question.dart';
import 'answer.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Color w = Colors.white;
Color b = Colors.black;

class _MyAppState extends State<MyApp> {
  bool isSwitch = false;
  int _totalScore = 0;
  int _questionIndex = 0;
  int num = 0;
  int num1 = 0;
  int num2 = 0;
  final List<Map<String, Object>> _question = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Tiger', 'score': 20},
        {'text': 'Elephant', 'score': 30},
        {'text': 'Lion', 'score': 40}
      ]
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [
        {'text': 'Heba', 'score': 10},
        {'text': 'Shrouk', 'score': 20},
        {'text': 'Hala', 'score': 30},
        {'text': 'Salma', 'score': 40}
      ]
    }
  ];

  void _ResetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      num = 0;
      num1 = 0;
      num2 = 0;
    });
  }
  void answerquestion(int score) {
    if (_questionIndex == 0) {
      num = score;
    } else if (_questionIndex == 1) {
      num1 = score;
    } else if (_questionIndex == 2) {
      num2 = score;
    }
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(color: w),
          ),
          actions: <Widget>[
            Switch(
              value: isSwitch,
              onChanged: (value) {
                setState(() {
                  isSwitch = value;
                  if (isSwitch == true) {
                    b = Colors.white;
                    w = Colors.black;
                  }
                  if (isSwitch == false) {
                    w = Colors.white;
                    b = Colors.black;
                  }
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          color: w,
          child: _questionIndex < _question.length
              ? Quiz(_question, _questionIndex, answerquestion)
              : Result(_ResetQuiz, _totalScore),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.arrow_back,
            color: w,
            size: 40,
          ),
          onPressed: () {
            if (_questionIndex == 0) _totalScore -= num;
            if (_questionIndex == 1) _totalScore -= num1;
            if (_questionIndex == 2) _totalScore -= num2;

            setState(() {
              if (_questionIndex > 0) {
                _questionIndex--;
              }
            });
          },
        ),
      ),
    );
  }
}