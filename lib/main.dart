import 'package:flutter/material.dart';
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
  // underscore => private
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      print(_questionIndex);
      print("Answer chosen");
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
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

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Title'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
          ],
        ),
      ),
    );
  }
}
