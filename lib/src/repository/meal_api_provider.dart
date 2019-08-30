import 'package:bloclearn/src/models/baseresponse.dart';
import 'package:dio/dio.dart';

class MealApiProvider {
  final String _endpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert";
  final Dio _dio = Dio();

  Future<BaseResponse<List<dynamic>>> getMeal() async {
    try {
      Response response = await _dio.get(_endpoint);
      return BaseResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}