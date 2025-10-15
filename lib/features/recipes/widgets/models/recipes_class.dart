class RecipesCache {
  static List<dynamic>? recipes; // هنا هيتخزن آخر Data
  static String? lastCategory;  // عشان لو حابب تخزن مع الـ category
}

class RecipesClass {
  final String id;
  final String name;
  final String thumbnail;

  RecipesClass({
    required this.id,
    required this.name,
    required this.thumbnail,
  });

  factory RecipesClass.fromJson(Map<String, dynamic> json) {
    return RecipesClass(
      id: json['idMeal']?.toString() ?? '',
      name: json['strMeal']?.toString() ?? '',
      thumbnail: json['strMealThumb']?.toString() ?? '',
    );
  }
}
