import 'package:flutter/material.dart';
import '../../logic/simple_auth_bloc.dart';

/// Simple authentication page demonstration
/// Shows clean architecture structure without complex UI
class SimpleAuthPage extends StatelessWidget {
  const SimpleAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '✅ Clean Architecture Structure',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            Text(
              'Domain Layer:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const Text('• User entity with business logic'),
            const Text('• Repository contracts'),
            const Text('• Use cases for operations'),
            const SizedBox(height: 24),
            
            Text(
              'Data Layer:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const Text('• Models for API responses'),
            const Text('• Repository implementations'),
            const SizedBox(height: 24),
            
            Text(
              'Logic Layer:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const Text('• BLoC for state management'),
            const Text('• Events and states'),
            const SizedBox(height: 24),
            
            Text(
              'Presentation Layer:',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const Text('• Pages and widgets'),
            const Text('• Clean UI components'),
            const SizedBox(height: 32),
            
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
                    '🎯 Ready for Integration!',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'All authentication components follow clean architecture',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    '• Domain entities are pure business objects',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
