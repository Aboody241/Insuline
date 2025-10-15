import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:insulin95/features/recipes/widgets/models/recipes_class.dart';

class RecipesCache {
  static List<RecipesClass>? recipes;
  static String? lastCategory;
}

class RecipesService {
  static const String _base = "https://www.themealdb.com/api/json/v1/1/";

  /// fetch recipes by category with simple in-memory cache
  static Future<List<RecipesClass>> fetchRecipes(String category, {http.Client? client}) async {
    final httpClient = client ?? http.Client();

    // return cache if same category
    if (RecipesCache.recipes != null && RecipesCache.lastCategory == category) {
      return RecipesCache.recipes!;
    }

    final url = (category == "All")
        ? "${_base}search.php?s="
        : "${_base}filter.php?c=${Uri.encodeComponent(category)}";

    final response = await httpClient.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception("Failed to load recipes (status ${response.statusCode})");
    }

    final Map<String, dynamic>? jsonBody = json.decode(response.body) as Map<String, dynamic>?;

    final List<dynamic>? items = jsonBody?['meals'] as List<dynamic>?;

    if (items == null) {
      // no meals found → clear cache for category and return empty list
      RecipesCache.recipes = <RecipesClass>[];
      RecipesCache.lastCategory = category;
      return <RecipesClass>[];
    }

    final recipes = items.map((e) {
      return RecipesClass.fromJson(e as Map<String, dynamic>);
    }).toList();

    // save to cache
    RecipesCache.recipes = recipes;
    RecipesCache.lastCategory = category;

    return recipes;
  }
}
