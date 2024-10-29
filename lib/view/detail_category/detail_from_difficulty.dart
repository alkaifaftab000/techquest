import 'package:flutter/material.dart';
import 'package:techquest/components/Detail%20Category/grid_view_from_difficulty.dart';
import 'package:techquest/constant/color/app_color.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/model/detail%20category/all_category.dart';
import 'package:techquest/model/detail%20category/cms_category.dart';
import 'package:techquest/model/detail%20category/code_category.dart';
import 'package:techquest/model/detail%20category/devops_category.dart';
import '../../model/detail category/bash.dart';
import '../../model/detail category/detail_category_model.dart';
import '../../model/detail category/linux_category.dart';
import '../../model/detail category/sql.dart';
import '../../model/difficulty/difficulty_model.dart';

class DetailFromDifficulty extends StatelessWidget {
  final AllCategories allCategories = AllCategories.getAllCategories();
  final String title,heading;
  final appText = AppText();
  DetailFromDifficulty({super.key, required this.title,required this.heading});

  List<CategoryBase> filterByDifficulty(List<CategoryBase> list, String difficulty) {
    return list.where((quiz) => quiz.difficulty == difficulty).toList();
  }
  @override
  Widget build(BuildContext context) {
    List<CategoryBase> quizList =allCategories.getCategoriesByDifficulty(title);
    if(heading.isNotEmpty) {
      switch (heading) {
        case 'All Quiz':
          quizList = allCategories.getAllCategoriesUnfiltered();
          debugPrint('i am here ${quizList.length}');
        case 'Docker':
          quizList = filterByDifficulty(
              DockerCategoryModel.detailCategoryModel, title);
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
    final ss = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColor.homebackground,
        appBar: AppBar(
          backgroundColor: AppColor.homeAppBar,
          centerTitle: true,
          title: Text(title, style: appText.appTextStyle()),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: ss.width,
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: quizList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    crossAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    debugPrint(heading);
                    return DetailGridViewFromDifficulty(index: index,heading:heading,title: title);
                  },
                ),
              )
            ])));
  }
}
