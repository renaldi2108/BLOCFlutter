import 'package:bloclearn/src/models/baseresponse.dart';
import 'package:bloclearn/src/repository/meal_api_provider.dart';

class Repository {
  MealApiProvider _apiProvider = MealApiProvider();

  Future<BaseResponse<List<dynamic>>> getMeal() {
    return _apiProvider.getMeal();
  }
}