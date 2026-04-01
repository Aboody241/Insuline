import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/app_constants.dart';

/// HTTP API Client wrapper
/// Provides a centralized way to make HTTP requests with consistent configuration
class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  /// Make GET request
  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint');
      
      final response = await _client
          .get(uri)
          .timeout(Duration(milliseconds: AppConstants.connectTimeout));

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('Network error: $e');
    }
  }

  /// Make POST request
  Future<Map<String, dynamic>> post(String endpoint, {Map<String, dynamic>? data}) async {
    try {
      final uri = Uri.parse('${AppConstants.baseUrl}$endpoint');
      
      final response = await _client
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: data != null ? jsonEncode(data) : null,
          )
          .timeout(Duration(milliseconds: AppConstants.connectTimeout));

      return _handleResponse(response);
    } catch (e) {
      throw ApiException('Network error: $e');
    }
  }

  /// Handle HTTP response
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw ApiException('HTTP ${response.statusCode}: ${response.reasonPhrase}');
    }
  }

  /// Close the HTTP client
  void close() {
    _client.close();
  }
}

/// Custom API exception
class ApiException implements Exception {
  final String message;

  const ApiException(this.message);

  @override
  String toString() => message;
}
