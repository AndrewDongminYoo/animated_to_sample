// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gap/gap.dart';

class WhatIsImplicitPage extends StatelessWidget {
  const WhatIsImplicitPage({super.key});

  static FlutterDeckSlideWidget get slide => const WhatIsImplicitPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/what-is-implicit'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              'What is implicit/explicit animations?',
              style: FlutterDeckTheme.of(context).textTheme.title,
            ),
            const Gap(32),
            Expanded(
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: WebUri('https://docs.flutter.dev/ui/animations'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
