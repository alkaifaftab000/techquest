import 'package:flutter/material.dart';

class DifficultyLevel {
  final String name;
  final Icon icon;
  final Color color;

  DifficultyLevel(
      {required this.name, required this.icon, required this.color});

  static final List<DifficultyLevel> level = [
    DifficultyLevel(
        name: 'Easy',
        icon: const Icon(Icons.thumb_up_alt_rounded, color: Colors.green),
        color: Colors.lightGreenAccent.shade100),
    DifficultyLevel(
        name: 'Medium',
        icon: const Icon(Icons.lightbulb_rounded, color: Colors.blue),
        color: Colors.lightBlue.shade100),
    DifficultyLevel(
        name: 'Hard',
        icon: const Icon(Icons.warning_rounded, color: Colors.red),
        color: Colors.red.shade100),
  ];
}
