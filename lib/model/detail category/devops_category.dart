import 'package:flutter/material.dart';
import 'package:techquest/model/difficulty/difficulty_model.dart';

class DevOpsDetailCategory extends CategoryBase {
  DevOpsDetailCategory({
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

  static final List<DevOpsDetailCategory> devOpsCategoryModel = [
    DevOpsDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '10',
      totalTime: '10 min',
      name: 'DevOps',
      iconColor: Colors.purple,
      color: Colors.purple.shade50,
      url: 'https://static.vecteezy.com/system/resources/previews/008/902/912/original/devops-banner-concept-has-8-steps-to-analyze-such-as-plan-code-build-operate-deploy-test-monitor-and-release-for-software-development-and-information-technology-operations-infographic-vector.jpg',
      description: 'Overview of DevOps principles and practices.',
      prequisite: ['Agile', 'Version Control'],
    ),
    DevOpsDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '20',
      totalTime: '20 min',
      name: 'DevOps',
      iconColor: Colors.purple,
      color: Colors.purple.shade50,
      url: 'https://devopscon.io/wp-content/uploads/2019/11/DOC20_Blog_270x200_54837_v1.jpg',
      description: 'Understanding continuous integration and delivery.',
      prequisite: ['Agile', 'Automation'],
    ),
    DevOpsDetailCategory(
      difficulty: 'Easy',
      totalQuestion: '30',
      totalTime: '30 min',
      name: 'DevOps',
      iconColor: Colors.purple,
      color: Colors.purple.shade50,
      url: 'https://www.collegelib.com/wp-content/uploads/devops.jpg',
      description: 'Learn about monitoring and logging in DevOps.',
      prequisite: ['Monitoring', 'Scripting'],
    ),
    DevOpsDetailCategory(
      difficulty: 'Medium',
      totalQuestion: '20',
      totalTime: '10 min',
      name: 'DevOps',
      iconColor: Colors.purple,
      color: Colors.purple.shade50,
      url: 'https://th.bing.com/th/id/OIP.yOcPNuXk70807gSA22IpVAHaFF?w=1920&h=1320&rs=1&pid=ImgDetMain',
      description: 'Explore DevOps tools and technologies.',
      prequisite: ['Automation', 'Configuration'],
    ),
    DevOpsDetailCategory(
      difficulty: 'Hard',
      totalQuestion: '30',
      totalTime: '10 min',
      name: 'DevOps',
      iconColor: Colors.purple,
      color: Colors.purple.shade50,
      url: 'https://www.slideteam.net/media/catalog/product/cache/1280x720/s/t/stages_of_devops_flow_devops_continuous_integration_deployment_process_flow_slide01.jpg',
      description: 'Master advanced DevOps practices and pipelines.',
      prequisite: ['CI/CD', 'Cloud'],
    ),
  ];
}
