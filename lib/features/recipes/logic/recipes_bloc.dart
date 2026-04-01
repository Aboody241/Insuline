import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../domain/entities/recipe.dart';
import '../domain/usecases/get_recipes.dart';
import '../domain/usecases/get_categories.dart';
import '../domain/usecases/search_recipes.dart' as usecases;
import 'recipes_event.dart';
import 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final GetRecipes _getRecipes;
  final GetCategories _getCategories;
  final usecases.SearchRecipes _searchRecipes;

  RecipesBloc({
    required GetRecipes getRecipes,
    required GetCategories getCategories,
    required usecases.SearchRecipes searchRecipes,
  })  : _getRecipes = getRecipes,
        _getCategories = getCategories,
        _searchRecipes = searchRecipes,
        super(RecipesInitial()) {
    on<LoadRecipes>(_onLoadRecipes);
    on<LoadCategories>(_onLoadCategories);
    on<SearchRecipes>(_onSearchRecipes);
    on<ToggleFavorite>(_onToggleFavorite);
    on<LoadFavoriteRecipes>(_onLoadFavoriteRecipes);
    on<RefreshRecipes>(_onRefreshRecipes);
    on<ClearSearch>(_onClearSearch);
  }

  /// Load recipes (all or by category)
  Future<void> _onLoadRecipes(
    LoadRecipes event,
    Emitter<RecipesState> emit,
  ) async {
    emit(RecipesLoading());
    
    // Load categories first if not already loaded
    if (state is! RecipesLoaded || (state as RecipesLoaded).categories.isEmpty) {
      await _loadCategories(emit);
    }

    final result = await _getRecipes(event.category);
    
    result.fold(
      (error) => emit(RecipesError(error)),
      (recipes) {
        if (state is RecipesLoaded) {
          final currentState = state as RecipesLoaded;
          emit(currentState.copyWith(
            recipes: recipes,
            selectedCategory: event.category,
            isSearchMode: false,
            searchQuery: null,
          ));
        } else {
          emit(RecipesLoaded(
            recipes: recipes,
            categories: [],
            selectedCategory: event.category,
          ));
        }
      },
    );
  }

  /// Load categories
  Future<void> _onLoadCategories(
    LoadCategories event,
    Emitter<RecipesState> emit,
  ) async {
    await _loadCategories(emit);
  }

  /// Search recipes
  Future<void> _onSearchRecipes(
    SearchRecipes event,
    Emitter<RecipesState> emit,
  ) async {
    if (event.query.trim().isEmpty) {
      // Clear search if query is empty
      if (state is RecipesLoaded) {
        final currentState = state as RecipesLoaded;
        emit(currentState.copyWith(
          isSearchMode: false,
          searchQuery: null,
        ));
      }
      return;
    }

    emit(RecipesLoading());
    
    final result = await _searchRecipes(event.query);
    
    result.fold(
      (error) => emit(RecipesError(error)),
      (recipes) {
        if (state is RecipesLoaded) {
          final currentState = state as RecipesLoaded;
          emit(currentState.copyWith(
            recipes: recipes,
            isSearchMode: true,
            searchQuery: event.query,
          ));
        } else {
          emit(RecipesLoaded(
            recipes: recipes,
            categories: [],
            isSearchMode: true,
            searchQuery: event.query,
          ));
        }
      },
    );
  }

  /// Toggle favorite status
  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<RecipesState> emit,
  ) async {
    if (state is! RecipesLoaded) return;

    final currentState = state as RecipesLoaded;
    
    // Update the favorite status in the current recipes list
    final updatedRecipes = currentState.recipes.map((recipe) {
      if (recipe.id == event.recipeId) {
        return recipe.copyWith(isFavorite: !recipe.isFavorite);
      }
      return recipe;
    }).toList();

    // Update in favorites list
    final updatedFavorites = currentState.favoriteRecipes.where(
      (recipe) => recipe.id != event.recipeId,
    ).toList();

    final toggledRecipe = updatedRecipes.firstWhere(
      (recipe) => recipe.id == event.recipeId,
    );

    if (toggledRecipe.isFavorite) {
      updatedFavorites.add(toggledRecipe);
    }

    emit(currentState.copyWith(
      recipes: updatedRecipes,
      favoriteRecipes: updatedFavorites,
    ));
  }

  /// Load favorite recipes
  Future<void> _onLoadFavoriteRecipes(
    LoadFavoriteRecipes event,
    Emitter<RecipesState> emit,
  ) async {
    if (state is! RecipesLoaded) return;

    final currentState = state as RecipesLoaded;
    emit(currentState.copyWith(recipes: currentState.favoriteRecipes));
  }

  /// Refresh recipes
  Future<void> _onRefreshRecipes(
    RefreshRecipes event,
    Emitter<RecipesState> emit,
  ) async {
    add(LoadRecipes(category: event.category));
  }

  /// Clear search
  Future<void> _onClearSearch(
    ClearSearch event,
    Emitter<RecipesState> emit,
  ) async {
    if (state is! RecipesLoaded) return;

    final currentState = state as RecipesLoaded;
    emit(currentState.copyWith(
      isSearchMode: false,
      searchQuery: null,
    ));
  }

  /// Helper method to load categories
  Future<void> _loadCategories(Emitter<RecipesState> emit) async {
    final result = await _getCategories();
    
    result.fold(
      (error) {
        // Don't emit error state, just continue without categories
        // Categories are not critical for basic functionality
      },
      (categories) {
        if (state is RecipesLoaded) {
          final currentState = state as RecipesLoaded;
          emit(currentState.copyWith(categories: categories));
        }
      },
    );
  }
}
