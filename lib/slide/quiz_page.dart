// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_to/animated_to.dart';
import 'package:flutter_deck/flutter_deck.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  static FlutterDeckSlideWidget get slide => const QuizPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/quiz'),
  );

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedTo.spring(
              globalKey: const GlobalObjectKey('render-object'),
              slidingFrom: const Offset(0, 600),
              child: Text(
                'QUIZ',
                style: FlutterDeckTheme.of(context).textTheme.title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
