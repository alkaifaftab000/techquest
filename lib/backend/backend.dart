import 'package:http/http.dart' as http;
import 'package:techquest/model/quiz_model.dart';

class QuizController {
  Future<List<QuizQuestion>> fetchQuizQuestions(String cat , String limit,String diff) async {
    try {
      const apiKey = 'DxrKmBoteFNr3SsmbT41onr1uC7PxwRqDVptpaR6';
      final url = 'https://quizapi.io/api/v1/questions?apiKey=$apiKey&category=$cat&difficulty=$diff&limit=$limit';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return quizQuestionFromJson(response.body);
      } else {
        throw Exception('Failed to load quiz questions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching quiz questions: $e');
    }
  }
}