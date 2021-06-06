import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/home/home-repository.dart';
import 'package:dev_quiz/home/home-state.dart';
import 'package:dev_quiz/shared/models/awnser-model.dart';
import 'package:dev_quiz/shared/models/question-model.dart';
import 'package:dev_quiz/shared/models/quiz-model.dart';
import 'package:dev_quiz/shared/models/user-model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;

    user = await repository.getUser();

    state = HomeState.sucess;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    quizzes = await repository.getQuizzes();

    state = HomeState.sucess;
  }
}
