// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class CodeContainer extends StatelessWidget {
  const CodeContainer({super.key, required this.child, required this.isPressed});

  final Widget child;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
      width: double.infinity,
      decoration: BoxDecoration(
        color: isPressed ? Colors.grey.shade800 : Colors.grey.shade900,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white),
      ),
      padding: const EdgeInsets.all(60),
      child: child,
    );
  }
}
