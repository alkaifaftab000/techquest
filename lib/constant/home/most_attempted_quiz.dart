import 'package:flutter/material.dart';

class MostAttemptedQuiz {
  final String name;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final String url, difficulty, totalQuestion, totalTime, description;
  final List<String> prerequisites;

  MostAttemptedQuiz({
    required this.name,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.url,
    required this.difficulty,
    required this.totalQuestion,
    required this.totalTime,
    required this.description,
    required this.prerequisites,
  });

  static final List<MostAttemptedQuiz> mostAttemptedQuiz = [
    MostAttemptedQuiz(
      difficulty: 'Hard',
      totalQuestion: '30',
      totalTime: '10 min',
      name: 'Docker',
      iconColor: Colors.cyan,
      icon: Icons.cloud_queue,
      color: Colors.blueGrey.shade50,
      url: 'https://i.ytimg.com/vi/3BS_z4ml8PY/maxresdefault.jpg',
      description: 'Learn about containerization and orchestration using Docker.',
      prerequisites: ['CLI', 'Virtualization'],
    ),
    MostAttemptedQuiz(
      difficulty: 'Easy',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'SQL',
      iconColor: Colors.green,
      icon: Icons.storage,
      color: Colors.lightGreen.shade50,
      url: 'https://static.vecteezy.com/system/resources/previews/005/237/346/non_2x/dbms-database-management-system-concept-for-infographic-template-banner-with-four-point-list-information-free-vector.jpg',
      description: 'Understand the basics of databases and how to manipulate data using SQL.',
      prerequisites: ['Database', 'Structures'],
    ),
    MostAttemptedQuiz(
      difficulty: 'Medium',
      totalQuestion: '20',
      totalTime: '10 min',
      name: 'Bash',
      icon: Icons.circle,
      iconColor: Colors.blue,
      color: Colors.blueGrey.shade50,
      url: 'https://th.bing.com/th/id/OIP.yZ7L2_K-dOhsvE7iFFfomwHaD7?rs=1&pid=ImgDetMain',
      description: 'Get familiar with command-line scripting using Bash for automation.',
      prerequisites: ['CLI', 'Files'],
    ),
    MostAttemptedQuiz(
      difficulty: 'Hard',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'CMS',
      iconColor: Colors.pink,
      icon: Icons.code,
      color: Colors.pink.shade50,
      url: 'https://th.bing.com/th/id/OIP.keSZ6pK8g_LhvQuxeV_2HgHaDi?rs=1&pid=ImgDetMain',
      description: 'Explore Content Management Systems and their implementation.',
      prerequisites: ['Web', 'HTML'],
    ),
    MostAttemptedQuiz(
      difficulty: 'Hard',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'Linux',
      icon: Icons.flutter_dash_outlined,
      iconColor: Colors.black,
      color: Colors.blueGrey.shade50,
      url: 'https://media-exp1.licdn.com/dms/image/C5622AQEeg7U-xhym4Q/feedshare-shrink_800/0/1664517583308?e=2147483647&v=beta&t=_rSuNDB3saZSS51d9bKihdx7MAn9wp_XRVVy1odafV0',
      description: 'Master the Linux operating system and its command line.',
      prerequisites: ['Computer', 'CLI'],
    ),
  ];
}
