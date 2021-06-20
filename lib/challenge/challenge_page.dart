import 'package:dev_quiz/challenge/challenge-controller.dart';
import 'package:dev_quiz/challenge/widgets/next-button/next-button-widget.dart';
import 'package:dev_quiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:dev_quiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:dev_quiz/result/result_page.dart';
import 'package:dev_quiz/shared/models/question-model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({Key? key, required this.questions, required this.title})
      : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  bool isJumpButton = true;

  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });

    super.initState();
  }

  void changeTextButton() {
    setState(() {
      this.isJumpButton = !this.isJumpButton;
    });
  }

  void handleSelectAndChangeTextButton(bool correct) {
    if (correct) {
      controller.correctAnswers++;
    }

    changeTextButton();
  }

  void navigateForNextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 150),
      curve: Curves.linear,
    );

    changeTextButton();
  }

  String getButtonText() {
    if (controller.currentPage == widget.questions.length) {
      return 'Finalizar';
    }

    return isJumpButton ? 'Pular' : 'Próximo';
  }

  void handleFinishQuiz(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          title: widget.title,
          lenght: widget.questions.length,
          corrects: controller.correctAnswers,
        ),
      ),
    );
  }

  void handleClickButton(BuildContext context) {
    if (controller.currentPage == widget.questions.length) {
      return handleFinishQuiz(context);
    }

    navigateForNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onSelected: handleSelectAndChangeTextButton,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: NextButtonWidget.green(
                  label: getButtonText(),
                  onTap: () => handleClickButton(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
