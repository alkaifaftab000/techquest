import 'package:flutter/material.dart';
import 'package:techquest/backend/backend.dart';
import 'package:techquest/components/home/most_attempted_widget.dart';
import 'package:techquest/constant/color/app_color.dart';
import 'package:techquest/constant/home/most_attempted_quiz.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/model/quiz_model.dart';
import 'package:techquest/view/QuizScreen/quiz_screen.dart';

class QuizInfo extends StatefulWidget {
  final Color shade,dark;
  final String heading, url, difficulty, totalQuestion, totalTime, description;
  List<String> prequisite;

  QuizInfo({
    super.key,
    required this.dark,
    required this.heading,
    required this.difficulty,
    required this.totalQuestion,
    required this.totalTime,
    required this.shade,
    required this.description,
    required this.prequisite,
    required this.url
  });

  @override
  State<QuizInfo> createState() => _QuizInfoState();
}

class _QuizInfoState extends State<QuizInfo> {
  final api = QuizController();
  final appText = AppText();
  bool isLoading = false;

  void showQuiz(List<QuizQuestion> questions) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizScreen(questions: questions,
        shade: widget.shade,
        dark: widget.dark,),
      ),
    );
  }

  Future<void> _startQuiz() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: widget.shade,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Loading Quiz...',
                    style: AppText.appTextStyleBody(16, FontWeight.w500, Colors.black87),
                  ),
                ],
              ),
            ),
          );
        },
      );

      // Fetch questions
      debugPrint(widget.heading);
      debugPrint(widget.difficulty);
      debugPrint(widget.totalQuestion);

      final questions = await api.fetchQuizQuestions(widget.heading,widget.totalQuestion,widget.difficulty);

      debugPrint(questions.length.toString());

      // Remove loading dialog
      Navigator.of(context).pop();

      // Navigate to quiz screen
      showQuiz(questions);
    } catch (e) {
      // Remove loading dialog if it's showing
      if (Navigator.canPop(context)) {
        Navigator.of(context).pop();
      }

      // Show error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('Failed to load quiz questions: ${e.toString()}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final quiz = MostAttemptedQuiz(
      description: widget.description,
      prerequisites: widget.prequisite,
      difficulty: widget.difficulty,
      totalQuestion: widget.totalQuestion,
      totalTime: widget.totalTime,
      name: widget.heading,
      icon: Icons.abc,
      color: widget.shade,
      iconColor: widget.shade,
      url: widget.url,
    );

    final ss = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TextButton.icon(
        onPressed: isLoading ? null : _startQuiz,
        label: Text('Start',
            style: AppText.appTextStyleBody(20, FontWeight.bold, Colors.white)),
        icon: const Icon(
          Icons.start,
          color: Colors.white,
        ),
        style: TextButton.styleFrom(
            backgroundColor: widget.shade,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
      backgroundColor: AppColor.homebackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.homeAppBar,
        title: Text(widget.heading, style: appText.appTextStyle()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 200,
                    width: ss.width * .8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(widget.url),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                Center(
                  child: Text('Here The Title Will be Show Of The Quiz',
                      style:
                          AppText.appTextStyleBody(20, FontWeight.bold, widget.shade)),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {},
                  label: Text('Prequisites',
                      style: AppText.appTextStyleBody(
                          20, FontWeight.bold, Colors.white)),
                  icon: const Icon(
                    Icons.assignment,
                    color: Colors.white,
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: widget.shade,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: 45,
                  width: ss.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.prequisite.length,
                      itemBuilder: (context, index) {
                        return Row(children: [
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(widget.prequisite[index].toString(),
                                style: AppText.appTextStyleBody(
                                    15, FontWeight.bold, Colors.grey.shade700)),
                            icon: Icon(
                              Icons.cloud_rounded,
                              color: Colors.grey.shade700,
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          ),
                          const SizedBox(width: 5),
                        ]);
                      }),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: () {},
                  label: Text('Description',
                      style: AppText.appTextStyleBody(
                          20, FontWeight.bold, Colors.white)),
                  icon: const Icon(
                    Icons.description,
                    color: Colors.white,
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: widget.shade,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(height: 5),
                Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Column(
                      children: MostAttemptedWidget.buildInfoRows(quiz),
                    )),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    widget.description,
                    style: AppText.appTextStyleBody(
                        16, FontWeight.bold, Colors.grey.shade600),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
