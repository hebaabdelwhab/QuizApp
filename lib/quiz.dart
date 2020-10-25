import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int questionIndex;
  final Function answerquestion;

  Quiz(this.question, this.questionIndex, this.answerquestion);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(question[questionIndex]['questionText']),
        ...(question[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
         return Answer(()=>answerquestion(answer['score']),answer['text']);
        }).toList(),
      ],
    );
  }
}
