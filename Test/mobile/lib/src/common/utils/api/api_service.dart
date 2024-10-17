import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'api_helpers.dart';

abstract class ApiService {
  Future<dynamic> get({required bool secure, required Uri uri});

  Future<dynamic> post(
      {required bool secure, required Uri uri, required String? body});
}

class ApiServiceImpl implements ApiService {
  ApiServiceImpl({
    required http.Client httpClient,
    required SharedPreferences prefs,
  })  : _http = httpClient,
        _prefs = prefs;

  final http.Client _http;
  final SharedPreferences _prefs;
  final timeout = const Duration(seconds: 20);
  final _statusCodes = {400, 403, 404};

  @override
  Future<dynamic> get({required bool secure, required Uri uri}) async {
    final header = ApiHelpers.reqHeaders(secure: secure, prefs: _prefs);

    return ApiHelpers.executeRequest(request: () async {
      final res = await _http.get(uri, headers: header).timeout(timeout);

      return ApiHelpers.handleApiResponse(
        http: _http,
        res: res,
        statusCodes: _statusCodes,
        prefs: _prefs,
      );
    });
  }

  @override
  Future<dynamic> post({
    required bool secure,
    required Uri uri,
    required String? body,
  }) async {
    final header = ApiHelpers.reqHeaders(secure: secure, prefs: _prefs);

    return ApiHelpers.executeRequest(request: () async {
      final res =
          await _http.post(uri, headers: header, body: body).timeout(timeout);

      return ApiHelpers.handleApiResponse(
        http: _http,
        res: res,
        statusCodes: _statusCodes,
        prefs: _prefs,
      );
    });
  }
}
