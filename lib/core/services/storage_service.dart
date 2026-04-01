import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Local storage service wrapper
/// Provides type-safe methods for storing and retrieving data
class StorageService {
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  /// Save a string value
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  /// Get a string value
  String? getString(String key) {
    return _prefs.getString(key);
  }

  /// Save a boolean value
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  /// Get a boolean value
  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  /// Save an integer value
  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  /// Get an integer value
  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  /// Save a double value
  Future<bool> setDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }

  /// Get a double value
  double? getDouble(String key) {
    return _prefs.getDouble(key);
  }

  /// Save a string list
  Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  /// Get a string list
  List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }

  /// Remove a value
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  /// Clear all data
  Future<bool> clear() async {
    return await _prefs.clear();
  }

  /// Check if a key exists
  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }

  // Common app-specific methods
  Future<bool> setUserToken(String token) {
    return setString(AppConstants.userTokenKey, token);
  }

  String? getUserToken() {
    return getString(AppConstants.userTokenKey);
  }

  Future<bool> removeUserToken() {
    return remove(AppConstants.userTokenKey);
  }

  Future<bool> setThemeMode(String theme) {
    return setString(AppConstants.themeKey, theme);
  }

  String? getThemeMode() {
    return getString(AppConstants.themeKey);
  }

  Future<bool> setLanguageCode(String language) {
    return setString(AppConstants.languageKey, language);
  }

  String? getLanguageCode() {
    return getString(AppConstants.languageKey);
  }
}
