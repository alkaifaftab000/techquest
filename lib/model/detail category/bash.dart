import 'package:flutter/material.dart';
import 'package:techquest/model/difficulty/difficulty_model.dart';

class BashDetailCategory extends CategoryBase {

  BashDetailCategory({
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

  static final List<BashDetailCategory> bashCategoryModel = [
    BashDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'Bash',
      iconColor: Colors.blue,
      color: Colors.blue.shade50,
      url: 'https://media.istockphoto.com/id/1661597224/vector/programming-code-language.jpg?s=612x612&w=0&k=20&c=7JGfLsEzg9b7CVk4ZaIFPAZXWcByqoml5xb_SVf_3Ow=',
      description: 'Get familiar with the basics of Bash scripting.',
      prequisite: ['CLI', 'Scripts'],
    ),
    BashDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '20',
      totalTime: '20 min',
      name: 'Bash',
      iconColor: Colors.blue,
      color: Colors.blue.shade50,
      url: 'https://th.bing.com/th/id/OIP.pr7peVz5VVCUeutQKoaknAHaFe?rs=1&pid=ImgDetMain',
      description: 'Learn to write simple scripts using Bash.',
      prequisite: ['CLI', 'Scripts'],
    ),
    BashDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '30',
      totalTime: '30 min',
      name: 'Bash',
      iconColor: Colors.blue,
      color: Colors.blue.shade50,
      url: 'https://m.media-amazon.com/images/G/01/spectrum/PMFO/Coding_Screen.png',
      description: 'Master the fundamentals of Bash commands.',
      prequisite: ['CLI', 'Commands'],
    ),
    BashDetailCategory(
      difficulty: 'Medium',
      totalQuestion: '20',
      totalTime: '10 min',
      name: 'Bash',
      iconColor: Colors.blue,
      color: Colors.blue.shade50,
      url: 'https://cdn.educba.com/academy/wp-content/uploads/2020/01/Bash-Shell-in-Linux.jpg',
      description: 'Explore more complex Bash scripting techniques.',
      prequisite: ['CLI', 'Scripts'],
    ),
    BashDetailCategory(
      difficulty: 'Hard',
      totalQuestion: '30',
      totalTime: '10 min',
      name: 'Bash',
      iconColor: Colors.blue,
      color: Colors.blue.shade50,
      url: 'https://linuxsimply.com/wp-content/uploads/2023/07/bash-scripting-basics.png',
      description: 'Dive into advanced Bash scripting concepts.',
      prequisite: ['CLI', 'Automation'],
    ),
  ];
}
