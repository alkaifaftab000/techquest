import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:flutter/material.dart';
import 'package:techquest/components/global/image_view_helper.dart';
import 'package:techquest/components/home/difficulty.dart';
import 'package:techquest/components/home/most_attempted_widget.dart';
import 'package:techquest/constant/color/app_color.dart';
import 'package:techquest/constant/home/categories.dart';
import 'package:techquest/constant/home/most_attempted_quiz.dart';
import 'package:techquest/constant/images/app_images.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/view/detail_category/detail_category.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{

  final appText = AppText();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final ss = MediaQuery.of(context).size;

    return Scaffold(

      backgroundColor: AppColor.homebackground,
      appBar: AppBar(
        backgroundColor: AppColor.homeAppBar,
        centerTitle: true,
        title: Text(
          AppText.homeAppBar,
          style: appText.appTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: ss.width,
            height: 260,
            child: cs.CarouselSlider.builder(
              carouselController: cs.CarouselSliderController(),
              itemCount: AppImages.carouselImages.length,
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(AppImages.carouselImages[index][0]);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } else {
                      debugPrint('Could not launch $url');
                    }
                  },
                  child: ImageViewHelper.show(
                    context: context,
                    url: AppImages.carouselImages[index][1],
                  ),
                );
              },
              options: cs.CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                enableInfiniteScroll: true,
                viewportFraction: .8,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(AppImages.carouselImages.length, (index) {
              bool isSelected = currentPage == index;
              return AnimatedContainer(
                height: 8,
                width: isSelected ? 30 : 10,
                margin: EdgeInsets.symmetric(horizontal: isSelected ? 6 : 3),
                decoration: BoxDecoration(
                    color: isSelected
                        ? AppColor.carouselAnimatedContainerSelected
                        : AppColor.carouselAnimatedContainerNotSelected,
                    borderRadius: BorderRadius.circular(40)),
                duration: const Duration(seconds: 1),
              );
            }),
          ),
          const SizedBox(height: 15),
          Text(AppText.homeCategories, style: appText.appTextStyle()),
          SizedBox(
            height: 170,
            width: ss.width,
            child: ListView.builder(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount: TechCategory.categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 130,
                        child: Card(
                          elevation: 1,
                          color: TechCategory.categories[index].color,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailCategory(
                                          title: TechCategory
                                              .categories[index].name)));
                            },
                            child: Container(
                              height: 130,
                              width: 100,
                              padding:
                              const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          TechCategory.categories[index].url)),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(TechCategory.categories[index].name,
                            style: AppText.appTextStyleBody(15, FontWeight.bold)),
                      )
                    ],
                  );
                }),
          ),
          Text(
            'Most Attempted Quiz',
            style: appText.appTextStyle(),
          ),
          SizedBox(
            height: 300,
            width: ss.width,
            child: ListView.builder(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                itemCount: MostAttemptedQuiz.mostAttemptedQuiz.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MostAttemptedWidget(index: index);
                }),
          ),
          const SizedBox(height: 15),
          const DifficultyLevelWidget(heading: '')
        ]),
      ),
    );
  }
}
