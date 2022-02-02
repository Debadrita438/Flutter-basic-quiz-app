import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Cheeta', 'score': 5},
        {'text': 'Elephant', 'score': 11},
        {'text': 'Lion', 'score': 9}
      ],
    },
    {
      'questionText': 'What\'s your favorite anime?',
      'answers': [
        {'text': 'Gintama', 'score': 2},
        {'text': 'Naruto', 'score': 4},
        {'text': 'Bleach', 'score': 6},
        {'text': 'HunterXHunter', 'score': 10}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _restartHandler() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(const ObjectKey('1'), _questions, _answerQuestion,
                _questionIndex)
            : Result(const ObjectKey('2'), _totalScore, _restartHandler),
      ),
    );
  }
}
