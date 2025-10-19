// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class StrategyPage extends StatefulWidget {
  const StrategyPage({super.key});

  static FlutterDeckSlideWidget get slide => const StrategyPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/strategy'),
  );

  @override
  State<StrategyPage> createState() => _StrategyPageState();
}

class _StrategyPageState extends State<StrategyPage> {
  int _step = 0;
  double _height = 0;
  final GlobalKey<State<StatefulWidget>> _destKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> _startKey = GlobalKey();
  double _destY = 0;
  double _startY = 0;

  void _detectStartOffset() {
    final renderObject = _startKey.currentContext!.findRenderObject()! as RenderBox;
    final position = renderObject.localToGlobal(Offset.zero);
    setState(() => _startY = position.dy);
  }

  void _detectOffset() {
    final renderObject = _destKey.currentContext!.findRenderObject()! as RenderBox;
    final position = renderObject.localToGlobal(Offset.zero);
    setState(() => _destY = position.dy - 6);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() => _step++);
          if (_step == 1) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              _detectStartOffset();
            });
          }
          if (_step == 3) {
            _detectOffset();
          }
          if (_step == 4) {
            setState(() {
              _height = _destY - _startY;
            });
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(12),
              Text(
                'Strategy',
                style: FlutterDeckTheme.of(context).textTheme.title,
              ),
              const Gap(120),
              Expanded(
                child: Stack(
                  children: [
                    if (_step > 1)
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
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Text(
                                      key: _destKey,
                                      'AnimatedTo Changes Your Moving Animations, but How?',
                                      style: FlutterDeckTheme.of(
                                        context,
                                      ).textTheme.title.copyWith(color: Colors.grey.shade800),
                                    ),
                                    if (_step > 2)
                                      Positioned(
                                        top: -10,
                                        left: -20,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                            horizontal: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.deepOrange,
                                            borderRadius: BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            '(0, ${_destY - _startY})',
                                            style: FlutterDeckTheme.of(context).textTheme.bodyMedium,
                                          ),
                                        ),
                                      ),
                                  ],
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
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Text(
                              'AnimatedTo Changes Your Moving Animations, but How?',
                              style: FlutterDeckTheme.of(context).textTheme.title,
                            ),
                            if (_step > 0)
                              Positioned(
                                top: -10,
                                left: -20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    key: _startKey,
                                    '(0, $_height)',
                                    style: FlutterDeckTheme.of(context).textTheme.bodyMedium,
                                  ),
                                ),
                              ),
                          ],
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
