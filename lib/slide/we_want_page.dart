// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class WeWantPage extends StatelessWidget {
  const WeWantPage({super.key});

  static FlutterDeckSlideWidget get slide => const WeWantPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/we-want'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            spacing: 32,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We may want:',
                style: FlutterDeckTheme.of(context).textTheme.title,
              ),
              const Gap(32),
              Text(
                '✅ animation without layout calculation',
                style: FlutterDeckTheme.of(context).textTheme.subtitle,
              ),
              Text(
                '✅ animation without extra tricky widgets',
                style: FlutterDeckTheme.of(context).textTheme.subtitle,
              ),
              Text(
                '✅ rebuild then animate!',
                style: FlutterDeckTheme.of(context).textTheme.subtitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
