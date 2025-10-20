// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class HeightQuizPage extends StatefulWidget {
  const HeightQuizPage({super.key});

  static FlutterDeckSlideWidget get slide => const HeightQuizPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/height-quiz'),
  );

  @override
  State<HeightQuizPage> createState() => _HeightQuizPageState();
}

class _HeightQuizPageState extends State<HeightQuizPage> {
  final _heightController = TextEditingController();
  double _height = 0;

  int _step = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() => _step++);
        },
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(120),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 160,
                    child: TextField(
                      controller: _heightController,
                      keyboardType: const TextInputType.numberWithOptions(signed: true, decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[\d\.-]+'))],
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        fillColor: Colors.grey.shade900,
                      ),
                      style: FlutterDeckTheme.of(context).textTheme.subtitle,
                    ),
                  ),
                  const Gap(32),
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: FilledButton(
                      onPressed: () {
                        setState(() {
                          _height = double.parse(_heightController.text);
                        });
                      },
                      child: const Text('GO!'),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 160,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        opacity: _step > 1 ? 1 : 0,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 10,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width: 10,
                                    height: 220,
                                    color: Colors.grey,
                                  ),
                                  Container(
                                    width: 60,
                                    height: 10,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              const Gap(40),
                              const Icon(
                                Icons.question_mark,
                                size: 60,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 0,
                      right: 0,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        opacity: _step > 0 ? 1 : 0,
                        child: Center(
                          child: Column(
                            children: [
                              const Gap(240),
                              Text(
                                'AnimatedTo Changes Your Moving Animations, but How?',
                                style: FlutterDeckTheme.of(
                                  context,
                                ).textTheme.title.copyWith(color: Colors.grey.shade800),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Gap(60),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          height: _height,
                        ),
                        Text(
                          'AnimatedTo Changes Your Moving Animations, but How?',
                          style: FlutterDeckTheme.of(context).textTheme.title,
                        ),
                      ],
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
