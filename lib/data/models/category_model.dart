class Category {
  final String name;

  Category({required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(name: json['strCategory']);
  }
}

class Meal {
  final String id;
  final String name;
  final String thumbnail;

  Meal({required this.id, required this.name, required this.thumbnail});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
    );
  }
}
