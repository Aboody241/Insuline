import '../../../core/constants/app_constants.dart';

/// Common validation functions
/// Reusable across all features for form validation
class Validators {
  Validators._(); // Private constructor

  /// Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    
    final emailRegex = RegExp(AppConstants.emailPattern);
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    
    return null;
  }

  /// Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (value.length < AppConstants.minPasswordLength) {
      return 'Password must be at least ${AppConstants.minPasswordLength} characters';
    }
    
    if (value.length > AppConstants.maxPasswordLength) {
      return 'Password must not exceed ${AppConstants.maxPasswordLength} characters';
    }
    
    return null;
  }

  /// Required field validation
  static String? validateRequired(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Number validation
  static String? validateNumber(String? value, {String fieldName = 'Field'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    
    return null;
  }

  /// Positive number validation
  static String? validatePositiveNumber(String? value, {String fieldName = 'Field'}) {
    final numberError = validateNumber(value, fieldName: fieldName);
    if (numberError != null) return numberError;
    
    final number = double.parse(value!);
    if (number <= 0) {
      return '$fieldName must be greater than 0';
    }
    
    return null;
  }

  /// Phone number validation
  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    
    // Simple phone validation (can be enhanced based on requirements)
    final phoneRegex = RegExp(r'^[\d\s\-\+\(\)]+$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    
    return null;
  }

  /// Username validation
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }
    
    if (value.length > AppConstants.maxUsernameLength) {
      return 'Username must not exceed ${AppConstants.maxUsernameLength} characters';
    }
    
    // Allow only letters, numbers, and underscores
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Username can only contain letters, numbers, and underscores';
    }
    
    return null;
  }
}
