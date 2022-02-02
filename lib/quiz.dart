import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  const Quiz(Key? key, this.questions, this.answerQuestion, this.questionIndex)
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          // questions.elementAt(0),
          questions[questionIndex]['questionText'] as String,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              key: ObjectKey(answer),
              selectHandler: () => answerQuestion(answer['score']),
              answerText: answer['text'] as String);
        })
      ],
    );
  }
}
