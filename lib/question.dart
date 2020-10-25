import 'package:flutter/material.dart';
import 'main.dart';
class Question extends StatelessWidget {
  final String questionTest;

  Question(this.questionTest);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(questionTest,
          style: TextStyle(fontSize: 30,color: b,fontWeight: FontWeight.bold), textAlign: TextAlign.center),
    );
  }
}
