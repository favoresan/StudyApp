import 'package:flutter/material.dart';

class CircleBtn extends StatelessWidget {
  const CircleBtn(
      {Key? key,
      required this.child,
      this.width = 60,
      this.function,
      this.color})
      : super(key: key);
  final Widget child;
  final double width;
  final VoidCallback? function;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      clipBehavior: Clip.hardEdge,
      shape: const CircleBorder(),
      child: InkWell(onTap: function, child: child),
    );
  }
}
