import 'package:dartz/dartz.dart';
import '../../domain/entities/recipe.dart';
import '../../domain/repositories/recipes_repository.dart';
import '../datasources/recipes_local_datasource.dart';
import '../datasources/recipes_remote_datasource.dart';
import '../models/recipe_model.dart';

/// Implementation of recipes repository
/// Coordinates between remote and local data sources
class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesRemoteDataSource remoteDataSource;
  final RecipesLocalDataSource localDataSource;

  RecipesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<String, List<Recipe>>> getRecipes() async {
    try {
      // Try to get from remote first
      final remoteResult = await remoteDataSource.getRecipes();
      
      return remoteResult.fold(
        (error) async {
          // If remote fails, try to get from cache
          try {
            final cachedRecipes = await localDataSource.getCachedRecipes();
            return Right(cachedRecipes.map((model) => model.toEntity()).toList());
          } catch (e) {
            return Left(error); // Return original remote error
          }
        },
        (recipes) async {
          // Cache the successful remote result
          await localDataSource.cacheRecipes(recipes);
          return Right(recipes.map((model) => model.toEntity()).toList());
        },
      );
    } catch (e) {
      return Left('Unexpected error: $e');
    }
  }

  @override
  Future<Either<String, List<Recipe>>> getRecipesByCategory(String category) async {
    try {
      final remoteResult = await remoteDataSource.getRecipesByCategory(category);
      
      return remoteResult.fold(
        (error) async {
          // If remote fails, try to filter from cache
          try {
            final allCachedRecipes = await localDataSource.getCachedRecipes();
            final filteredRecipes = allCachedRecipes
                .where((recipe) => recipe.category.toLowerCase() == category.toLowerCase())
                .toList();
            return Right(filteredRecipes.map((model) => model.toEntity()).toList());
          } catch (e) {
            return Left(error);
          }
        },
        (recipes) async {
          await localDataSource.cacheRecipes(recipes);
          return Right(recipes.map((model) => model.toEntity()).toList());
        },
      );
    } catch (e) {
      return Left('Unexpected error: $e');
    }
  }

  @override
  Future<Either<String, List<String>>> getCategories() async {
    try {
      final remoteResult = await remoteDataSource.getCategories();
      
      return remoteResult.fold(
        (error) async {
          // If remote fails, try to get from cache
          try {
            final cachedCategories = await localDataSource.getCachedCategories();
            return Right(cachedCategories);
          } catch (e) {
            return Left(error);
          }
        },
        (categories) async {
          await localDataSource.cacheCategories(categories);
          return Right(categories);
        },
      );
    } catch (e) {
      return Left('Unexpected error: $e');
    }
  }

  @override
  Future<Either<String, List<Recipe>>> searchRecipes(String query) async {
    try {
      if (query.trim().isEmpty) {
        return const Left('Search query cannot be empty');
      }

      final remoteResult = await remoteDataSource.searchRecipes(query);
      
      return remoteResult.fold(
        (error) async {
          // If remote fails, try to search in cache
          try {
            final allCachedRecipes = await localDataSource.getCachedRecipes();
            final searchResults = allCachedRecipes
                .where((recipe) => 
                    recipe.name.toLowerCase().contains(query.toLowerCase()) ||
                    recipe.category.toLowerCase().contains(query.toLowerCase()))
                .toList();
            return Right(searchResults.map((model) => model.toEntity()).toList());
          } catch (e) {
            return Left(error);
          }
        },
        (recipes) async {
          return Right(recipes.map((model) => model.toEntity()).toList());
        },
      );
    } catch (e) {
      return Left('Unexpected error: $e');
    }
  }

  @override
  Future<Either<String, Recipe>> toggleFavorite(int recipeId) async {
    try {
      await localDataSource.toggleFavorite(recipeId);
      
      // Get the updated recipe from cache
      final cachedRecipes = await localDataSource.getCachedRecipes();
      final recipeModel = cachedRecipes.firstWhere(
        (r) => r.id == recipeId,
        orElse: () => RecipeModel(
          id: recipeId,
          name: '',
          category: '',
          imageUrl: '',
          instructions: '',
          area: '',
        ),
      );
      
      final isFavorite = await localDataSource.isRecipeFavorite(recipeId);
      final updatedRecipeModel = recipeModel.copyWith(isFavorite: isFavorite);
      
      return Right(updatedRecipeModel);
    } catch (e) {
      return Left('Failed to toggle favorite: $e');
    }
  }

  @override
  Future<Either<String, List<Recipe>>> getFavoriteRecipes() async {
    try {
      final favoriteRecipes = await localDataSource.getFavoriteRecipes();
      return Right(favoriteRecipes.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left('Failed to get favorite recipes: $e');
    }
  }
}
