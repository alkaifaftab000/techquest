import 'package:flutter/material.dart';
import 'package:techquest/model/difficulty/difficulty_model.dart';

class LinuxDetailCategory extends CategoryBase {
  LinuxDetailCategory({
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

  static final List<LinuxDetailCategory> linuxCategoryModel = [
    LinuxDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'Linux',
      iconColor: Colors.grey.shade600,
      color: Colors.grey.shade300,
      url: 'https://i.morioh.com/2023/09/04/02fe3759.webp',
      description: 'Introduction to Linux operating system.',
      prequisite: ['Command Line', 'Basic IT'],
    ),
    LinuxDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '20',
      totalTime: '20 min',
      name: 'Linux',
      iconColor: Colors.grey.shade600,
      color: Colors.grey.shade300,
      url: 'https://i.pinimg.com/originals/6d/16/6f/6d166f67724f1e27303936cb727b901a.png',
      description: 'Learn about Linux distributions and installations.',
      prequisite: ['Command Line', 'Networking'],
    ),
    LinuxDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '30',
      totalTime: '30 min',
      name: 'Linux',
      iconColor: Colors.grey.shade600,
      color: Colors.grey.shade300,
      url: 'https://cultura-informatica.com/wp-content/uploads/2023/03/Red-Hat-Enterprise-Linux-1-1-780x439.jpg',
      description: 'Understanding Linux file systems and permissions.',
      prequisite: ['File Management', 'Basic IT'],
    ),
    LinuxDetailCategory(
      difficulty: 'Medium',
      totalQuestion: '20',
      totalTime: '10 min',
      name: 'Linux',
      iconColor: Colors.grey.shade600,
      color: Colors.grey.shade300,
      url: 'https://thumbs.dreamstime.com/b/hacker-vertical-banner-set-three-hacker-vertical-banner-set-wanna-hack-best-defense-system-repair-headlines-vector-212653661.jpg',
      description: 'Exploring shell scripting and automation.',
      prequisite: ['Scripting', 'Networking'],
    ),
    LinuxDetailCategory(
      difficulty: 'Hard',
      totalQuestion: '30',
      totalTime: '10 min',
      name: 'Linux',
      iconColor: Colors.grey.shade600,
      color: Colors.grey.shade300,
      url: 'https://th.bing.com/th/id/OIP.ixvEoY-jPWN_WKrwIbYT7wAAAA?w=400&h=400&rs=1&pid=ImgDetMain',
      description: 'Advanced Linux administration and troubleshooting.',
      prequisite: ['Administration', 'Networking'],
    ),
  ];
}
