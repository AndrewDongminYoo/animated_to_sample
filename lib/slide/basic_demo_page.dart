// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BasicDemoPage extends StatelessWidget {
  const BasicDemoPage({super.key});

  static FlutterDeckSlideWidget get slide => const BasicDemoPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/basic-demo'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri('https://dartpad.dev/?id=7864595840215a5876a1fbddcf58d18c'),
            ),
            initialSettings: InAppWebViewSettings(pageZoom: 1.5),
          ),
        ],
      ),
    );
  }
}
