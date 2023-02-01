import 'package:flutter/material.dart';
import 'package:personality_quiz/models/quizdata.dart';

class Result extends StatefulWidget {
  const Result({super.key, required this.quizData});

  final QuizData quizData;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String introverted = '';
  String tip = '';

  @override
  void initState() {
    super.initState();
    widget.quizData.compute();

    if (widget.quizData.introverted > 0) {
      introverted = 'An Introvert!';
      tip =
          'You mostly enjoy not having that much people with you. You get energized on tasks that are typically done on your own. (You do not necessarily hate people but if you can do an activity alone, you would probably enjoy it more.)';
    } else if (widget.quizData.introverted < 0) {
      introverted = 'An Extrovert!';
      tip =
          'You are an outgoing person! Not all extroverts are social butterfly but they know very well how to talk to people. You enjoy company, and you get energized when you are with people. (You enjoy most activities as long as you have someone to share your stories with)';
    } else {
      introverted = 'An Ambivert!';
      tip =
          'A rare breed indeed. You are a blend of introvert & extrovert, and you do not really mind being with people or not. (It may depend on your mood but you get energized when doing activities either alone or with others.)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Back'),
            leading: BackButton(onPressed: () {
              widget.quizData.reset();
              Navigator.pop(context);
            })),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Based on the questions asked you are..',
              style: TextStyle(fontSize: 16),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                introverted,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                tip,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            )
          ],
        )));
  }
}
