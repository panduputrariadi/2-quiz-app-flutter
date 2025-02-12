import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.answer, {super.key});
  final List<Map<String, Object>> answer;
  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: answer.map((answer) {
            return Row(
              children: [
                // Text(((answer['question_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DecoratedBox(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 59, 10, 236),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              child: Text(
                                ((answer['question_index'] as int) + 1)
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  answer['question'] as String,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  softWrap: true, // Pastikan teks wrap
                                ),
                                Text(
                                  answer['correct_answer'] as String,
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  answer['choosen_answer'] as String,
                                  style: TextStyle(
                                    color: answer['correct_answer'] ==
                                            answer['choosen_answer']
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
