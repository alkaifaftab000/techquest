import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:techquest/view/detail_category/category_screen.dart';
import 'package:techquest/view/home/home.dart';
import 'package:techquest/view/profile/profile.dart';
import 'package:techquest/view/search/search_quiz.dart';

import '../../constant/color/app_color.dart';
import '../../constant/text/app_text.dart';
class InitialHome extends StatefulWidget {
  const InitialHome({super.key});
  @override
  State<InitialHome> createState() => _InitialHomeState();
}

class _InitialHomeState extends State<InitialHome> with SingleTickerProviderStateMixin{
  MotionTabBarController? _motionTabBarController;
  final List<String> labels = ["Home", "Categories", "Search", "Profile"];
  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: labels.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
      controller: _motionTabBarController,
      onTabItemSelected: (int value) {
        setState(() {
          // _tabController!.index = value;
          _motionTabBarController!.index = value;
        });
      },
      tabBarColor: AppColor.homeAppBar,
      tabIconColor: Colors.grey.shade700,
      tabIconSelectedSize: 35,
      tabIconSelectedColor: Colors.white,
      tabSelectedColor: Colors.green.shade300,
      textStyle: AppText.appTextStyleBody(15,FontWeight.bold),
      tabIconSize: 35,
      initialSelectedTab: labels[0],
      labels: labels,

      icons: const [
        Icons.home_rounded,
        Icons.category_rounded,
        Icons.search_rounded,
        Icons.person_rounded,
      ],
    ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        // controller: _tabController,
        controller: _motionTabBarController,
        children: const [
           HomeScreen(),
          CategoryScreen(),
          SearchQuiz(),
          ProfilePage()
        ],
      ),
    );
  }
}
