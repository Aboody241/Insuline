import 'package:dartz/dartz.dart';
import '../entities/recipe.dart';

/// Recipes repository abstract class
/// Defines the contract for recipe data operations
abstract class RecipesRepository {
  /// Get all recipes
  Future<Either<String, List<Recipe>>> getRecipes();

  /// Get recipes by category
  Future<Either<String, List<Recipe>>> getRecipesByCategory(String category);

  /// Get all available categories
  Future<Either<String, List<String>>> getCategories();

  /// Search recipes by name
  Future<Either<String, List<Recipe>>> searchRecipes(String query);

  /// Toggle favorite status of a recipe
  Future<Either<String, Recipe>> toggleFavorite(int recipeId);

  /// Get favorite recipes
  Future<Either<String, List<Recipe>>> getFavoriteRecipes();
}
