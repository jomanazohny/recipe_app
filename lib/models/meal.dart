class Meal {
  final String id;
  final String name;
  final String image;
  final String instructions;
  final String category;
  final String area;

  final String ingredient1;
  final String ingredient2;
  final String ingredient3;
  final String ingredient4;
  final String ingredient5;

  Meal({
    required this.id,
    required this.name,
    required this.image,
    required this.instructions,
    required this.category,
    required this.area,

    required this.ingredient1,
    required this.ingredient2,
    required this.ingredient3,
    required this.ingredient4,
    required this.ingredient5,
  });

  factory Meal.fromJson(
      Map<String,dynamic> json){

    return Meal(

      id:
      json["idMeal"] ?? "",

      name:
      json["strMeal"] ?? "",

      image:
      json["strMealThumb"] ?? "",

      instructions:
      json["strInstructions"] ?? "",

      category:
      json["strCategory"] ?? "",

      area:
      json["strArea"] ?? "",

      ingredient1:
      json["strIngredient1"] ?? "",

      ingredient2:
      json["strIngredient2"] ?? "",

      ingredient3:
      json["strIngredient3"] ?? "",

      ingredient4:
      json["strIngredient4"] ?? "",

      ingredient5:
      json["strIngredient5"] ?? "",
    );
  }
}