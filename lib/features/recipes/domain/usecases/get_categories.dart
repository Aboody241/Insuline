import 'package:dartz/dartz.dart';
import '../repositories/recipes_repository.dart';

/// Get categories use case
/// Handles the business logic for retrieving recipe categories
class GetCategories {
  final RecipesRepository repository;

  GetCategories(this.repository);

  /// Execute the use case
  /// Returns either an error message (Left) or a list of categories (Right)
  Future<Either<String, List<String>>> call() {
    return repository.getCategories();
  }
}
