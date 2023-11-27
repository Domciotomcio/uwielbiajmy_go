import 'package:flutter/material.dart';

class Destination {
  final IconData selectedIcon;
  final IconData icon;
  final String label;

  final String title;
  final Widget page;
  final Widget? floatingActionButton;

  final String imagePath;

  Destination({
    required this.selectedIcon,
    required this.icon,
    required this.label,
    required this.page,
    required this.title,
    this.floatingActionButton,
    this.imagePath = 'assets/images/ukulele.jpg',
  });
}
