import '../models/quiz.dart';

List<Question> questions = [
  Question(
    questionId: "1",
    title: "What is the largest ocean on Earth?",
    multipleChoices: [
      "Atlantic Ocean",
      "Indian Ocean",
      "Arctic Ocean",
      "Pacific Ocean",
    ],
    answerChoice: 3, // Pacific Ocean
  ),
  Question(
    questionId: "2",
    title: "Which element has the chemical symbol 'O'?",
    multipleChoices: ["Oxygen", "Gold", "Osmium", "Zinc"],
    answerChoice: 0, // Oxygen
  ),
  Question(
    questionId: "3",
    title: "In which year did the first man land on the moon?",
    multipleChoices: ["1965", "1969", "1972", "1975"],
    answerChoice: 1, // 1969
  ),
];

Quiz mockQuiz = Quiz(questions: questions);
