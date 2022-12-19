import 'package:flutter/material.dart';

Widget Function(
  BuildContext context,
  int index,
  Animation<double> animation,
) animationItemBuilder(
  Widget Function(int index) child, {
  EdgeInsets padding = EdgeInsets.zero,
}) {
  return (BuildContext context, int index, Animation<double> animation) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: .94,
          end: 1,
        ).animate(animation),
        child: Padding(
          padding: padding,
          child: child(index),
        ),
      ),
    );
  };
}
