class BaseResponse<T> {
  T meals;

  BaseResponse({this.meals});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    if (T == List) {
      return BaseResponse<T>(
          meals: new List<dynamic>.from(json["meals"]) as T
      );
    } else {
      return BaseResponse<T>(
          meals: new Map<String, dynamic>.from(json["meals"]) as T
      );
    }
  }
}