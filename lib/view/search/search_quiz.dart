import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async'; // Add this import
import 'package:techquest/constant/color/app_color.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/view/quiz%20info/quiz_info.dart';
import '../../model/detail category/all_category.dart';
import '../../model/difficulty/difficulty_model.dart';

class SearchQuiz extends StatefulWidget {
  const SearchQuiz({super.key});

  @override
  State<SearchQuiz> createState() => _SearchQuizState();
}

class _SearchQuizState extends State<SearchQuiz> {
  final allCategories = AllCategories.getAllCategories();
  final appText = AppText();
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = false;
  List<CategoryBase> searchResults = [];
  Timer? _debounceTimer; // Add this variable

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        setState(() {
          searchResults = [];
          isLoading = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _debounceTimer?.cancel(); // Cancel timer when disposing
    _searchController.dispose();
    super.dispose();
  }


  Future<void> performSearch(String query) async {

    _debounceTimer?.cancel();

    // Always clear results if query is empty
    if (query.trim().isEmpty) {
      setState(() {
        searchResults = [];
        isLoading = false;
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    // Create new timer for debouncing
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      // Only perform search if this is still the active timer
      if (_debounceTimer?.isActive == false) {
        setState(() {
          searchResults = allCategories.searchCategories(query);
          isLoading = false;
        });
      }
    });
  }

  // Clear search and results
  void _clearSearch() {
    _searchController.clear();
    setState(() {
      searchResults = [];
      isLoading = false;
    });
  }

  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,

        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 12,
        itemBuilder: (context, index) {
          return Container(
              height: 20,
              padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 5) ,
              margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

          );
        },
      ),
    );
  }

  Widget _buildSearchResults() {
    if (searchResults.isEmpty && _searchController.text.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No results found',
              style: appText.appTextStyle(),
            ),
          ],
        ),
      );
    }

    if (searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            Icon(Icons.search, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Search for quizzes',
              style: appText.appTextStyle(),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: searchResults.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        crossAxisSpacing: 10

      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => QuizInfo(
                dark: searchResults[index].iconColor,
                description: searchResults[index].description,
                prequisite: searchResults[index].prequisite,
                difficulty: searchResults[index].difficulty,
                totalQuestion:searchResults[index].totalQuestion,
                totalTime: searchResults[index].totalTime,
                heading: searchResults[index].name,
                shade: searchResults[index].iconColor,
                url: searchResults[index].url,
              ),
            ),
          ),
          child: Column(
            children: [
              _buildImageContainer(searchResults[index].url),
              _buildInfoContainer(searchResults[index]),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homebackground,
      appBar: AppBar(
        backgroundColor: AppColor.homeAppBar,
        title: Text('All Quiz', style: appText.appTextStyle()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SearchBar(
              controller: _searchController,
              textStyle: WidgetStateProperty.all(
                AppText.appTextStyleBody(20, FontWeight.bold, Colors.grey.shade700),
              ),
              hintStyle: WidgetStateProperty.all(
                AppText.appTextStyleBody(20, FontWeight.normal, Colors.grey.shade700),
              ),
              hintText: 'Search For Quiz',
              trailing: [
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    onPressed: () {
                      if (_searchController.text.trim().isEmpty) {
                      _clearSearch();
                      } else {
                        performSearch(_searchController.text);
                      }
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey.shade800,
                      size: 24,
                    ),
                  ),
                IconButton(
                  onPressed: () {
                    performSearch(_searchController.text);
                  },
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.grey.shade800,
                    size: 35,
                  ),
                ),
              ],
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              elevation: WidgetStateProperty.all(0),
              backgroundColor: WidgetStateProperty.all(Colors.grey.shade300),
              onSubmitted: (value) {
                performSearch(value);
              },
              onChanged: (value) {
                _searchController.text=value;
                debugPrint(value);
                performSearch(value);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: isLoading ? _buildShimmerEffect() : _buildSearchResults(),
            ),
          ),
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
        Expanded(
          child: Text(
            text,
            style: AppText.appTextStyleBody(15, FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}