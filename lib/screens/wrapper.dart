import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:personality_quiz/models/quizdata.dart';
import 'package:personality_quiz/screens/dev.dart';
import 'package:personality_quiz/screens/quiz.dart';
import 'package:personality_quiz/screens/result.dart';
import 'package:personality_quiz/screens/title.dart';

class QuizWrapper extends StatefulWidget {
  const QuizWrapper({super.key});

  @override
  State<QuizWrapper> createState() => QuizWrapperState();
}

class QuizWrapperState extends State<QuizWrapper> {
  bool appbarExists = true;
  bool isResult = false;
  int screen = 0;

  QuizData quizData = QuizData();

  List<int> history = [];

  void toggleResult(bool value) {
    setState(() {
      isResult = value;
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (isResult) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Result(quizData: quizData)));
      }
    });
  }

  Widget _getScreen(int index) {
    switch (index) {
      case 0:
        return TitleScreen(
          startCallback: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Quiz(
                  quizData: quizData,
                  endCallback: toggleResult,
                ),
              ),
            );
          },
          devCallback: () => {
            setState(() {
              history.add(screen);
              screen = 3;
            })
          },
        );
      case 1:
        return Quiz(
          quizData: quizData,
          endCallback: toggleResult,
        );
      case 2:
        return Result(quizData: quizData);
      default:
        return const DevScreen();
    }
  }

  AppBar _getAppbar(int index) {
    switch (index) {
      case 0:
        return AppBar(
          title: const Text('Welcome!'),
        );
      case 1:
        return AppBar(
          title: const Text('Back'),
          leading: BackButton(
            onPressed: () => {setState(() => screen = history.removeLast())},
          ),
        );
      case 2:
        return AppBar(
          title: const Text('Back'),
        );
      default:
        return AppBar(
          title: const Text('Back'),
          leading: BackButton(
            onPressed: () {
              setState(() => screen = history.removeLast());
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarExists ? _getAppbar(screen) : null,
      body: _getScreen(screen),
    );
  }
}
