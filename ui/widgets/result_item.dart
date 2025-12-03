import 'package:flutter/material.dart';
import '../../models/quiz.dart';

class ResultItem extends StatelessWidget {
  final Question question;
  final Answer playerAnswer;
  final int questionNumber;

  const ResultItem({
    super.key,
    required this.question,
    required this.playerAnswer,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    bool isCorrect = playerAnswer.playerChoice == question.answerChoice;

    return Container(
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
                  color: isCorrect ? Colors.green : Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$questionNumber',
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
                  question.title,
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
          for (int j = 0; j < question.multipleChoices.length; j++) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  if (playerAnswer.playerChoice == j)
                    const Icon(Icons.check, color: Colors.white, size: 20)
                  else
                    const SizedBox(width: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      question.multipleChoices[j],
                      style: TextStyle(
                        fontSize: 16,
                        color: question.answerChoice == j
                            ? Colors.greenAccent
                            : (playerAnswer.playerChoice == j
                                  ? Colors.redAccent
                                  : Colors.white70),
                        fontWeight: question.answerChoice == j
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
    );
  }
}
