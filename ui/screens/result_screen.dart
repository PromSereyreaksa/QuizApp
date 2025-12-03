import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../../models/quiz.dart';
import '../widgets/result_item.dart';

class ResultScreen extends StatelessWidget {
  final List<Question> questions;
  final List<Answer> playerAnswers;
  final VoidCallback onRestart;

  const ResultScreen({
    super.key,
    required this.questions,
    required this.playerAnswers,
    required this.onRestart,
  });

  int _calculateScore() {
    int score = 0;
    for (int i = 0; i < playerAnswers.length; i++) {
      if (playerAnswers[i].playerChoice == questions[i].answerChoice) {
        score++;
      }
    }
    return score;
  }

  @override
  Widget build(BuildContext context) {
    int score = _calculateScore();
    int total = questions.length;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF1E88E5), Color(0xFF42A5F5)],
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                'You answered $score on $total !',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),

              for (int i = 0; i < questions.length; i++) ...[
                ResultItem(
                  question: questions[i],
                  playerAnswer: playerAnswers[i],
                  questionNumber: i + 1,
                ),
              ],
              const SizedBox(height: 40),
              AppButton('Restart Quiz', onTap: onRestart),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
