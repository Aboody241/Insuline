import 'package:flutter/material.dart';

/// Generic loading widget
/// Reusable across all features for consistent loading states
class LoadingWidget extends StatelessWidget {
  final double? size;
  final Color? color;
  final String? message;

  const LoadingWidget({
    super.key,
    this.size,
    this.color,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size ?? 24,
            height: size ?? 24,
            child: CircularProgressIndicator(
              color: color ?? theme.colorScheme.primary,
              strokeWidth: 2,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
