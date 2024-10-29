import 'package:flutter/material.dart';
import 'package:techquest/model/difficulty/difficulty_model.dart';

class CmsDetailCategory extends CategoryBase {

  CmsDetailCategory({
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

  static final List<CmsDetailCategory> cmsCategoryModel = [
    CmsDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'CMS',
      iconColor: Colors.pink,
      color: Colors.pink.shade50,
      url: 'https://thumbs.dreamstime.com/b/web-administrator-content-management-system-development-working-data-base-information-technology-systems-flat-vector-254835489.jpg',
      description: 'Learn the basics of Content Management Systems.',
      prequisite: ['Web', 'HTML'],
    ),
    CmsDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '20',
      totalTime: '20 min',
      name: 'CMS',
      iconColor: Colors.pink,
      color: Colors.pink.shade50,
      url: 'https://www.hubdo.com/hubfs/iStock-831153388-min.jpg',
      description: 'Understand how to manage content effectively using CMS.',
      prequisite: ['Web', 'Design'],
    ),
    CmsDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '30',
      totalTime: '30 min',
      name: 'CMS',
      iconColor: Colors.pink,
      color: Colors.pink.shade50,
      url: 'https://th.bing.com/th/id/OIP.fZ4_6JU-L4yFkKFWzELCngHaGk?rs=1&pid=ImgDetMain',
      description: 'Explore different CMS platforms and their features.',
      prequisite: ['Web', 'Content'],
    ),
    CmsDetailCategory(
      difficulty: 'Medium',
      totalQuestion: '20',
      totalTime: '10 min',
      name: 'CMS',
      iconColor: Colors.pink,
      color: Colors.pink.shade50,
      url: 'https://th.bing.com/th/id/OIP.xv5hc0BFHmxCIqZWpG3VwwHaEK?w=1920&h=1080&rs=1&pid=ImgDetMain',
      description: 'Learn to customize and extend CMS functionality.',
      prequisite: ['Web', 'Plugins'],
    ),
    CmsDetailCategory(
      difficulty: 'Hard',
      totalQuestion: '30',
      totalTime: '10 min',
      name: 'CMS',
      iconColor: Colors.pink,
      color: Colors.pink.shade50,
      url: 'https://th.bing.com/th/id/OIP.rUQO7dqqx-9_mdAlzfvOTwHaDy?rs=1&pid=ImgDetMain',
      description: 'Dive deep into advanced CMS development techniques.',
      prequisite: ['Web', 'Development'],
    ),
  ];
}
