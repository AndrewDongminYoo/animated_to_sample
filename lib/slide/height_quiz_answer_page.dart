// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

// 🌎 Project imports:
import 'package:flutter_alliance_2025/widget/code_container.dart';

class HeightQuizAnswerPage extends StatefulWidget {
  const HeightQuizAnswerPage({super.key});

  static FlutterDeckSlideWidget get slide => const HeightQuizAnswerPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/height-quiz-answer'),
  );

  @override
  State<HeightQuizAnswerPage> createState() => _HeightQuizAnswerPageState();
}

class _HeightQuizAnswerPageState extends State<HeightQuizAnswerPage> {
  final GlobalObjectKey<State<StatefulWidget>> _targetKey = const GlobalObjectKey('target');

  final _heightController = TextEditingController();
  double _height = 0;
  double _startY = 0;
  Offset _codeOffset = const Offset(1200, 300);
  bool _showHint = true;

  void _detectOffset() {
    final renderObject = _targetKey.currentContext!.findRenderObject()! as RenderBox;
    final position = renderObject.localToGlobal(Offset.zero);
    _heightController.text = (position.dy - _startY).toString();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final renderObject = _targetKey.currentContext!.findRenderObject()! as RenderBox;
      final position = renderObject.localToGlobal(Offset.zero);
      _startY = position.dy;
    });

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
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
                        top: 200,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Column(
                            children: [
                              const Gap(240),
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                                opacity: _showHint ? 1 : 0,
                                child: Text(
                                  'AnimatedTo Changes Your Moving Animations, but How?',
                                  style: FlutterDeckTheme.of(
                                    context,
                                  ).textTheme.title.copyWith(color: Colors.grey.shade800),
                                ),
                              ),
                            ],
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
                          RepaintBoundary(
                            key: _targetKey,
                            child: Text(
                              'AnimatedTo Changes Your Moving Animations, but How?',
                              style: FlutterDeckTheme.of(context).textTheme.title,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: _codeOffset.dy,
            left: _codeOffset.dx,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _showHint = false;
                  _codeOffset = Offset(
                    _codeOffset.dx + details.delta.dx,
                    _codeOffset.dy + details.delta.dy,
                  );
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: SizedBox(
                  width: 1000,
                  child: _RenderObjectCode(onTap: _detectOffset),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _code1 = '''
final context = _targetKey.currentContext;
final renderObject = context?''';

const _code2 = '.findRenderObject();';
const _code3 = '''

final position = renderObject''';

const _code4 = '.localToGlobal(Offset.zero);';
const _code5 = '''

final height = ''';

const _code6 = 'position.dy;';

const _code10 = ' <- Yeah!!';

class _RenderObjectCode extends StatefulWidget {
  const _RenderObjectCode({required this.onTap});
  final VoidCallback onTap;

  @override
  State<_RenderObjectCode> createState() => _RenderObjectCodeState();
}

class _RenderObjectCodeState extends State<_RenderObjectCode> {
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
      onTapCancel: () => setState(() => _isPressed = false),
      child: CodeContainer(
        isPressed: _isPressed,
        child: Text.rich(
          TextSpan(
            style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
            children: const [
              TextSpan(text: _code1),
              TextSpan(
                text: _code2,
                style: TextStyle(color: Colors.orangeAccent),
              ),
              TextSpan(text: _code3),
              TextSpan(
                text: _code4,
                style: TextStyle(color: Colors.orangeAccent),
              ),
              TextSpan(text: _code5),
              TextSpan(
                text: _code6,
                style: TextStyle(color: Colors.orangeAccent),
              ),
              TextSpan(
                text: _code10,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
