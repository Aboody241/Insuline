// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;

// حط المفتاح بتاعك هنا
const GEMINI_API_KEY = "AIzaSyD5zjIvek6fFeAFnLN8WA3uWKZ5rtxVf7U";

class GeminiService {
  Future<String> getChatResponse(String message) async {
    final apiUrl =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash-latest:generateContent?key=$GEMINI_API_KEY";

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": message},
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data["candidates"][0]["content"]["parts"][0]["text"] ??
          "No response";
    } else {
      throw Exception("Gemini API error: ${response.body}");
    }
  }
}
