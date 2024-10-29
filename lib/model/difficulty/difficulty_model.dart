import 'package:flutter/material.dart';

class CategoryBase {
  final String name;
  final Color color;
  final Color iconColor;
  final String url;
  final String difficulty;
  final String totalTime;
  final String totalQuestion;
  final String description;
  final List<String> prequisite;

  CategoryBase({
    required this.name,
    required this.color,
    required this.iconColor,
    required this.url,
    required this.difficulty,
    required this.totalTime,
    required this.totalQuestion,
    required this.description,
    required this.prequisite
  });
}

