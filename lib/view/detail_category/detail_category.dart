import 'package:flutter/material.dart';
import 'package:techquest/components/Detail%20Category/grid.dart';
import 'package:techquest/components/home/difficulty.dart';

import 'package:techquest/constant/color/app_color.dart';

import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/model/detail%20category/detail_category_model.dart';

class DetailCategory extends StatelessWidget {
  final String title;
  final appText = AppText();
  DetailCategory({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
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
              DifficultyLevelWidget(heading: title),
          SizedBox(
            width: ss.width,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              itemCount: DockerCategoryModel.detailCategoryModel.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,

                crossAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return DetailGridView(index: index,heading: title,);
              },
            ),
          )
        ])));
  }
}
