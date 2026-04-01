import 'package:dartz/dartz.dart';
import '../entities/recipe.dart';
import '../repositories/recipes_repository.dart';

/// Search recipes use case
/// Handles the business logic for searching recipes by name
class SearchRecipes {
  final RecipesRepository repository;

  SearchRecipes(this.repository);

  /// Execute the use case
  /// Returns either an error message (Left) or a list of recipes (Right)
  Future<Either<String, List<Recipe>>> call(String query) {
    return repository.searchRecipes(query);
  }
}
