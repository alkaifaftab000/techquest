import 'package:flutter/material.dart';
import 'package:techquest/model/difficulty/difficulty_model.dart';

class CodeDetailCategory extends CategoryBase {
  CodeDetailCategory({
    required super.name,
    required super.color,
    required super.difficulty,
    required super.totalTime,
    required super.totalQuestion,
    required super.iconColor,
    required super.url,
    required super.description,
    required super.prequisite,
  });

  static final List<CodeDetailCategory> codeCategoryModel = [
    CodeDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'Code',
      iconColor: Colors.orange,
      color: Colors.orange.shade50,
      url: 'https://tint.creativemarket.com/IBTkG0wxW_zuju_vFrrtOt1H-qOcfB6Lh_6J-f0EgHA/width:3005/height:2000/gravity:nowe/rt:fill-down/el:1/czM6Ly9maWxlcy5jcmVhdGl2ZW1hcmtldC5jb20vaW1hZ2VzL3NjcmVlbnNob3RzL3Byb2R1Y3RzLzc1OS83NTk5Lzc1OTkzODAvcHJvZ3JhbW1pbmctbGluZS1hcnQtYmFubmVyLTAxLW8uanBn?1579167779',
      description: 'Introduction to coding fundamentals and syntax.',
      prequisite: ['Logic', 'Syntax'],
    ),
    CodeDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '20',
      totalTime: '20 min',
      name: 'Code',
      iconColor: Colors.orange,
      color: Colors.orange.shade50,
      url: 'https://static.vecteezy.com/system/resources/previews/000/558/301/original/programming-flat-line-banner-and-landing-page-illustration-for-website-development-vector.jpg',
      description: 'Understand basic programming concepts and structures.',
      prequisite: ['Logic', 'Variables'],
    ),
    CodeDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '30',
      totalTime: '30 min',
      name: 'Code',
      iconColor: Colors.orange,
      color: Colors.orange.shade50,
      url: 'https://files.codingninjas.in/article_images/what-is-an-object-in-object-oriented-programming-oops-0-1675157293.jpg',
      description: 'Explore object-oriented programming principles.',
      prequisite: ['Logic', 'Objects'],
    ),
    CodeDetailCategory(
      difficulty: 'Medium',
      totalQuestion: '20',
      totalTime: '10 min',
      name: 'Code',
      iconColor: Colors.orange,
      color: Colors.orange.shade50,
      url: 'https://i.pinimg.com/originals/c3/25/a9/c325a9864ac85b03dd5830347109c787.jpg',
      description: 'Delve into more advanced coding techniques and algorithms.',
      prequisite: ['Logic', 'Algorithms'],
    ),
    CodeDetailCategory(
      difficulty: 'Hard',
      totalQuestion: '30',
      totalTime: '10 min',
      name: 'Code',
      iconColor: Colors.orange,
      color: Colors.orange.shade50,
      url: 'https://img.freepik.com/free-vector/flat-design-api-infographic_23-2149364435.jpg?size=626&ext=jpg',
      description: 'Learn about APIs and complex coding structures.',
      prequisite: ['Logic', 'APIs'],
    ),
  ];
}
