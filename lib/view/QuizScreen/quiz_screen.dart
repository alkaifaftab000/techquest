import 'package:flutter/material.dart';
import 'package:techquest/constant/color/app_color.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/model/quiz_model.dart';

class QuizScreen extends StatefulWidget {
  final List<QuizQuestion> questions;
  final Color dark,shade;


  const QuizScreen({super.key, required this.questions,required this.dark,required this.shade});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizScreen> {
  final appText = AppText();
  int currentQuestionIndex = 0;
  String? selectedAnswer;
  bool hasAnswered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homeAppBar,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation Bar with Progress and Quit Button
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColor.homeAppBar,

              ),
              child: Column(
                children: [
                  // Quit and Progress Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,

                            builder: (context) => AlertDialog(
                              backgroundColor: AppColor.homebackground,
                              title: Text('Quit Quiz?',style: appText.appTextStyle()),
                              content: Text('Are you sure you want to quit? Your progress will be lost.',style: AppText.appTextStyleBody(15),),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('Cancel',style: AppText.appTextStyleBody(15,FontWeight.bold,Colors.black)),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close dialog
                                    Navigator.pop(context); // Return to home
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                  ),
                                  child: Text('Quit',style: AppText.appTextStyleBody(15,FontWeight.bold,Colors.white),),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: const Icon(Icons.close),
                        tooltip: 'Quit Quiz',
                      ),
                      Text(
                        'Question ${currentQuestionIndex + 1}/${widget.questions.length}',
                        style: AppText.appTextStyleBody(15,FontWeight.bold)
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Progress Indicators
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.questions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: currentQuestionIndex == index
                                  ? widget.dark
                                  : Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                if (currentQuestionIndex == index)
                                  BoxShadow(
                                    color: Colors.green.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: AppText.appTextStyleBody(15,FontWeight.bold,currentQuestionIndex == index
                                    ? Colors.white
                                    : Colors.black54,)

                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Question and Answers Section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question Card
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: widget.shade.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.quiz,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    'Question ${currentQuestionIndex + 1}',
                                    style: AppText.appTextStyleBody(20,FontWeight.bold)
                                ),
                              ]),
                              const SizedBox(height: 16),
                              Text(
                                widget.questions[currentQuestionIndex].question,
                                style: AppText.appTextStyleBody(18,FontWeight.bold,widget.dark)
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Answer Options
                      ...buildAnswerOptions(),

                      const SizedBox(height: 16),

                      // Explanation and Tips
                      if (hasAnswered) ...[
                        buildExplanationAndTips(),
                      ],
                    ],
                  ),
                ),
              ),
            ),

            // Navigation Buttons
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: AppColor.homeAppBar,

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentQuestionIndex > 0)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              currentQuestionIndex--;
                              selectedAnswer = null;
                              hasAnswered = false;
                            });
                          },
                          icon: const Icon(Icons.arrow_back),
                          label: Text('Previous',style: AppText.appTextStyleBody(15,FontWeight.bold),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            foregroundColor: Colors.black87,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (currentQuestionIndex < widget.questions.length - 1)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              currentQuestionIndex++;
                              selectedAnswer = null;
                              hasAnswered = false;
                            });
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: Text('Next',style: AppText.appTextStyleBody(15,FontWeight.bold,Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: widget.dark,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildAnswerOptions() {
    QuizQuestion currentQuestion = widget.questions[currentQuestionIndex];
    List<Widget> options = [];
    Map<String, String?> answers = {
      'A': currentQuestion.answers.answerA,
      'B': currentQuestion.answers.answerB,
      'C': currentQuestion.answers.answerC,
      'D': currentQuestion.answers.answerD,
      'E': currentQuestion.answers.answerE,
      'F': currentQuestion.answers.answerF,
    };

    answers.forEach((key, value) {
      if (value != null) {
        bool isCorrect = currentQuestion.correctAnswers
            .toJson()['answer_${key.toLowerCase()}_correct'] == 'true';
        bool isSelected = selectedAnswer == key;

        options.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: InkWell(
              onTap: hasAnswered
                  ? null
                  : () {
                setState(() {
                  selectedAnswer = key;
                  hasAnswered = true;
                });
              },
              child: Card(
                elevation: isSelected ? 4 : 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: hasAnswered
                        ? (isCorrect
                        ? Colors.green.shade100
                        : isSelected
                        ? Colors.red.shade100
                        : null)
                        : isSelected
                        ? Colors.blue.shade100
                        : null,
                    borderRadius: BorderRadius.circular(12),

                  ),
                  child: Row(
                    children: [
                    Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: hasAnswered
                          ? (isCorrect
                          ? Colors.green.shade500
                          : isSelected
                          ? Colors.red.shade500
                          : Colors.grey.shade200)
                          : isSelected
                          ? Colors.blue.shade100    // Light blue for selected but not submitted
                          : Colors.grey.shade200,   // Default grey for unselected
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        key,
                        style: AppText.appTextStyleBody(15,FontWeight.bold)
                      ),
                    ),
                  ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        value,
                        style: AppText.appTextStyleBody(15,FontWeight.bold)
                      ),
                    ),
                    if (hasAnswered && (isCorrect || isSelected))
              Icon(
            isCorrect
            ? Icons.check_circle_outline
                : Icons.cancel_outlined,
              color: isCorrect ? Colors.green : Colors.red,
              size: 28,
            ),]),
              ),
            ),
          ),
        ));
      }
    });

    return options;
  }

  Widget buildExplanationAndTips() {
    QuizQuestion currentQuestion = widget.questions[currentQuestionIndex];
    bool hasExplanation = currentQuestion.explanation != null;
    bool hasTip = currentQuestion.tip != null;

    if (!hasExplanation && !hasTip) return const SizedBox.shrink();

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade50, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            if (hasExplanation) ...[
      Row(
      children: [
      Icon(
      Icons.lightbulb_outline,
        color: Colors.green.shade700,
      ),
      const SizedBox(width: 8),
      Text(
        'Explanation',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.green.shade700,
        ),
      ),
      ],
    ),
    const SizedBox(height: 8),
    Text(
    currentQuestion.explanation.toString(),
    style: const TextStyle(fontSize: 16),
    ),
    ],
    if (hasTip) ...[
    if (hasExplanation) const SizedBox(height: 16),
    Row(
    children: [
    Icon(
    Icons.tips_and_updates_outlined,
    color: Colors.blue.shade700,
    ),
      const SizedBox(width: 8),
      Text(
        'Tip',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue.shade700,
        ),
      ),
    ],
    ),
      const SizedBox(height: 8),
      Text(
        currentQuestion.tip.toString(),
        style: const TextStyle(fontSize: 16),
      ),
    ],
            ],
        ),
      ),
    );
  }
}
