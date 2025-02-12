import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/first_screen.dart';
import 'package:quiz_app/question_quiz.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = FirstScreen(switchScreen);
    super.initState();
  }

  List<String> selectedAnswer = [];
  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == Question.length) {
      setState(() {
        // selectedAnswer = [];
        // activeScreen = FirstScreen(switchScreen);
        activeScreen = ResultScreen(
          choosenAnswer: selectedAnswer,
          backToHome: resetQuiz,
        );
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionQuiz(
        chooseAnswer: chooseAnswer,
      );
    });
  }

  void resetQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = FirstScreen(switchScreen);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 121, 70, 241),
                Color.fromARGB(255, 0, 0, 0),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
