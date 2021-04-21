import 'package:dev_quiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          AwnserWidget(
            title: "Kit de desenvolvimento de interface de usuário",
            isRight: true,
            isSelected: true,
          ),
          AwnserWidget(
            title: "Kit de desenvolvimento de interface de usuário",
          ),
          AwnserWidget(
            title: "Kit de desenvolvimento de interface de usuário",
          ),
          AwnserWidget(
            title: "Kit de desenvolvimento de interface de usuário",
          )
        ],
      ),
    );
  }
}
