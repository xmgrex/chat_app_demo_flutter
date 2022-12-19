import 'package:flutter/material.dart';

class StackPage {
  const StackPage({
    required this.page,
    required this.selectedIcon,
    required this.unSelectedIcon,
  });
  final Widget page;
  final IconData selectedIcon;
  final IconData unSelectedIcon;
}
