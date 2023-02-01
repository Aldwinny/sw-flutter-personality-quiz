import 'package:flutter/material.dart';

class TitleScreen extends StatelessWidget {
  TitleScreen(
      {super.key, required this.startCallback, required this.devCallback});

  final void Function() startCallback;
  final void Function() devCallback;
  final ButtonStyle elevatedBtnPadding = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 14));
  final EdgeInsets paddingBottom = const EdgeInsets.only(bottom: 30);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Image(image: AssetImage('images/wiz.png')),
          Container(
            margin: paddingBottom,
            child: const Text(
              'Personality Quiz',
              style: TextStyle(fontSize: 45, fontFamily: 'IndieFlower'),
            ),
          ),
          Container(
            margin: paddingBottom,
            child: ElevatedButton(
              onPressed: startCallback,
              style: elevatedBtnPadding,
              child: const Text(
                'Start!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: devCallback,
            style: elevatedBtnPadding,
            child: const Text('About the dev'),
          )
        ],
      ),
    );
  }
}
