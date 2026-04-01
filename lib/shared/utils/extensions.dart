import 'package:flutter/material.dart';

/// Common extension methods
/// Reusable utility extensions for common operations
extension StringExtensions on String {
  /// Capitalize first letter
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  /// Check if string is a valid email
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(this);
  }

  /// Check if string contains only numbers
  bool get isNumeric {
    return double.tryParse(this) != null;
  }

  /// Truncate string to specified length with ellipsis
  String truncate(int length, {String suffix = '...'}) {
    if (this.length <= length) return this;
    return '${substring(0, length)}$suffix';
  }

  /// Remove all whitespace
  String get removeAllWhitespace {
    return replaceAll(RegExp(r'\s+'), '');
  }

  /// Convert to title case
  String toTitleCase() {
    return split(' ')
        .map((word) => word.capitalize())
        .join(' ');
  }
}

extension DateTimeExtensions on DateTime {
  /// Format date as readable string
  String toReadableString() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Just now';
        }
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return '${day}/${month}/${year}';
    }
  }

  /// Check if date is today
  bool get isToday {
    final now = DateTime.now();
    return day == now.day && month == now.month && year == now.year;
  }

  /// Check if date is yesterday
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return day == yesterday.day && month == yesterday.month && year == yesterday.year;
  }
}

extension BuildContextExtensions on BuildContext {
  /// Get screen size
  Size get screenSize => MediaQuery.of(this).size;

  /// Get screen width
  double get screenWidth => screenSize.width;

  /// Get screen height
  double get screenHeight => screenSize.height;

  /// Check if device is tablet
  bool get isTablet => screenWidth > 600;

  /// Check if device is mobile
  bool get isMobile => screenWidth <= 600;

  /// Get theme
  ThemeData get theme => Theme.of(this);

  /// Get text theme
  TextTheme get textTheme => theme.textTheme;

  /// Get color scheme
  ColorScheme get colorScheme => theme.colorScheme;

  /// Show snackbar
  void showSnackBar(String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
      ),
    );
  }

  /// Hide keyboard
  void hideKeyboard() {
    FocusScope.of(this).unfocus();
  }
}
