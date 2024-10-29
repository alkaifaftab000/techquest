import 'package:flutter/material.dart';
import 'package:techquest/model/difficulty/difficulty_model.dart';

class DockerCategoryModel extends CategoryBase {
  DockerCategoryModel({
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

  static final List<DockerCategoryModel> detailCategoryModel = [
    DockerCategoryModel(
      difficulty: 'Easy',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'Docker',
      iconColor: Colors.cyan,
      color: Colors.blueGrey.shade50,
      url: 'https://i.ytimg.com/vi/3BS_z4ml8PY/maxresdefault.jpg',
      description: 'Introduction to Docker and containerization concepts.',
      prequisite: ['Virtualization', 'Networking'],
    ),
    DockerCategoryModel(
      difficulty: 'Easy',
      totalQuestion: '20',
      totalTime: '20 min',
      name: 'Docker',
      iconColor: Colors.cyan,
      color: Colors.blueGrey.shade50,
      url: 'https://th.bing.com/th/id/OIP._gJvj2PQZnxgMcYtBpFpRgAAAA?rs=1&pid=ImgDetMain',
      description: 'Learn how to create and manage Docker containers.',
      prequisite: ['Virtualization', 'Command Line'],
    ),
    DockerCategoryModel(
      difficulty: 'Easy',
      totalQuestion: '30',
      totalTime: '30 min',
      name: 'Docker',
      iconColor: Colors.cyan,
      color: Colors.blueGrey.shade50,
      url: 'https://www.simpliaxis.com/storage/images/article_detail_banner_image_Blog%20banner(%20How%20Do%20Docker%20and%20Kubernetes%20Work%20Together%20)_1667973502.webp',
      description: 'Understand Docker images and how to build them.',
      prequisite: ['Virtualization', 'Images'],
    ),
    DockerCategoryModel(
      difficulty: 'Medium',
      totalQuestion: '20',
      totalTime: '10 min',
      name: 'Docker',
      iconColor: Colors.cyan,
      color: Colors.blueGrey.shade50,
      url: 'https://images.spiceworks.com/wp-content/uploads/2022/07/27134747/Docker-Architecture.png',
      description: 'Explore Docker architecture and networking.',
      prequisite: ['Virtualization', 'Networking'],
    ),
    DockerCategoryModel(
      difficulty: 'Hard',
      totalQuestion: '30',
      totalTime: '10 min',
      name: 'Docker',
      iconColor: Colors.cyan,
      color: Colors.blueGrey.shade50,
      url: 'https://i.ytimg.com/vi/enge3599voo/maxresdefault.jpg',
      description: 'Learn advanced Docker concepts and orchestration.',
      prequisite: ['Virtualization', 'Orchestration'],
    ),
  ];
}
