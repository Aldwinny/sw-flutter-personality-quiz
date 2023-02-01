class QuizData {
  static final questionsMap = {
    'Its your freetime! What do you like spending it on?': [
      {'Hang out with friends': -3},
      {'Having fun with hobbies at home': 2},
      {'Studying/Working': 1},
      {'Go on a date': -1}
    ],
    'On a beach vacation with your parents/relatives, what activity would you often spend time the most?':
        [
      {'Talk with my relatives about stuff': -3},
      {'Ask my relatives to swim together': -3},
      {'Travel around on my own and maybe snap some photos': 3},
      {'Ask someone close to travel with me': -2}
    ],
    'Given the following choices, which suites you the most?': [
      {'Drinking with friends': -3},
      {'Going to concerts/parties': -2},
      {'Walking the dog': 1},
      {'Reading Books/Slacking at home': 2},
      {'Camping/Traveling alone': 3}
    ],
    'In work/study, when are you most productive?': [
      {'When working with coworkers/other students': -2},
      {'When working with friends': -1},
      {'When working on my own': 2},
      {'Just finishing the day is enough..': 1},
    ],
    'How do you regain energy after a tiring day at school/work?': [
      {'I chat with my friends and ask them what\'s up': -2},
      {'I just lie on the bed or couch': 2},
    ]
  };

  List<int> answersMap = [];

  int index = 0;
  int introverted = 0;

  bool compute() {
    if (answersMap.length == questionsMap.entries.length) {
      for (int i = 0; i < answersMap.length; i++) {
        introverted += QuizData.questionsMap.entries
            .elementAt(i)
            .value
            .elementAt(answersMap[i])
            .values
            .first;
      }
      return true;
    }
    return false;
  }

  void reset() {
    index = 0;
    introverted = 0;
    answersMap.clear();
  }
}
