// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:animated_to/animated_to.dart';
import 'package:flutter_deck/flutter_deck.dart';

class DraggableDemoPage extends StatefulWidget {
  const DraggableDemoPage({super.key});

  static FlutterDeckSlideWidget get slide => const DraggableDemoPage().withSlideConfiguration(
    const FlutterDeckSlideConfiguration(route: '/draggable-demo'),
  );

  @override
  State<DraggableDemoPage> createState() => _DraggableDemoPageState();
}

class _Item {
  _Item({required this.id, required this.color});
  final String id;
  final Color color;
}

class _DraggableDemoPageState extends State<DraggableDemoPage> {
  final List<_Item> _cubes = List.generate(
    40,
    (index) => _Item(
      id: index.toString(),
      color: Colors.primaries[index % Colors.primaries.length],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 220),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: _cubes.map((_Item e) {
              return _Cube(
                item: e,
                onAccept: (_Item data) {
                  final targetIndex = _cubes.indexOf(e);
                  final draggingIndex = _cubes.indexOf(data);
                  setState(() {
                    final temp = _cubes[targetIndex];
                    _cubes[targetIndex] = _cubes[draggingIndex];
                    _cubes[draggingIndex] = temp;
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _Cube extends StatelessWidget {
  const _Cube({required this.item, required this.onAccept});

  final _Item item;
  final ValueSetter<_Item> onAccept;

  @override
  Widget build(BuildContext context) {
    return AnimatedTo.curve(
      globalKey: GlobalObjectKey(item.id),
      child: DragTarget(
        onWillAcceptWithDetails: (DragTargetDetails<Object?> details) {
          if (details.data == item) {
            return false;
          }
          onAccept(details.data! as _Item);
          return true;
        },
        builder: (context, List<Object?> candidateData, _) {
          return Draggable(
            feedback: _CubeFace(color: item.color),
            childWhenDragging: const _CubeFace(color: Colors.transparent),
            data: item,
            child: _CubeFace(color: item.color),
          );
        },
      ),
    );
  }
}

class _CubeFace extends StatelessWidget {
  const _CubeFace({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
