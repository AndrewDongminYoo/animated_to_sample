// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_to/animated_to.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gap/gap.dart';

class FrameworkFigurePage extends StatefulWidget {
  const FrameworkFigurePage({super.key});

  static FlutterDeckSlideWidget get slide => const FrameworkFigurePage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/framework-figure'),
  );

  @override
  State<FrameworkFigurePage> createState() => _FrameworkFigurePageState();
}

class _FrameworkFigurePageState extends State<FrameworkFigurePage> {
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
                AnimatedTo.spring(
                  globalKey: const GlobalObjectKey('step0'),
                  slidingFrom: const Offset(0, 100),
                  child: _WidgetTree(visibleConnector: _step < 1),
                ),
                if (_step >= 1)
                  AnimatedTo.spring(
                    globalKey: const GlobalObjectKey('step1'),
                    slidingFrom: const Offset(100, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 32),
                          child: Icon(Icons.arrow_forward, size: 100),
                        ),
                        const Gap(40),
                        GestureDetector(
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (c) => Center(
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 2 / 3,
                                  height: MediaQuery.of(context).size.height * 2 / 3,
                                  child: Stack(
                                    children: [
                                      InAppWebView(
                                        initialUrlRequest: URLRequest(
                                          url: WebUri('https://chooyan.hashnode.dev/all-i-know-about-buildcontext'),
                                        ),
                                        initialSettings: InAppWebViewSettings(pageZoom: 1.5),
                                      ),
                                      Positioned(
                                        right: 20,
                                        top: 20,
                                        child: Opacity(
                                          opacity: 0.8,
                                          child: SizedBox(
                                            width: 200,
                                            height: 200,
                                            child: Image.asset('assets/article_qrcode.png'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: const _ElementTree(),
                        ),
                      ],
                    ),
                  ),
                if (_step >= 2)
                  AnimatedTo.spring(
                    globalKey: const GlobalObjectKey('step2'),
                    slidingFrom: const Offset(100, 0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 32),
                              child: Icon(Icons.arrow_forward, size: 100),
                            ),
                            Gap(40),
                            _RenderObjectTree(),
                          ],
                        ),
                        Positioned(
                          bottom: -50,
                          right: -50,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: _step >= 3 ? 1.0 : 0.0,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                height: 380,
                                width: 280,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  color: Colors.blue,
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
                                      const Icon(
                                        Icons.arrow_downward,
                                        size: 60,
                                      ),
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
                  ),
                if (_step >= 4)
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: AnimatedTo.spring(
                      globalKey: const GlobalObjectKey('step4'),
                      slidingFrom: const Offset(100, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 32),
                            child: Icon(Icons.arrow_forward, size: 100),
                          ),
                          const Gap(40),
                          Container(
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
  const _WidgetTree({required this.visibleConnector});

  final bool visibleConnector;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Widget', style: FlutterDeckTheme.of(context).textTheme.bodyLarge),
        const Gap(8),
        const _WidgetFigure(),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: visibleConnector ? 1.0 : 0.0,
          child: const _Connector(),
        ),
        const _WidgetFigure(),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: visibleConnector ? 1.0 : 0.0,
          child: const _Connector(),
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
  const _RenderObjectTree();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'RenderObject',
          style: FlutterDeckTheme.of(context).textTheme.bodyLarge,
        ),
        const Gap(208),
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
