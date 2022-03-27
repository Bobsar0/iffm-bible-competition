import 'dart:io';

import 'package:http/http.dart' as http;

import '../../exceptions/network_exception.dart';
import '../../utils/logger_service.dart';

class BibleNetworkService {
  static const String _baseUrl = 'https://api.scripture.api.bible/v1';
  static const Map<String, String> _headers = {
    'api-key': '7c0bccb47f519c0d04a27968a3876b0f'
  };

  Future<String> fetchAllTranslations() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/bibles'), headers: _headers);

    if (response.statusCode == HttpStatus.accepted) {
      Logger.logInformative(
          'All translations obtained successfully! response: ${response.body}');
      return response.body;
    } else {
      Logger.logCritical(
          "Could not obtain translations!. Code: ${response.statusCode} | Response: ${response.body}");
      throw NetworkException(
          response.statusCode, "Failed to obtain bible translations");
    }
  }

  Future<String> fetchOneTranslation(String id) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/bibles/$id'), headers: _headers);

    if (response.statusCode == HttpStatus.accepted) {
      Logger.logInformative(
          'Translation with id $id fetched successfully! Response: ${response.body}');
      return response.body;
    } else {
      Logger.logCritical(
          "Could not obtain translation!. Code: ${response.statusCode} | Response: ${response.body}");
      throw NetworkException(
          response.statusCode, "Failed to fetch translation with id: $id");
    }
  }

  Future<String> searchBiblePassage(String id, String query) async {
    final response = await http.get(
        Uri.parse('$_baseUrl/bibles/$id/search?query=$query'),
        headers: _headers);

    if (response.statusCode == HttpStatus.ok) {
      Logger.logInformative(
          '$query fetched successfully! Response: ${response.body}');
      return response.body;
    } else {
      Logger.logCritical(
          "Could not fetch bible passage $query!. Code: ${response.statusCode} | Response: ${response.body}");
      throw NetworkException(
          response.statusCode, "Failed to fetch bible passage: $id");
    }
  }
}
