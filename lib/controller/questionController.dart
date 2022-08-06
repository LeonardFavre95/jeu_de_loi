//https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/controllers/question_controller.dart

import 'package:jeu_de_loi/model/Question.dart';
import 'package:flutter/widgets.dart';

class QuestionController {
  late QuestionController _questionController;
  QuestionController get pageController => _questionController;

  final List<Question> _questions = sampleData
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => _questions;
}
