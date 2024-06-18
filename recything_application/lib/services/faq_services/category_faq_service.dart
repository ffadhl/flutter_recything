import 'package:dio/dio.dart';
import 'package:recything_application/constants/api_key_constant.dart';
import 'package:recything_application/models/faq/category_faq_model.dart';
import 'package:recything_application/utils/shared_pref.dart';

class CategoryFaqService {
  final Dio dio = Dio();
  var baseUrl = recythingBaseUrl;

  Future<CategoryFaqModel> getCategoryFaq({required String name}) async {
    try {
      var url = '$baseUrl/faqs/category?name=$name';
      String? authToken = await SharedPref.getToken();
      if (authToken == null) {
        throw Exception('Tidak ada token yang ditemukan');
      }

      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return CategoryFaqModel.fromJson(response.data);
      } else if (response.statusCode == 401) {
        throw Exception(response.data['message'] ?? 'Unauthorized');
      } else {
        throw Exception('Failed to load data');
      }
    } on DioException catch (e) {
      throw Exception('Failed to load FAQs: ${e.error}');
    }
  }
}
