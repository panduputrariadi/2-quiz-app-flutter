import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/components/answer_button.dart';
import 'package:quiz_app/data/question.dart';

class QuestionQuiz extends StatefulWidget {
  final void Function(String answer) chooseAnswer;
  const QuestionQuiz({super.key, required this.chooseAnswer});
  @override
  State<QuestionQuiz> createState() {
    return _QuestionQuizState();
  }
}

class _QuestionQuizState extends State<QuestionQuiz> {
  var currentQuestionIndex = 0;
  void nextQuestion(String answer) {
    widget.chooseAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final dataArrayQuestion = Question[currentQuestionIndex];
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
              // style: const TextStyle(
              //   fontSize: 15,
              //   color: Colors.white,
              // ),
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...dataArrayQuestion.getShuffledAnswer().map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {
                  nextQuestion(answer);
                },
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
