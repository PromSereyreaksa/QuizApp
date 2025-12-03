import 'package:flutter/material.dart';
import 'ui/quiz_app.dart';
import 'data/quiz_mock.dart';
import 'models/quiz.dart';

void main() {
  // Load the quiz data
  Quiz quiz = mockQuiz;

  // Run the app
  runApp(QuizApp(quiz: quiz));
}
