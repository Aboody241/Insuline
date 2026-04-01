import 'package:dartz/dartz.dart';
import '../entities/recipe.dart';
import '../repositories/recipes_repository.dart';

/// Get recipes use case
/// Handles the business logic for retrieving recipes
class GetRecipes {
  final RecipesRepository repository;

  GetRecipes(this.repository);

  /// Execute the use case
  /// Returns either an error message (Left) or a list of recipes (Right)
  Future<Either<String, List<Recipe>>> call(String? category) {
    if (category == null || category == 'All') {
      return repository.getRecipes();
    } else {
      return repository.getRecipesByCategory(category);
    }
  }
}
