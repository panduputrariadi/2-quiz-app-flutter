import 'package:flutter/material.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/data/question.dart';

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
    final dataArrayQuestion = Question[0];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              dataArrayQuestion.text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...dataArrayQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {},
              );
            })
            // AnswerButton(
            //   answerText: dataArrayQuestion.answer[0],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: dataArrayQuestion.answer[1],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: dataArrayQuestion.answer[2],
            //   onTap: () {},
            // ),
            // AnswerButton(
            //   answerText: dataArrayQuestion.answer[3],
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }
}
