import 'package:flutter/material.dart';

import '../models/quiz.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';
import 'screens/welcome_screen.dart';

enum QuizState { welcome, question, result }

class QuizApp extends StatefulWidget {
  final Quiz quiz;

  const QuizApp({super.key, required this.quiz});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState currentState = QuizState.welcome;
  List<Answer> playerAnswers = [];

  void startQuiz() {
    setState(() {
      currentState = QuizState.question;
      playerAnswers = [];
    });
  }

  void showResults(List<Answer> answers) {
    setState(() {
      currentState = QuizState.result;
      playerAnswers = answers;
    });
  }

  void restartQuiz() {
    setState(() {
      currentState = QuizState.welcome;
      playerAnswers = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    if (currentState == QuizState.welcome) {
      currentScreen = WelcomeScreen(onStart: startQuiz);
    } else if (currentState == QuizState.question) {
      currentScreen = QuestionScreen(
        questions: widget.quiz.questions,
        onComplete: showResults,
      );
    } else {
      currentScreen = ResultScreen(
        questions: widget.quiz.questions,
        playerAnswers: playerAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1E88E5), Color(0xFF42A5F5)],
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}
