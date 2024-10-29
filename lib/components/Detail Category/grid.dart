import 'package:flutter/material.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/model/detail%20category/bash.dart';
import 'package:techquest/model/detail%20category/cms_category.dart';
import 'package:techquest/model/detail%20category/code_category.dart';
import 'package:techquest/model/detail%20category/detail_category_model.dart';
import 'package:techquest/model/detail%20category/devops_category.dart';
import 'package:techquest/model/detail%20category/linux_category.dart';
import 'package:techquest/model/detail%20category/sql.dart';
import 'package:techquest/view/quiz%20info/quiz_info.dart';


class DetailGridView extends StatelessWidget {
  final appText = AppText();
  final String heading;
  final int index;

  DetailGridView({super.key, required this.index,required this.heading});

  @override
  Widget build(BuildContext context) {

    dynamic quiz;
      switch (heading) {
        case 'Docker':
          quiz = DockerCategoryModel.detailCategoryModel[index];
        case 'SQL':
          quiz = SqlDetailCategory.sqlCategoryModel[index];
        case 'Bash':
          quiz = BashDetailCategory.bashCategoryModel[index];
        case 'CMS':
          quiz = CmsDetailCategory.cmsCategoryModel[index];
        case 'Linux':
          quiz = LinuxDetailCategory.linuxCategoryModel[index];
        case 'Code':
          quiz = CodeDetailCategory.codeCategoryModel[index];
        case 'DevOps':
          quiz = DevOpsDetailCategory.devOpsCategoryModel[index];
        default:
          return Scaffold(
            body: Center(child: Text(
      'No results found',
      style: appText.appTextStyle(),),
          ));
      }

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
      // margin: const EdgeInsets.symmetric(horizontal: 5),
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
      MapEntry(Icons.warning, 'Difficulty :${quiz.difficulty} '),
      MapEntry(Icons.question_answer_rounded,
          'Total Question : ${quiz.totalQuestion}'),
      MapEntry(Icons.timer_rounded, 'Total Time : ${quiz.totalTime}'),
      MapEntry(Icons.topic_rounded, 'Topic : ${quiz.name}'),
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
