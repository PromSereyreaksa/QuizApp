import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Question {
  String questionId;
  String title;
  List<String> multipleChoices;
  int answerChoice;

  Question(
      {String? questionId,
      required this.title,
      required this.multipleChoices,
      required this.answerChoice})
      : questionId = questionId ?? uuid.v4();
}

class Answer {
  String answerId;
  int playerChoice;
  String questionId;

  Answer(
      {String? answerId,
      required this.playerChoice,
      required this.questionId})
      : answerId = answerId ?? uuid.v4();
}


class Quiz {
  List<Question> questions;

  Quiz({required this.questions});
}
