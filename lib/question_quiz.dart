import 'package:flutter/material.dart';
import 'package:quiz_app/components/answer_button.dart';

class QuestionQuiz extends StatefulWidget {
  const QuestionQuiz({super.key});
  @override
  State<QuestionQuiz> createState() {
    return _QuestionQuizState();
  }
}

class _QuestionQuizState extends State<QuestionQuiz> {
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The question',
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AnswerButton(
            answerText: 'Answer 1',
            onTap: () {},
          ),
          AnswerButton(
            answerText: 'Answer 2',
            onTap: () {},
          ),
          AnswerButton(
            answerText: 'Answer 3',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
