/// Application constants
/// Contains app-wide configuration values
class AppConstants {
  // API Configuration
  static const String baseUrl = 'https://api.example.com';
  static const int connectTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Cache Configuration
  static const int cacheMaxAge = 3600; // 1 hour in seconds
  static const int maxCacheSize = 100; // Maximum number of cached items

  // UI Configuration
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 8.0;

  // Animation Duration
  static const int animationDuration = 300; // milliseconds
  static const int longAnimationDuration = 500; // milliseconds

  // Text Constraints
  static const int maxUsernameLength = 50;
  static const int maxPasswordLength = 128;
  static const int minPasswordLength = 8;

  // BMI Constants
  static const double underweightThreshold = 18.5;
  static const double normalWeightThreshold = 24.9;
  static const double overweightThreshold = 29.9;

  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userProfileKey = 'user_profile';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language_code';

  // Validation Patterns
  static const String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String passwordPattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d@$!%*?&]{8,}$';

  // Private constructor to prevent instantiation
  AppConstants._();
}
