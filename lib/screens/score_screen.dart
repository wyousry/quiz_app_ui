import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/models/custom_button.dart';
import 'package:quiz_app/screens/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(color: Color(0xFF8B94BC)),
              ),
              Spacer(),
              Text(
                "${qnController.correctAns * 10}/${qnController.questions.length * 10}",
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: Color(0xFF8B94BC)),
              ),
              Spacer(flex: 3),
              CustomButton(onPressedExtra: () {
    final controller = Get.find<QuestionController>();
    controller.reset();
  },destination: WelcomeScreen(),title: "Restart Quiz",replace: true,
),
              Spacer(flex: 2),
            ],
          ),
        ],
      ),
    );
  }
}

