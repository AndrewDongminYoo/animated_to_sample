// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_to/animated_to.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class TitlePage extends StatefulWidget {
  const TitlePage({super.key});

  static FlutterDeckSlideWidget get slide => const TitlePage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/title'),
  );

  @override
  State<TitlePage> createState() => _TitlePageState();
}

class _TitlePageState extends State<TitlePage> {
  int _step = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() => _step++);
        },
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
          color: _step == 0 ? Colors.white : Colors.black,
          child: Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              style: FlutterDeckTheme.of(
                context,
              ).textTheme.title.copyWith(color: _step == 0 ? Colors.black : Colors.white),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_step > 1) ...[
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      opacity: _step >= 3 ? 1 : 0,
                      child: const CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.white,
                        foregroundImage: AssetImage('assets/me_photo.jpg'),
                      ),
                    ),
                    const Gap(120),
                  ],
                  AnimatedTo.curve(
                    duration: const Duration(milliseconds: 1000),
                    globalKey: const GlobalObjectKey('title'),
                    child: const Text('AnimatedTo Changes Your Moving Animations, but How?'),
                    onEnd: (cause) {
                      setState(() => _step += 1);
                    },
                  ),
                  if (_step < 2)
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      opacity: _step == 0 ? 1 : 0,
                      child: Column(
                        children: [
                          const Gap(120),
                          Text(
                            '주조 쓰요시',
                            style: FlutterDeckTheme.of(context).textTheme.bodyLarge.copyWith(color: Colors.black),
                          ),
                          const Gap(16),
                          Text(
                            '프리랜서 플러터 개발자',
                            style: FlutterDeckTheme.of(context).textTheme.bodyMedium.copyWith(color: Colors.black),
                          ),
                          const Gap(32),
                          const CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.white,
                            foregroundImage: AssetImage('assets/me_photo.jpg'),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
