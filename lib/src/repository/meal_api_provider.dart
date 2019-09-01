import 'package:bloclearn/src/models/baseresponse.dart';
import 'package:bloclearn/src/models/meal.dart';
import 'package:dio/dio.dart';

class MealApiProvider {
  final String _endpoint = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Dessert";
  final Dio _dio = Dio();

  Future<BaseResponse<List<Meal>>> getMeal() async {
    try {
      Response response = await _dio.get(_endpoint);
      BaseResponse<List<dynamic>> data = BaseResponse.fromJson(response.data);

      return new BaseResponse(
        meals: List<Meal>.from(data.meals.map((x) => Meal.fromJson(x)))
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}