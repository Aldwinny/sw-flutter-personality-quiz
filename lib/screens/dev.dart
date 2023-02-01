import 'package:flutter/material.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 25),
          child: const CircleAvatar(
            radius: 70.0,
            backgroundImage: AssetImage('images/alds.jpg'),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: const Text(
            'Hello, I\'m Aldwin Dennis L. Reyes!\nand this is my Personality Quiz Application.\n\nSubmitted for ITE 013 - Application Development and Emerging Technologies.',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ));
  }
}
