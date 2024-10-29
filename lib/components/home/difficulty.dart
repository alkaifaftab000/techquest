import 'package:flutter/material.dart';
import 'package:techquest/constant/home/difficulty_level.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/view/detail_category/detail_from_difficulty.dart';

class DifficultyLevelWidget extends StatefulWidget {
  final String heading;
  const DifficultyLevelWidget({super.key,required this.heading});

  @override
  State<DifficultyLevelWidget> createState() => _DifficultyLevelWidgetState();
}

class _DifficultyLevelWidgetState extends State<DifficultyLevelWidget> {
  final appText = AppText();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: GridView.count(
        crossAxisCount: DifficultyLevel.level.length,
        children: List.generate(DifficultyLevel.level.length, (index) {
          return GestureDetector(
            onTap: () {
              switch(index){
                case 0:
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailFromDifficulty(title: 'Easy',heading: widget.heading,)));
                case 1:
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailFromDifficulty(title: 'Medium',heading: widget.heading)));
                case 2:
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailFromDifficulty(title: 'Hard',heading :widget.heading)));
              }
            },
            child: Card(
              color: DifficultyLevel.level[index].color,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DifficultyLevel.level[index].icon,
                  const SizedBox(height: 10),
                  Text(
                    DifficultyLevel.level[index].name,
                    style: AppText.appTextStyleBody(20, FontWeight.bold),
                  )
                ],
              )),
            ),
          );
        }),
      ),
    );
  }
}
