class Meal {
  String strMeal, strMealThumb, idMeal,
      strCategory, strArea, strInstructions;

  Meal({ this.strMeal, this.strMealThumb, this.idMeal, this.strCategory, this.strArea, this.strInstructions});

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
      strMeal: json["strMeal"],
      strMealThumb: json["strMealThumb"],
      idMeal: json["strMealThumb"],
      strCategory: json["strMealThumb"],
      strArea: json["strMealThumb"],
      strInstructions: json["strMealThumb"]
  );
}