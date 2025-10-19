// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gap/gap.dart';

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key});

  static FlutterDeckSlideWidget get slide => const ThanksPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/thanks'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Text(
                'Thank you for listening!',
                style: FlutterDeckTheme.of(context).textTheme.title,
              ),
              const Gap(32),
              Expanded(
                child: Stack(
                  children: [
                    InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: WebUri('https://chooyan-eng.github.io/chooyan_resume/'),
                      ),
                      initialSettings: InAppWebViewSettings(pageZoom: 1.5),
                    ),
                    Positioned(
                      right: 40,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Opacity(
                          opacity: 0.8,
                          child: Image.asset(
                            'assets/resume_qr.png',
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
