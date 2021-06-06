import 'dart:convert';

import 'package:dev_quiz/shared/models/quiz-model.dart';
import 'package:dev_quiz/shared/models/user-model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/user.json");

    final user = UserModel.fromJson(response);

    return user;
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");

    final list = jsonDecode(response) as List;
    final quizzes = list.map((quizz) => QuizModel.fromMap(quizz)).toList();
    return quizzes;
  }
}
