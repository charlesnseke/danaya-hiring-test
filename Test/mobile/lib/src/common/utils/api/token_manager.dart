import 'dart:convert';

import 'package:testtech/src/common/error/exceptions.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../objects/shared_preferences_keys.dart';
import 'api_endpoint.dart';

class TokenManager {
  static Future<bool> refreshAccessToken({
    required Client http,
    required SharedPreferences prefs,
  }) async {
    try {
      var refreshToken = prefs.getString(AppPrefsKeys.authRefreshToken);
      Uri uri = Uri.parse('${ApiEndpoint.baseUrlPublic}/auth/refresh-token');

      final response = await http.post(
        uri,
        body: json.encode({'refreshToken': refreshToken}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        String source = const Utf8Decoder().convert(response.bodyBytes);
        final data = json.decode(source);
        await prefs.setString(AppPrefsKeys.authToken, data['accessToken']);
        await prefs.setString(
            AppPrefsKeys.authRefreshToken, data['refreshToken']);
        return true;
      }

      if (response.statusCode == 401) {
        throw AppException(message: 'Session expirée! Veuillez vous reconnecter svp!');
      }

      return false;
    } catch (err) {
      throw AppException(message: 'Erreur de session! Veuillez vous reconnecter svp!');
    }
  }
}
