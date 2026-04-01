import 'package:dartz/dartz.dart';
import '../../../../core/services/api_client.dart';
import '../models/recipe_model.dart';

/// Remote data source for recipes
/// Handles API communication with external recipe services
abstract class RecipesRemoteDataSource {
  Future<Either<String, List<RecipeModel>>> getRecipes();
  Future<Either<String, List<RecipeModel>>> getRecipesByCategory(String category);
  Future<Either<String, List<String>>> getCategories();
  Future<Either<String, List<RecipeModel>>> searchRecipes(String query);
}

/// Implementation of recipes remote data source
class RecipesRemoteDataSourceImpl implements RecipesRemoteDataSource {
  final ApiClient _apiClient;
  
  // Using TheMealDB API as example (can be replaced with actual API)
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  RecipesRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<String, List<RecipeModel>>> getRecipes() async {
    try {
      final result = await _apiClient.get('${_baseUrl}filter.php?c=Chicken');
      
      if (result['meals'] != null) {
        final meals = result['meals'] as List;
        final recipes = meals.map((meal) => RecipeModel.fromJson(meal)).toList();
        return Right(recipes);
      } else {
        return const Left('No recipes found');
      }
    } catch (e) {
      return Left('Failed to fetch recipes: $e');
    }
  }

  @override
  Future<Either<String, List<RecipeModel>>> getRecipesByCategory(String category) async {
    try {
      final result = await _apiClient.get('${_baseUrl}filter.php?c=$category');
      
      if (result['meals'] != null) {
        final meals = result['meals'] as List;
        final recipes = meals.map((meal) => RecipeModel.fromJson(meal)).toList();
        return Right(recipes);
      } else {
        return Left('No recipes found for category: $category');
      }
    } catch (e) {
      return Left('Failed to fetch recipes by category: $e');
    }
  }

  @override
  Future<Either<String, List<String>>> getCategories() async {
    try {
      final result = await _apiClient.get('${_baseUrl}categories.php');
      
      if (result['categories'] != null) {
        final categories = result['categories'] as List;
        final categoryNames = categories
            .map((category) => category['strCategory'] as String)
            .toList();
        return Right(categoryNames);
      } else {
        return const Left('No categories found');
      }
    } catch (e) {
      return Left('Failed to fetch categories: $e');
    }
  }

  @override
  Future<Either<String, List<RecipeModel>>> searchRecipes(String query) async {
    try {
      final result = await _apiClient.get('${_baseUrl}search.php?s=$query');
      
      if (result['meals'] != null) {
        final meals = result['meals'] as List;
        final recipes = meals.map((meal) => RecipeModel.fromJson(meal)).toList();
        return Right(recipes);
      } else {
        return Left('No recipes found for search: $query');
      }
    } catch (e) {
      return Left('Failed to search recipes: $e');
    }
  }
}
