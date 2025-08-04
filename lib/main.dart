import 'package:flutter/material.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/my_app.dart';
import 'package:get/get.dart';
void main() {
    WidgetsFlutterBinding.ensureInitialized();
  Get.put(QuestionController());
  runApp(const MyApp());
}


