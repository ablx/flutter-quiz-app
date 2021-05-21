import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';
import 'package:flutter_quiz_app/result.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

// kann immer neu gebaut werden
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

// Persistent
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['Black', 'Blue', 'Red', 'Green']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Cat', 'Dog', 'Capybara', 'Snake']
    },
    {
      'questionText': 'Who is your favourite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max']
    },
  ];

  // underscore => private
  var _questionIndex = 0;

  void _answerQuestion() {
    print(_questionIndex);
    print(_questions.length);

    setState(() {
      if (_questionIndex < _questions.length) {
        _questionIndex = _questionIndex + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Title!'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(),
      ),
    );
  }
}
