import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:techquest/constant/color/app_color.dart';
import 'package:techquest/constant/home/categories.dart';
import 'package:techquest/constant/text/app_text.dart';
import 'package:techquest/view/detail_category/detail_category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final _searchController = TextEditingController();
  late bool isLoading = false;
  final appText = AppText();
  List<TechCategory> searchResults = TechCategory.categories;

  Widget _buildShimmerEffect() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: 16, // Number of shimmer items to show
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.6,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            children: [
              Card(
                elevation: 1,
                child: Container(
                  height: 130,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Expanded(child: Container(
                width: 70,
                height: 18,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),)
            ],
          ),
        );
      },
    );
  }

  Future<void> performSearch(String query) async {
    setState(() {
      isLoading = true;
    });

    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      if (query.trim().isEmpty) {
        searchResults = TechCategory.categories;
      } else {
        searchResults = TechCategory.categories
            .where((category) =>
            category.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
      isLoading = false;
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      searchResults = TechCategory.categories;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ss = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.homebackground,
      appBar: AppBar(
        backgroundColor: AppColor.homeAppBar,
        title: Text('Categories', style: appText.appTextStyle()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: SearchBar(
              controller: _searchController,
              textStyle: WidgetStateProperty.all(
                AppText.appTextStyleBody(20, FontWeight.bold, Colors.grey.shade700),
              ),
              hintStyle: WidgetStateProperty.all(
                AppText.appTextStyleBody(
                    20, FontWeight.normal, Colors.grey.shade700),
              ),
              hintText: 'Search For Quiz',
              trailing: [
                if (_searchController.text.isNotEmpty)
                  IconButton(
                    onPressed: _clearSearch,
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey.shade800,
                      size: 24,
                    ),
                  ),
                IconButton(
                  onPressed: () => performSearch(_searchController.text),
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
              backgroundColor:
              WidgetStateProperty.all(Colors.grey.shade300),
              onSubmitted: performSearch,
              onChanged: (value) {
                performSearch(value);
              },
            ),
          ),
          Expanded(
            child: isLoading
                ? _buildShimmerEffect()
                : searchResults.isEmpty
                ? Center(
              child: Text(
                'No results found',
                style: AppText.appTextStyleBody(
                    16, FontWeight.bold, Colors.grey),
              ),
            )
                : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: searchResults.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.6,
                crossAxisSpacing: 1,
              ),
              itemBuilder: (context, index) {
                final category = searchResults[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 130,
                      child: Card(
                        elevation: 1,
                        color: category.color,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailCategory(
                                  title: category.name,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 130,
                            width: 100,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(category.url),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        category.name,
                        style: AppText.appTextStyleBody(
                            15, FontWeight.bold),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}