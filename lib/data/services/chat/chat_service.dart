// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;

// ⚠️ يفضّل ما تحطش المفتاح داخل التطبيق النهائي.
// استخدم خادم وسيط أو تخزين آمن. مؤقتًا:
const GEMINI_API_KEY = "AIzaSyCMJ6BjspQDd5l219kQcJANKsuEzvovXB4";

// اختَر الموديل المناسب لك
const GEMINI_MODEL = "gemini-2.5-pro";

// Endpoint الصحيح: v1 بدل v1beta
const String _BASE_URL =
    "https://generativelanguage.googleapis.com/v1/models";

class GeminiService {
  Future<String> getChatResponse(String message) async {
    final uri = Uri.parse("$_BASE_URL/$GEMINI_MODEL:generateContent");

    final payload = {
      "contents": [
        {
          "role": "user",
          "parts": [
            {"text": message}
          ]
        }
      ]
    };

    final response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        // استخدام الهيدر للمفتاح بدل query param
        "x-goog-api-key": GEMINI_API_KEY,
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // استخراج آمن للنص من candidates
      final candidates = data["candidates"] as List?;
      if (candidates == null || candidates.isEmpty) {
        return "No response";
      }

      final content = candidates[0]["content"];
      final parts = content?["parts"] as List?;
      final text = (parts != null && parts.isNotEmpty)
          ? (parts[0]["text"] as String? ?? "No response")
          : "No response";

      return text.trim().isEmpty ? "No response" : text;
    } else {
      // يسهّل عليك تتبع الخطأ
      throw Exception(
          "Gemini API error (${response.statusCode}): ${response.body}");
    }
  }
}
