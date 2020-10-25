import 'package:flutter/material.dart';
import 'main.dart';
class Result extends StatelessWidget {
  final Function startQuiz;

  int resultScore = 0;

  Result(this.startQuiz, this.resultScore);

  String get resultText {
    String text=" ";
    if (resultScore >= 70) {
      text = "You are awosame !";
    }
    else if (resultScore >= 40) {
      text = "pretty likabale";
    }
    else {
      text = "You are bad !";
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
             "Your score is $resultScore",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold,color: b),
              textAlign: TextAlign.center,
            ),
            Text(
              resultText,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold,color: b),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              child: Text("Restart The App",
                  style: TextStyle(fontSize: 30, color: Colors.blue)),
              onPressed: startQuiz,
            )
          ],
        ));
  }
}
