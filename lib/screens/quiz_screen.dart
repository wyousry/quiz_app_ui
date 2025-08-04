import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/controllers/question_card.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/app_bar.dart';
import 'package:get/get.dart';
import '../models/progress.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questionController = Get.find<QuestionController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
         
          Positioned.fill(
            child: SvgPicture.asset('assets/icons/bg.svg', fit: BoxFit.cover),
          ),

        
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                const ProgressBar(),
                const SizedBox(height: 10),

               
                Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${questionController.questionNumber.value}",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(color: Color(0xFF8B94BC)),
                      children: [
                        TextSpan(
                          text: "/${questionController.questions.length}",
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(color: Color(0xFF8B94BC)),
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(thickness: 1.5),
                const SizedBox(height: 10),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: questionController.pageController,
                    onPageChanged: questionController.updateTheQnNum,
                    itemCount: questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                      question: questionController.questions[index],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
