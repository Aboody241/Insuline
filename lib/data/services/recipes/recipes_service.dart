import 'dart:convert';

import 'package:http/http.dart' as http;

class RecipesService {
  static const String baseUrl = "https://www.themealdb.com/api/json/v1/1/";
  static const Duration duration = Duration(seconds: 3);

  Future<dynamic> getRecipes() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/filter.php?c=Chicken'),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw NetworkError('Failed to load recipes');
      }
    } catch (e) {
      throw NetworkError('Network error: $e');
    }
  }
}

class NetworkError {
  final String message;

  NetworkError(this.message);

  @override
  String toString() => message;
}
