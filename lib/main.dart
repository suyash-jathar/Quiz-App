// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart'; //Build in Widgets
import 'package:quiz_app_1/quiz.dart';
import 'package:quiz_app_1/result.dart';
import './question.dart';
import './answers.dart';
// "./" -- to import other files of dart

void main() {
  runApp(MyApp());
}

//variables - Properties
// Functions - Methods
//extends - inheritence

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// "_" in "_MyAppState" used to make this class private from public and can be used here only smily means you can used that variable in that file only (#SecurityPurpose)
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Elephant', 'score': 3},
        {'text': 'Snake', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite Sports?',
      'answers': [
        {'text': 'Cricket', 'score': 10},
        {'text': 'Football', 'score': 5},
        {'text': 'Tennis', 'score': 3},
        {'text': 'Volleyball', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore=0;

  // For Restarting Quiz
  void _resetQuiz(){
    setState(() {
        _questionIndex=0;
        _totalScore=0; 
  
    });
  }

  void _answerQuestion(int score) 
  {
    _totalScore+=score;
    setState(() {
      _questionIndex += 1;
    });
    if (_questionIndex < _questions.length) {
      print("No More Questions!!");
    }
    print(_questionIndex);
  }

  @override // decorator
  Widget build(BuildContext context) {
    // {} -- Map() -- like dictionary in python (Key:Value) pair
    // {
    // 'questions':'What\'s our favourite Color?',
    // 'answers':['Black','Green','Red','Blue'],
    // },
    // {
    // 'questions':'What\'s your favourite Animal?',
    // 'answers':['Dog','Lion','Tiger','Cat'],
    // },
    // {
    // 'questions':'What\'s your Nationality?',
    // 'answers':['USA','Japan','Chineese','Indian'],
    // }
    // ,

    // if ? then this : or this
    //if true execute after "?" or else execute after ":"

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('My First App')),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
