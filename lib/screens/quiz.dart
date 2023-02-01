import 'package:flutter/material.dart';
import 'package:personality_quiz/models/quizdata.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key, required this.quizData, required this.endCallback});

  final QuizData quizData;
  final void Function(bool) endCallback;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  void registerAnswer(value) {
    setState(() {
      // Check if answersmap already has data on X index
      // if it does, replace it
      // Otherwise, add the value
      // Next shouldn't be clickable until u select a radiobox

      if (widget.quizData.answersMap.length >= widget.quizData.index + 1) {
        widget.quizData.answersMap[widget.quizData.index] = value;
      } else {
        widget.quizData.answersMap.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int? groupVal = widget.quizData.answersMap.length <= widget.quizData.index
        ? null
        : widget.quizData.answersMap[widget.quizData.index];
    return Scaffold(
      appBar: AppBar(
          title: const Text('Back'),
          leading: BackButton(onPressed: () => Navigator.pop(context))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                QuizData.questionsMap.entries
                    .elementAt(widget.quizData.index)
                    .key,
                style: const TextStyle(fontSize: 19),
                textAlign: TextAlign.center,
              )),
          for (var i = 0;
              i <
                  QuizData.questionsMap.entries
                      .elementAt(widget.quizData.index)
                      .value
                      .length;
              i++)
            RadioListTile(
              title: Text(QuizData.questionsMap.entries
                  .elementAt(widget.quizData.index)
                  .value
                  .elementAt(i)
                  .entries
                  .first
                  .key),
              value: i,
              groupValue: groupVal,
              onChanged: (value) {
                setState(() => registerAnswer(value));
              },
            ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ElevatedButton(
                onPressed: widget.quizData.index == 0
                    ? null
                    : () {
                        setState(() {
                          --widget.quizData.index;
                        });
                      },
                child: const Text('Previous Question'),
              )),
          ElevatedButton(
              onPressed: widget.quizData.index ==
                          QuizData.questionsMap.entries.length - 1 ||
                      widget.quizData.answersMap.length <= widget.quizData.index
                  ? widget.quizData.index ==
                              QuizData.questionsMap.entries.length - 1 &&
                          widget.quizData.answersMap.length ==
                              widget.quizData.index + 1
                      ? () {
                          widget.endCallback(true);
                          Navigator.pop(context);
                        }
                      : null
                  : () {
                      if (widget.quizData.index <
                          QuizData.questionsMap.entries.length - 1) {
                        setState(() {
                          ++widget.quizData.index;
                        });
                      }
                    },
              child: widget.quizData.index ==
                      QuizData.questionsMap.entries.length - 1
                  ? const Text('Submit')
                  : const Text('Next Question'))
        ],
      )),
    );
  }
}
