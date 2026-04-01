import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/recipes_bloc.dart';
import '../../logic/recipes_event.dart';
import '../../logic/recipes_state.dart';
import '../../../../core/services/service_locator.dart';
import '../widgets/recipe_card.dart';
import '../widgets/category_chips.dart';
import '../widgets/search_bar.dart';
import '../../../../shared/widgets/states/loading_widget.dart';
import '../../../../shared/widgets/states/error_widget.dart';
import '../../../../shared/widgets/states/empty_state_widget.dart';
import '../../../../core/constants/app_strings.dart';

/// Recipes page
/// Main page for browsing and searching recipes
class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.recipes),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Navigate to favorites
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => sl<RecipesBloc>(),
        child: const RecipesView(),
      ),
    );
  }
}

/// Main recipes view widget
/// Handles the UI state and user interactions
class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Load initial data
    context.read<RecipesBloc>().add(LoadCategories());
    context.read<RecipesBloc>().add(const LoadRecipes());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            if (state is RecipesLoaded) {
              final currentState = state as RecipesLoaded;
              context.read<RecipesBloc>().add(
                RefreshRecipes(category: currentState.selectedCategory),
              );
            }
          },
          child: _buildBody(context, state),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context, RecipesState state) {
    if (state is RecipesLoading) {
      return const LoadingWidget(message: 'Loading recipes...');
    }

    if (state is RecipesError) {
      final errorState = state as RecipesError;
      return AppErrorWidget(
        message: errorState.message,
        onRetry: () {
          context.read<RecipesBloc>().add(const LoadRecipes());
        },
      );
    }

    if (state is RecipesLoaded) {
      final loadedState = state as RecipesLoaded;
      return Column(
        children: [
          // Search bar
          RecipeSearchBar(
            onChanged: (query) {
              if (query.isNotEmpty) {
                context.read<RecipesBloc>().add(SearchRecipes(query));
              } else {
                context.read<RecipesBloc>().add(ClearSearch());
              }
            },
          ),
          const SizedBox(height: 16),

          // Category chips
          if (loadedState.categories.isNotEmpty)
            CategoryChips(
              categories: ['All', ...loadedState.categories],
              selectedCategory: loadedState.selectedCategory,
              onCategorySelected: (category) {
                context.read<RecipesBloc>().add(LoadRecipes(category: category));
              },
            ),
          const SizedBox(height: 16),

          // Recipes list
          Expanded(
            child: loadedState.recipes.isEmpty
                ? const EmptyStateWidget(
                    message: 'No recipes found',
                    icon: Icon(Icons.restaurant_outlined),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: loadedState.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = loadedState.recipes[index];
                      return RecipeCard(
                        recipe: recipe,
                        onTap: () {
                          // Navigate to recipe details
                        },
                        onFavoriteTap: () {
                          context.read<RecipesBloc>().add(
                            ToggleFavorite(recipe.id),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      );
    }

    return const LoadingWidget();
  }
}
