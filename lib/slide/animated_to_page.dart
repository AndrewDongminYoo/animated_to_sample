// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_to/animated_to.dart';
import 'package:flutter_deck/flutter_deck.dart';

class AnimatedToPage extends StatefulWidget {
  const AnimatedToPage({super.key});

  static FlutterDeckSlideWidget get slide => const AnimatedToPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/animated-to'),
  );

  @override
  State<AnimatedToPage> createState() => _AnimatedToPageState();
}

class _AnimatedToPageState extends State<AnimatedToPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Stack(
              children: [
                AnimatedTo.spring(
                  globalKey: const GlobalObjectKey('container'),
                  slidingFrom: const Offset(1000, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      border: Border.fromBorderSide(BorderSide(width: 2)),
                    ),
                    height: 120,
                    width: MediaQuery.of(context).size.width * 2 / 3,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: AnimatedTo.spring(
                      globalKey: const GlobalObjectKey('text'),
                      slidingFrom: const Offset(3000, 0),
                      child: Text(
                        'animated_to',
                        style: FlutterDeckTheme.of(context).textTheme.title.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
