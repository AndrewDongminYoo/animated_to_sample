// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_to/animated_to.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class CustomizeRenderObjectPage extends StatefulWidget {
  const CustomizeRenderObjectPage({super.key});

  static FlutterDeckSlideWidget get slide => const CustomizeRenderObjectPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/customize-renderobject'),
  );

  @override
  State<CustomizeRenderObjectPage> createState() => _CustomizeRenderObjectPageState();
}

class _CustomizeRenderObjectPageState extends State<CustomizeRenderObjectPage> {
  int _step = 0;

  void _incrementStep() {
    setState(() {
      _step++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _incrementStep,
        child: SizedBox(
          height: double.infinity,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 40,
              children: [
                const _WidgetTree(),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 32),
                      child: Icon(Icons.arrow_forward, size: 100),
                    ),
                    Gap(40),
                    _ElementTree(),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Icon(Icons.arrow_forward, size: 100),
                        ),
                        const Gap(40),
                        _RenderObjectTree(customized: _step >= 1),
                      ],
                    ),
                    Positioned(
                      bottom: -50,
                      right: -50,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: _step >= 1 ? 1.0 : 0.0,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 380,
                            width: 280,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              color: Colors.green.shade200,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: Column(
                                spacing: 40,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Layout',
                                    style: FlutterDeckTheme.of(context).textTheme.subtitle.copyWith(),
                                  ),
                                  const Icon(Icons.arrow_downward, size: 60),
                                  if (_step >= 1)
                                    Text(
                                      'Animation',
                                      style: FlutterDeckTheme.of(context).textTheme.subtitle.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green.shade800,
                                      ),
                                    )
                                  else
                                    Text(
                                      'Paint',
                                      style: FlutterDeckTheme.of(context).textTheme.subtitle,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 32),
                            child: Icon(Icons.arrow_forward, size: 100),
                          ),
                        ),
                        const Gap(40),
                        SizedBox(
                          height: 300,
                          child: Align(
                            alignment: _step >= 2 && _step.isEven ? Alignment.topCenter : Alignment.bottomCenter,
                            child: AnimatedTo.spring(
                              globalKey: const GlobalObjectKey('cube-animation'),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.amber[400]!,
                                      Colors.orange[500]!,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.amber[600]!,
                                    width: 2,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.amber.withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WidgetTree extends StatelessWidget {
  const _WidgetTree();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Widget', style: FlutterDeckTheme.of(context).textTheme.bodyLarge),
        const Gap(8),
        const _WidgetFigure(),
        const AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: 0,
          child: _Connector(),
        ),
        const _WidgetFigure(),
        const AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: 0,
          child: _Connector(),
        ),
        const _WidgetFigure(),
      ],
    );
  }
}

class _ElementTree extends StatelessWidget {
  const _ElementTree();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Element',
          style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
        ),
        const Gap(8),
        const _ElementFigure(),
        const _Connector(),
        const _ElementFigure(),
        const _Connector(),
        const _ElementFigure(),
      ],
    );
  }
}

class _RenderObjectTree extends StatelessWidget {
  const _RenderObjectTree({required this.customized});

  final bool customized;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!customized)
          Text(
            'RenderObject',
            style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
          )
        else
          Text(
            'Customized\nRenderObject',
            style: FlutterDeckTheme.of(context).textTheme.bodyLarge.copyWith(color: Colors.greenAccent),
          ),
        Gap(customized ? 162 : 208),
        const _RenderObjectFigure(),
        const _Connector(),
        const _RenderObjectFigure(),
      ],
    );
  }
}

class _WidgetFigure extends StatelessWidget {
  const _WidgetFigure();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade100,
        border: Border.all(color: Colors.red.shade900, width: 2),
      ),
      width: 200,
      height: 100,
    );
  }
}

class _ElementFigure extends StatelessWidget {
  const _ElementFigure();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        border: Border.all(color: Colors.orange.shade900, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 200,
      height: 100,
    );
  }
}

class _RenderObjectFigure extends StatelessWidget {
  const _RenderObjectFigure();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        border: Border.all(color: Colors.blue.shade900, width: 2),
        borderRadius: BorderRadius.circular(100),
      ),
      width: 200,
      height: 100,
    );
  }
}

class _Connector extends StatelessWidget {
  const _Connector();

  @override
  Widget build(BuildContext context) {
    return Container(width: 2, height: 100, color: Colors.white);
  }
}
