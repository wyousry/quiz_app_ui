import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/screens/score_screen.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Questions> _questions = samples
      .map(
        (question) => Questions(
          id: question['id'],
          question: question['question'],
          options: question['options'],
          answer: question['answer_index'],
        ),
      )
      .toList();
  List<Questions> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  int _correctAns = 0;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  bool _isQuizFinished = false;

  @override
  void onInit() {
    _pageController = PageController();
    _animationController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });

    _animationController.forward().whenComplete(nextQuestion);
    super.onInit();
  }

  void reset() {
    _correctAns = 0;
    _questionNumber.value = 1;
    _isAnswered = false;
    _isQuizFinished = false;

    _animationController.reset();
    _animationController.forward().whenComplete(nextQuestion);

    if (_pageController.hasClients) {
      _pageController.jumpToPage(0);
    }

    update();
  }

  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  void checkAns(Questions question, int selectedIndex) {
    if (_isAnswered) return;

    _isAnswered = true;
    _selectedAns = selectedIndex;

    if (_selectedAns == question.answer) {
      _correctAns++;
    }

    _animationController.stop();
    update();

    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_isQuizFinished) return;

    if (_questionNumber.value < _questions.length) {
      _isAnswered = false;
      if (_pageController.hasClients) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease,
        );
      }
      _animationController.reset();
      _animationController.forward().whenComplete(nextQuestion);
      _questionNumber.value++;
    } else {
      _isQuizFinished = true;
      Get.to(() => ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
