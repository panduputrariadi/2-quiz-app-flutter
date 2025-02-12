import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  final void Function() backToHome;
  final List<String> choosenAnswer;
  const ResultScreen(
      {super.key, required this.choosenAnswer, required this.backToHome});
  List<Map<String, Object>> getAnswer() {
    final List<Map<String, Object>> answer = [];
    for (var i = 0; i < choosenAnswer.length; i++) {
      answer.add({
        'question_index': i,
        'question': Question[i].text,
        'correct_answer': Question[i].answer[0],
        'choosen_answer': choosenAnswer[i],
      });
    }
    return answer;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getAnswer();
    final numTotalQuestion = Question.length;
    final numCorrectAnswer = summaryData.where((answer) {
      return answer['correct_answer'] == answer['choosen_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You Answered $numCorrectAnswer of $numTotalQuestion Correctly',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            TextButton(
              onPressed: () {
                backToHome();
              },
              child: const Text(
                'Back to Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
