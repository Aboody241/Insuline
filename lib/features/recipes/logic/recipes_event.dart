import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object?> get props => [];
}

/// Load recipes event
class LoadRecipes extends RecipesEvent {
  final String? category;

  const LoadRecipes({this.category});

  @override
  List<Object?> get props => [category];
}

/// Load categories event
class LoadCategories extends RecipesEvent {}

/// Search recipes event
class SearchRecipes extends RecipesEvent {
  final String query;

  const SearchRecipes(this.query);

  @override
  List<Object> get props => [query];
}

/// Toggle favorite event
class ToggleFavorite extends RecipesEvent {
  final int recipeId;

  const ToggleFavorite(this.recipeId);

  @override
  List<Object> get props => [recipeId];
}

/// Load favorite recipes event
class LoadFavoriteRecipes extends RecipesEvent {}

/// Refresh recipes event
class RefreshRecipes extends RecipesEvent {
  final String? category;

  const RefreshRecipes({this.category});

  @override
  List<Object?> get props => [category];
}

/// Clear search event
class ClearSearch extends RecipesEvent {}
