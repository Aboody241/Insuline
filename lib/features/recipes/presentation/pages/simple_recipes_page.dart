import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';
import '../widgets/category_chips.dart';
import '../widgets/search_bar.dart';
import '../../../../shared/widgets/states/loading_widget.dart';
import '../../../../shared/widgets/states/error_widget.dart';
import '../../../../shared/widgets/states/empty_state_widget.dart';
import '../../../../core/constants/app_strings.dart';

/// Simple recipes page demonstration
/// Shows the clean architecture structure without BLoC complexity
class SimpleRecipesPage extends StatelessWidget {
  const SimpleRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.recipes),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar placeholder
            const Text(
              'Search Bar Component',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Search functionality with real-time filtering'),
            const SizedBox(height: 16),

            // Category chips placeholder  
            const Text(
              'Category Chips Component',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Horizontal scrollable categories with selection state'),
            const SizedBox(height: 16),

            // Recipe cards placeholder
            const Text(
              'Recipe Cards Component',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Displays recipe information with favorite toggle'),
            const SizedBox(height: 16),

            // Loading state placeholder
            const Text(
              'Loading Widget Component',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Shows loading indicator during data fetching'),
            const SizedBox(height: 16),

            // Error state placeholder
            const Text(
              'Error Widget Component',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Handles error states with retry functionality'),
            const SizedBox(height: 16),

            // Empty state placeholder
            const Text(
              'Empty State Widget Component',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Shows empty state when no data available'),
            const SizedBox(height: 32),

            // Integration info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Theme.of(context).colorScheme.primary),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '✅ Clean Architecture Structure',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Domain Layer: Entities, Repositories, Use Cases'),
                  const Text('Data Layer: Models, DataSources, Repository Impl'),
                  const Text('Logic Layer: BLoC for State Management'),
                  const Text('Presentation Layer: Pages, Widgets'),
                  const SizedBox(height: 16),
                  Text(
                    '🔧 All components are properly separated',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    '📦 Ready for integration with existing app',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
