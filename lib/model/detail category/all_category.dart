import 'package:techquest/model/detail%20category/bash.dart';
import 'package:techquest/model/detail%20category/cms_category.dart';
import 'package:techquest/model/detail%20category/code_category.dart';
import 'package:techquest/model/detail%20category/detail_category_model.dart';
import 'package:techquest/model/detail%20category/devops_category.dart';
import 'package:techquest/model/detail%20category/linux_category.dart';
import 'package:techquest/model/detail%20category/sql.dart';
import 'package:techquest/model/difficulty/difficulty_model.dart';

class AllCategories {
  final List<BashDetailCategory> bashCategories;
  final List<CmsDetailCategory> cmsCategories;
  final List<CodeDetailCategory> codeCategories;
  final List<DockerCategoryModel> dockerCategories;
  final List<DevOpsDetailCategory> devopsCategories;
  final List<LinuxDetailCategory> linuxCategories;
  final List<SqlDetailCategory> sqlCategories;
  // Add other category lists as needed

  AllCategories({
    required this.dockerCategories, required this.devopsCategories,required this.linuxCategories,required this.sqlCategories,
    required this.bashCategories,
    required this.cmsCategories,
    required this.codeCategories,


  });

  static AllCategories getAllCategories() {
    return AllCategories(
      bashCategories: BashDetailCategory.bashCategoryModel,
      cmsCategories: CmsDetailCategory.cmsCategoryModel,
      codeCategories: CodeDetailCategory.codeCategoryModel,
      dockerCategories:DockerCategoryModel.detailCategoryModel,
      devopsCategories: DevOpsDetailCategory.devOpsCategoryModel,
      linuxCategories: LinuxDetailCategory.linuxCategoryModel,
      sqlCategories: SqlDetailCategory.sqlCategoryModel,
    );
  }

  int get totalQuestions {
    int total = 0;
    total += bashCategories.fold(0, (sum, category) => sum + int.parse(category.totalQuestion));
    total += cmsCategories.fold(0, (sum, category) => sum + int.parse(category.totalQuestion));
    total += codeCategories.fold(0, (sum, category) => sum + int.parse(category.totalQuestion));
    // Add other categories
    return total;
  }

  List<CategoryBase> getAllCategoriesUnfiltered() {
    List<CategoryBase> allCategories = [];

    // Add all categories regardless of difficulty
    allCategories.addAll(bashCategories);
    allCategories.addAll(cmsCategories);
    allCategories.addAll(codeCategories);
    allCategories.addAll(dockerCategories);
    allCategories.addAll(devopsCategories);
    allCategories.addAll(linuxCategories);
    allCategories.addAll(sqlCategories);

    return allCategories;
  }
  List<CategoryBase> getCategoriesByDifficulty(String difficulty) {
    List<CategoryBase> filteredCategories = [];

    filteredCategories.addAll(bashCategories.where((c) => c.difficulty == difficulty));
    filteredCategories.addAll(cmsCategories.where((c) => c.difficulty == difficulty));
    filteredCategories.addAll(codeCategories.where((c) => c.difficulty == difficulty));
    filteredCategories.addAll(dockerCategories.where((c) => c.difficulty == difficulty));
    filteredCategories.addAll(devopsCategories.where((c) => c.difficulty == difficulty));
    filteredCategories.addAll(linuxCategories.where((c) => c.difficulty == difficulty));
    filteredCategories.addAll(sqlCategories.where((c) => c.difficulty == difficulty));


    return filteredCategories;
  }


  List<CategoryBase> searchCategories(String query) {
    query = query.toLowerCase();
    List<CategoryBase> searchResults = [];

    searchResults.addAll(bashCategories.where((c) =>
    c.name.toLowerCase().contains(query) ||
        c.difficulty.toLowerCase().contains(query)));
    searchResults.addAll(cmsCategories.where((c) =>
    c.name.toLowerCase().contains(query) ||
        c.difficulty.toLowerCase().contains(query)));
    searchResults.addAll(codeCategories.where((c) =>
    c.name.toLowerCase().contains(query) ||
        c.difficulty.toLowerCase().contains(query)));
    searchResults.addAll(dockerCategories.where((c) =>
    c.name.toLowerCase().contains(query) ||
        c.difficulty.toLowerCase().contains(query)));
    searchResults.addAll(sqlCategories.where((c) =>
    c.name.toLowerCase().contains(query) ||
        c.difficulty.toLowerCase().contains(query)));
    searchResults.addAll(devopsCategories.where((c) =>
    c.name.toLowerCase().contains(query) ||
        c.difficulty.toLowerCase().contains(query)));
    searchResults.addAll(linuxCategories.where((c) =>
    c.name.toLowerCase().contains(query) ||
        c.difficulty.toLowerCase().contains(query)));


    return searchResults;
  }
}