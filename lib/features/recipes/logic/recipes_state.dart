import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../domain/entities/recipe.dart';

@immutable
abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class RecipesInitial extends RecipesState {}

/// Loading state
class RecipesLoading extends RecipesState {}

/// Recipes loaded state
class RecipesLoaded extends RecipesState {
  final List<Recipe> recipes;
  final List<String> categories;
  final String? selectedCategory;
  final List<Recipe> favoriteRecipes;
  final bool isSearchMode;
  final String? searchQuery;

  const RecipesLoaded({
    required this.recipes,
    required this.categories,
    this.selectedCategory,
    this.favoriteRecipes = const [],
    this.isSearchMode = false,
    this.searchQuery,
  });

  @override
  List<Object?> get props => [
        recipes,
        categories,
        selectedCategory,
        favoriteRecipes,
        isSearchMode,
        searchQuery,
      ];

  RecipesLoaded copyWith({
    List<Recipe>? recipes,
    List<String>? categories,
    String? selectedCategory,
    List<Recipe>? favoriteRecipes,
    bool? isSearchMode,
    String? searchQuery,
  }) {
    return RecipesLoaded(
      recipes: recipes ?? this.recipes,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      favoriteRecipes: favoriteRecipes ?? this.favoriteRecipes,
      isSearchMode: isSearchMode ?? this.isSearchMode,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

/// Error state
class RecipesError extends RecipesState {
  final String message;

  const RecipesError(this.message);

  @override
  List<Object?> get props => [message];
}
