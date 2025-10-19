// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_to/animated_to.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:springster/springster.dart';

class HotToCustomizePage extends StatefulWidget {
  const HotToCustomizePage({super.key});

  static FlutterDeckSlideWidget get slide => const HotToCustomizePage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/how-to-customize'),
  );

  @override
  State<HotToCustomizePage> createState() => _HotToCustomizePageState();
}

class _HotToCustomizePageState extends State<HotToCustomizePage> {
  int _step = 0;
  bool get _isCollapsed => _step > 3;

  final _bgColor = const Color(0xfffffafa);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() => _step++);
      },
      child: Scaffold(
        backgroundColor: _bgColor,
        body: Column(
          children: [
            Text(
              'How to customize?',
              style: FlutterDeckTheme.of(context).textTheme.title.copyWith(color: Colors.black),
            ),
            Expanded(
              child: Stack(
                children: [
                  const SizedBox(width: double.infinity),
                  if (_step > 0)
                    Positioned(
                      left: _isCollapsed ? -300 : 100,
                      top: _isCollapsed ? -1000 : 50,
                      child: AnimatedTo.spring(
                        globalKey: const GlobalObjectKey('custom-render-object'),
                        appearingFrom: const Offset(-300, -200),
                        velocityBuilder: () => const Offset(5000, 0),
                        description: Spring.bouncy,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: _bgColor, width: 4),
                          ),
                          child: Image.asset(
                            'assets/custom_render_object.png',
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  if (_step > 1)
                    Positioned(
                      left: _isCollapsed ? 2000 : 350,
                      top: _isCollapsed ? 100 : 200,
                      child: AnimatedTo.spring(
                        globalKey: const GlobalObjectKey('custom-render-object-widget'),
                        appearingFrom: const Offset(600, 1000),
                        velocityBuilder: () => const Offset(3000, 0),
                        description: Spring.bouncy,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: _bgColor, width: 4),
                          ),
                          child: Image.asset(
                            'assets/custom_render_object_widget.png',
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  if (_step > 2)
                    Positioned(
                      left: _isCollapsed ? -1000 : 700,
                      top: _isCollapsed ? 2000 : 500,
                      child: AnimatedTo.spring(
                        globalKey: const GlobalObjectKey('custom-render-object-usage'),
                        appearingFrom: const Offset(2000, -300),
                        velocityBuilder: () => const Offset(-5000, 0),
                        description: Spring.bouncy,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: Border.all(color: _bgColor, width: 4),
                          ),
                          child: Image.asset(
                            'assets/custom_render_object_usage.png',
                            height: 250,
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
    );
  }
}

class CustomRenderObject extends RenderBox {
  @override
  void performLayout() {
    // some customized layout operation
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // some customized paint operation
  }
}

class CustomRenderObjectWidget extends SingleChildRenderObjectWidget {
  const CustomRenderObjectWidget({super.key, super.child});

  @override
  RenderObject createRenderObject(BuildContext context) {
    // return my customized render object
    return CustomRenderObject();
  }

  @override
  void updateRenderObject(BuildContext context, RenderObject renderObject) {
    // update my customized render object
  }
}
