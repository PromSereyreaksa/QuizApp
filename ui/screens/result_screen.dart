import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../../models/quiz.dart';

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
                Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color:
                                  playerAnswers[i].playerChoice ==
                                      questions[i].answerChoice
                                  ? Colors.green
                                  : Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${i + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              questions[i].title,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      for (
                        int j = 0;
                        j < questions[i].multipleChoices.length;
                        j++
                      ) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              if (playerAnswers[i].playerChoice == j)
                                const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                )
                              else
                                const SizedBox(width: 20),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  questions[i].multipleChoices[j],
                                  style: TextStyle(
                                    fontSize: 16,

                                    color: questions[i].answerChoice == j
                                        ? Colors.greenAccent
                                        : (playerAnswers[i].playerChoice == j
                                              ? Colors.redAccent
                                              : Colors.white70),
                                    fontWeight: questions[i].answerChoice == j
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
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
