import 'package:flutter/material.dart';
import 'package:techquest/model/difficulty/difficulty_model.dart';

class SqlDetailCategory extends CategoryBase {
  SqlDetailCategory({
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

  static final List<SqlDetailCategory> sqlCategoryModel = [
    SqlDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'SQL',
      iconColor: Colors.green,
      color: Colors.green.shade50,
      url: 'https://img.freepik.com/premium-vector/illustration-database-banner-design-with-iconic-style_7505-576.jpg',
      description: 'Introduction to SQL and databases.',
      prequisite: ['Basic IT'],
    ),
    SqlDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '20',
      totalTime: '20 min',
      name: 'SQL',
      iconColor: Colors.green,
      color: Colors.green.shade50,
      url: 'https://th.bing.com/th/id/OIP.pr7peVz5VVCUeutQKoaknAHaFe?rs=1&pid=ImgDetMain',
      description: 'Learning SQL syntax and queries.',
      prequisite: ['Basic IT', 'Data Management'],
    ),
    SqlDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '30',
      totalTime: '30 min',
      name: 'SQL',
      iconColor: Colors.green,
      color: Colors.green.shade50,
      url: 'https://i.ytimg.com/vi/Yj5TeX29dSw/maxresdefault.jpg',
      description: 'Understanding SELECT statements and filtering.',
      prequisite: ['Data Management'],
    ),
    SqlDetailCategory(
      name: 'SQL',
      difficulty: 'Medium',
      totalQuestion: '20',
      totalTime: '10 min',
      iconColor: Colors.green,
      color: Colors.green.shade50,
      url: 'https://i.ytimg.com/vi/gelTPkECF18/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGH8gLCgTMA8=&rs=AOn4CLBxivMkrCSg70L_381Ek1AOAXVSYA',
      description: 'Advanced SQL queries and joins.',
      prequisite: ['Basic SQL', 'Data Relationships'],
    ),
    SqlDetailCategory(
      difficulty: 'Hard',
      totalQuestion: '30',
      totalTime: '10 min',
      name: 'SQL',
      iconColor: Colors.green,
      color: Colors.green.shade50,
      url: 'https://th.bing.com/th/id/OIP.vMflSLOCQUsSxS_PfnLc5gHaDt?w=1200&h=600&rs=1&pid=ImgDetMain',
      description: 'Database optimization and performance tuning.',
      prequisite: ['Intermediate SQL', 'Database Design'],
    ),
  ];
}
