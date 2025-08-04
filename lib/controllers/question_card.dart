import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/option.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/questions.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
     super.key,
    required this.question,
  });

  final Questions question;

  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 10 ),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
