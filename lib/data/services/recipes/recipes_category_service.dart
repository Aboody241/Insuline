import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insulin95/data/models/category_model.dart';

class RecipesService {
  static Future<List<String>> fetchCategories() async {
    final url = Uri.parse(
      "https://www.themealdb.com/api/json/v1/1/list.php?c=list",
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List categories = data["meals"];
      return categories.map((cat) => cat["strCategory"] as String).toList();
    } else {
      throw Exception("Failed to load categories");
    }
  }
}

class MealApi {
  static const baseUrl = "https://www.themealdb.com/api/json/v1/1/";

  /// Get Categories
  static Future<List<String>> getCategories() async {
    final response = await http.get(Uri.parse("${baseUrl}list.php?c=list"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List categories = data["meals"];
      return ["All", ...categories.map((c) => c["strCategory"]).toList()];
    } else {
      throw Exception("Failed to load categories");
    }
  }

  /// Get Meals by Category
  static Future<List<Meal>> getMealsByCategory(String category) async {
    String url = category == "All"
        ? "${baseUrl}search.php?s=" // all meals
        : "${baseUrl}filter.php?c=$category";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List meals = data["meals"];
      return meals.map((m) => Meal.fromJson(m)).toList();
    } else {
      throw Exception("Failed to load meals");
    }
  }
}
