// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_to/animated_to.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

// 🌎 Project imports:
import 'package:flutter_alliance_2025/widget/code_container.dart';

class TwoApproachesPage extends StatefulWidget {
  const TwoApproachesPage({super.key});

  static FlutterDeckSlideWidget get slide => const TwoApproachesPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/two-approaches'),
  );

  @override
  State<TwoApproachesPage> createState() => _TwoApproachesPageState();
}

class _TwoApproachesPageState extends State<TwoApproachesPage> with TickerProviderStateMixin {
  double _offsetY = 0;
  bool _isExplicit = true;
  bool _isGapExpanded = false;

  late final AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(
          duration: const Duration(milliseconds: 460),
          vsync: this,
          upperBound: 460,
        )..addListener(() {
          setState(() {
            _offsetY = _animationController.value;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  setState(() => _isExplicit = !_isExplicit);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Gap(100),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 460),
                      curve: Curves.easeIn,
                      height: _isGapExpanded ? 460 : 0,
                      child: SizedBox(height: _isGapExpanded ? 0 : _offsetY),
                    ),
                    Gap(_isGapExpanded ? 0 : _offsetY),
                    Text(
                      'AnimatedTo Changes\nYour Moving Animations\nbut How?',
                      style: FlutterDeckTheme.of(context).textTheme.title,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(child: Container()),
                  Positioned(
                    top: _isExplicit ? 0 : null,
                    bottom: _isExplicit ? null : 0,
                    left: 0,
                    right: 0,
                    child: AnimatedTo.spring(
                      globalKey: const GlobalObjectKey('code'),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _CodeExplicit(
                            offsetY: _offsetY,
                            onTap: () async {
                              if (_offsetY == 0) {
                                await _animationController.forward();
                              } else {
                                await _animationController.reverse();
                              }
                            },
                          ),
                          const Gap(40),
                          _CodeImplicit(
                            isBottom: _isGapExpanded,
                            onTap: () {
                              setState(() => _isGapExpanded = !_isGapExpanded);
                            },
                          ),
                          const Gap(200),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _code1 = '''


@override
void initState() {
  super.initState();
''';

const _code2 = '''
  _animationController = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  );
''';

const _code3 = '''
}
...
''';

const _code4 = '''
onTap: () => _controller.forward(),
''';

const _code5 = '''
...
Column(
  children: [
''';

const _code6 = '    Gap(_controller.value),';
const _code7 = "\n    Text('AnimatedTo Changes Your Moving Animations'),";

class _CodeExplicit extends StatefulWidget {
  const _CodeExplicit({required this.offsetY, required this.onTap});

  final double offsetY;
  final VoidCallback onTap;

  @override
  State<_CodeExplicit> createState() => _CodeExplicitState();
}

class _CodeExplicitState extends State<_CodeExplicit> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      child: CodeContainer(
        isPressed: _isPressed,
        child: Text.rich(
          TextSpan(
            style: FlutterDeckTheme.of(context).textTheme.bodyMedium,
            children: [
              const TextSpan(
                text: 'late final AnimationController _controller;',
                style: TextStyle(color: Colors.orangeAccent),
              ),
              const TextSpan(text: _code1),
              const TextSpan(
                text: _code2,
                style: TextStyle(color: Colors.orangeAccent),
              ),
              const TextSpan(text: _code3),
              TextSpan(
                text: _code4,
                style: TextStyle(
                  color: _isPressed ? Colors.orange.shade900 : Colors.orangeAccent,
                ),
              ),
              const TextSpan(text: _code5),
              const TextSpan(
                text: _code6,
                style: TextStyle(color: Colors.orangeAccent),
              ),
              TextSpan(text: ' // -> ${widget.offsetY.toInt()}'),
              const TextSpan(text: _code7),
            ],
          ),
        ),
      ),
    );
  }
}

const _code11 = '''
AnimatedContainer(
  duration: const Duration(milliseconds: 1000),
  curve: Curves.easeIn,
  height: ''';

const _code12 = '_isBottom';
const _code13 = ' ? ';
const _code14 = '460';
const _code15 = ' : ';
const _code16 = '0';
const _code17 = '''
);
''';

const _code18 = '''

...

onTap: () {
''';

const _code19 = '''
  setState(() => _isBottom = !_isBottom);
''';

const _code20 = '''
}
''';

class _CodeImplicit extends StatefulWidget {
  const _CodeImplicit({required this.onTap, required this.isBottom});
  final VoidCallback onTap;
  final bool isBottom;

  @override
  State<_CodeImplicit> createState() => _CodeImplicitState();
}

class _CodeImplicitState extends State<_CodeImplicit> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      child: CodeContainer(
        isPressed: _isPressed,
        child: Text.rich(
          TextSpan(
            style: FlutterDeckTheme.of(context).textTheme.bodyMedium,
            children: [
              const TextSpan(
                text: _code11,
                style: TextStyle(color: Colors.orangeAccent),
              ),
              TextSpan(
                text: _code12,
                style: TextStyle(color: widget.isBottom ? Colors.orangeAccent : null),
              ),
              const TextSpan(text: _code13),
              TextSpan(
                text: _code14,
                style: TextStyle(color: widget.isBottom ? Colors.orangeAccent : null),
              ),
              const TextSpan(text: _code15),
              TextSpan(
                text: _code16,
                style: TextStyle(color: widget.isBottom ? null : Colors.orangeAccent),
              ),
              const TextSpan(text: _code17),
              const TextSpan(text: _code18),
              TextSpan(
                text: _code19,
                style: TextStyle(
                  color: _isPressed ? Colors.orange.shade900 : Colors.orangeAccent,
                ),
              ),
              const TextSpan(text: _code20),
            ],
          ),
        ),
      ),
    );
  }
}
