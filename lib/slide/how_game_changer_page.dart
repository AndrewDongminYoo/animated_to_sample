// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_to/animated_to.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class HowGameChangerPage extends StatelessWidget {
  const HowGameChangerPage({super.key});

  static FlutterDeckSlideWidget get slide => const HowGameChangerPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/how-game-changer'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'animated_to is...',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            const Gap(60),
            AnimatedTo.spring(
              globalKey: const GlobalObjectKey('handy'),
              slidingFrom: const Offset(0, 200),
              child: const _Item(
                title: 'Handy',
                description: 'Wrap, rebuild, then animate!',
              ),
            ),
            const Gap(32),
            AnimatedTo.spring(
              globalKey: const GlobalObjectKey('smooth'),
              slidingFrom: const Offset(0, 400),
              child: const _Item(
                title: 'Implicit',
                description: 'No need to calculate / operate animations manually!',
              ),
            ),
            const Gap(32),
            AnimatedTo.spring(
              globalKey: const GlobalObjectKey('combinable'),
              slidingFrom: const Offset(0, 600),
              child: const _Item(
                title: 'Just a widget, so powerful',
                description: 'AnimatedTo can collaborate with whatever widgets you like!',
              ),
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
