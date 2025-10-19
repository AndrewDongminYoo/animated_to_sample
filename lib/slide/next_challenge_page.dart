// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class NextChallengePage extends StatelessWidget {
  const NextChallengePage({super.key});

  static FlutterDeckSlideWidget get slide => const NextChallengePage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/next-challenge'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '🔥 Next challenges of animated_to',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            const Gap(60),
            const _Item(
              title: 'Sliver',
              description: 'Sliver works based completely on different rules.',
            ),
            const Gap(32),
            const _Item(
              title: 'Nested',
              description: 'Once AnimatedTo nests, conflicts each other...',
            ),
            const Gap(32),
            const _Item(
              title: 'Hit Test',
              description: "Widgets look animating, but gestures don't.",
            ),
            const Gap(32),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: FlutterDeckTheme.of(context).textTheme.subtitle),
        const Gap(8),
        Text(
          description,
          style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
