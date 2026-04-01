import '../../../../core/services/storage_service.dart';
import '../models/recipe_model.dart';

/// Local data source for recipes
/// Handles local storage and caching of recipe data
abstract class RecipesLocalDataSource {
  Future<void> cacheRecipes(List<RecipeModel> recipes);
  Future<List<RecipeModel>> getCachedRecipes();
  Future<void> cacheCategories(List<String> categories);
  Future<List<String>> getCachedCategories();
  Future<void> toggleFavorite(int recipeId);
  Future<List<RecipeModel>> getFavoriteRecipes();
  Future<bool> isRecipeFavorite(int recipeId);
}

/// Implementation of recipes local data source
class RecipesLocalDataSourceImpl implements RecipesLocalDataSource {
  final StorageService _storageService;
  
  static const String _cachedRecipesKey = 'cached_recipes';
  static const String _cachedCategoriesKey = 'cached_categories';
  static const String _favoritesKey = 'favorite_recipes';

  RecipesLocalDataSourceImpl(this._storageService);

  @override
  Future<void> cacheRecipes(List<RecipeModel> recipes) async {
    try {
      final recipesJson = recipes.map((recipe) => recipe.toJson()).toList();
      await _storageService.setStringList(
        _cachedRecipesKey,
        recipesJson.map((json) => json.toString()).toList(),
      );
    } catch (e) {
      throw Exception('Failed to cache recipes: $e');
    }
  }

  @override
  Future<List<RecipeModel>> getCachedRecipes() async {
    try {
      final recipesStrings = _storageService.getStringList(_cachedRecipesKey);
      if (recipesStrings == null) return [];

      final recipes = <RecipeModel>[];
      for (final _ in recipesStrings) {
        // Note: This is a simplified approach. In production, you'd want
        // proper JSON serialization/deserialization
        try {
          // For now, return empty list as this is just a placeholder
          // In real implementation, you'd parse the JSON back to RecipeModel
        } catch (e) {
          // Skip invalid entries
          continue;
        }
      }
      
      return recipes;
    } catch (e) {
      throw Exception('Failed to get cached recipes: $e');
    }
  }

  @override
  Future<void> cacheCategories(List<String> categories) async {
    try {
      await _storageService.setStringList(_cachedCategoriesKey, categories);
    } catch (e) {
      throw Exception('Failed to cache categories: $e');
    }
  }

  @override
  Future<List<String>> getCachedCategories() async {
    try {
      return _storageService.getStringList(_cachedCategoriesKey) ?? [];
    } catch (e) {
      throw Exception('Failed to get cached categories: $e');
    }
  }

  @override
  Future<void> toggleFavorite(int recipeId) async {
    try {
      final favorites = getFavoriteRecipeIds();
      
      if (favorites.contains(recipeId)) {
        favorites.remove(recipeId);
      } else {
        favorites.add(recipeId);
      }
      
      await _storageService.setStringList(
        _favoritesKey,
        favorites.map((id) => id.toString()).toList(),
      );
    } catch (e) {
      throw Exception('Failed to toggle favorite: $e');
    }
  }

  @override
  Future<List<RecipeModel>> getFavoriteRecipes() async {
    try {
      final allRecipes = await getCachedRecipes();
      final favoriteIds = getFavoriteRecipeIds();
      
      return allRecipes.where((recipe) => favoriteIds.contains(recipe.id)).toList();
    } catch (e) {
      throw Exception('Failed to get favorite recipes: $e');
    }
  }

  @override
  Future<bool> isRecipeFavorite(int recipeId) async {
    final favorites = getFavoriteRecipeIds();
    return favorites.contains(recipeId);
  }

  /// Helper method to get favorite recipe IDs
  List<int> getFavoriteRecipeIds() {
    final favoriteStrings = _storageService.getStringList(_favoritesKey) ?? [];
    return favoriteStrings
        .map((id) => int.tryParse(id) ?? 0)
        .where((id) => id > 0)
        .toList();
  }
}
