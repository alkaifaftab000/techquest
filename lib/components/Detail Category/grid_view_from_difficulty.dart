import 'package:flutter/material.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/model/detail%20category/all_category.dart';
import 'package:techquest/model/detail%20category/bash.dart';
import 'package:techquest/model/detail%20category/cms_category.dart';
import 'package:techquest/model/detail%20category/code_category.dart';
import 'package:techquest/model/detail%20category/detail_category_model.dart';
import 'package:techquest/model/detail%20category/devops_category.dart';
import 'package:techquest/model/detail%20category/linux_category.dart';
import 'package:techquest/model/detail%20category/sql.dart';
import 'package:techquest/view/quiz%20info/quiz_info.dart';

import '../../model/difficulty/difficulty_model.dart';

class DetailGridViewFromDifficulty extends StatelessWidget {
  final AllCategories allCategories = AllCategories.getAllCategories(); // Initialize here
  final appText = AppText();
  final String heading,title;
  final int index;

  DetailGridViewFromDifficulty({
    super.key,
    required this.index,
    required this.heading,
    required this.title
  });
  List<CategoryBase> filterByDifficulty(List<CategoryBase> list, String difficulty) {
    return list.where((quiz) => quiz.difficulty == difficulty).toList();
  }
  @override
  Widget build(BuildContext context) {
    List<CategoryBase> quizList = allCategories.getCategoriesByDifficulty(title);
    if(heading.isNotEmpty) {
      switch (heading) {
        case 'Docker':
          quizList = filterByDifficulty(
              DockerCategoryModel.detailCategoryModel,title);
        case 'SQL':
          quizList =
              filterByDifficulty(SqlDetailCategory.sqlCategoryModel, title);
        case 'Bash':
          quizList =
              filterByDifficulty(BashDetailCategory.bashCategoryModel, title);
        case 'CMS':
          quizList =
              filterByDifficulty(CmsDetailCategory.cmsCategoryModel, title);
        case 'Linux':
          quizList =
              filterByDifficulty(LinuxDetailCategory.linuxCategoryModel, title);
        case 'Code':
          quizList =
              filterByDifficulty(CodeDetailCategory.codeCategoryModel, title);
        case 'DevOps':
          quizList = filterByDifficulty(
              DevOpsDetailCategory.devOpsCategoryModel, title);
      }
    }

    if (quizList.isEmpty || index >= quizList.length) {
      debugPrint('Empty');
      return const SizedBox();
    }

    // Get the specific quiz at the index
    final quiz = quizList[index];

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizInfo(
            dark: quiz.iconColor,
            description: quiz.description,
            prequisite: quiz.prequisite,
            difficulty: quiz.difficulty,
            totalQuestion:quiz.totalQuestion ,
            totalTime: quiz.totalTime,
            heading: quiz.name,
            shade: quiz.iconColor,
            url: quiz.url,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildImageContainer(quiz.url),
          _buildInfoContainer(quiz),
        ],
      ),
    );
  }

  Widget _buildImageContainer(String url) {
    return Container(
      height: 130,
      width: 190,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        image: DecorationImage(
          image: NetworkImage(url),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  Widget _buildInfoContainer(dynamic quiz) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        color: quiz.color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      width: 190,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          ...buildInfoRows(quiz),
        ],
      ),
    );
  }

  static List<Widget> buildInfoRows(dynamic quiz) {
    final List<MapEntry<IconData, String>> rowData = [
      MapEntry(Icons.warning, 'Difficulty: ${quiz.difficulty}'),
      MapEntry(Icons.question_answer_rounded, 'Total Question: ${quiz.totalQuestion}'),
      MapEntry(Icons.timer_rounded, 'Total Time: ${quiz.totalTime}'),
      MapEntry(Icons.topic_rounded, 'Topic: ${quiz.name}'),
    ];

    return rowData
        .expand((entry) => [
      _buildInfoRow(entry.key, entry.value, quiz.iconColor),
      const SizedBox(height: 10),
    ])
        .toList();
  }

  static Widget _buildInfoRow(IconData icon, String text, Color iconColor) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5),
        Text(
          text,
          style: AppText.appTextStyleBody(15, FontWeight.bold),
        ),
      ],
    );
  }
}