import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/recipes_bloc.dart';
import '../../logic/recipes_state.dart';
import '../../../../core/assets/colors.dart';

/// Category chips widget
/// Displays horizontal scrollable category filter chips
class CategoryChips extends StatelessWidget {
  final List<String> categories;
  final String? selectedCategory;
  final Function(String) onCategorySelected;

  const CategoryChips({
    super.key,
    required this.categories,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == selectedCategory;

          return GestureDetector(
            onTap: () => onCategorySelected(category),
            child: CategoryAnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: isSelected 
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  category,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isSelected
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Animated container for category chips
class CategoryAnimatedContainer extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final Decoration decoration;

  const CategoryAnimatedContainer({
    super.key,
    required this.child,
    required this.duration,
    required this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      decoration: decoration,
      child: child,
    );
  }
}
