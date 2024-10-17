import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../error/exceptions.dart';
import '../../objects/shared_preferences_keys.dart';
import 'token_manager.dart';

class ApiHelpers {
  static Future<dynamic> executeRequest({
    required Future<dynamic> Function() request,
  }) async {
    try {
      return await request();
    } catch (err) {
      if (err is TimeoutException) {
        throw Exception('Dépassement du délai de la requête');
      } else if (err is SocketException) {
        throw Exception('Oups, erreur serveur. Réessayez plus tard!');
      } else if (err is AppException) {
        throw Exception(err.message);
      } else {
        debugPrint("error1 ===> ${err.toString()}");
        throw Exception("Oups, quelque chose s'est mal passé!");
      }
    }
  }

  static Future<dynamic> handleApiResponse({
    required Client http,
    required Response res,
    required Set<int> statusCodes,
    required SharedPreferences prefs,
  }) async {
    if (res.statusCode == 401) {
      final tokenRefreshed =
          await TokenManager.refreshAccessToken(http: http, prefs: prefs);
      if (tokenRefreshed) {
        throw AppException(message: 'Erreur, veuillez réessayer svp!');
      }
      throw AppException(message: 'Échec, veuillez vous reconnecter svp!');
    }

    String source = const Utf8Decoder().convert(res.bodyBytes);

   // print("source ==> ${source}");

    if (res.headers['content-type']!.contains('application/json') || res.headers['content-type']!.contains('application/vnd.api.v1+json')) {
      var data = json.decode(source);

     /*  if (res.statusCode == 200 || res.statusCode == 201) {
        
      } */

      if (statusCodes.contains(res.statusCode)) {
        throw AppException(message: data['message']);
      }
      
      return data;
    } else {
      return source;
    }

    throw AppException(message: 'Erreur, de la requête!');
  }

  static Map<String, String> reqHeaders({
    required bool secure,
    required SharedPreferences prefs,
  }) {
    if (secure) {
      var token = prefs.getString(AppPrefsKeys.authToken);
      return {
        // 'Accept-Language': 'fr',
        'Content-Type': 'application/json',
        'Authorization': token ?? ''
      };
    }
    return {'Content-Type': 'application/json'};
  }
}
 

/* import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../error/exceptions.dart';
import '../../objects/shared_preferences_keys.dart';
import 'token_manager.dart';

class ApiHelpers {
  static Future<dynamic> executeRequest({
    required Future<dynamic> Function() request,
  }) async {
    try {
      
      return await request();
    } catch (err) {
      if (err is TimeoutException) {
        debugPrint("ok ===> ${err}");
        throw Exception('Dépassement du délai de la requête');
      } else if (err is SocketException) {
        throw Exception('Oups, erreur serveur. Réessayez plus tard!');
      } else if (err is AppException) {
        throw Exception(err.message);
      } else {
        debugPrint(err.toString());
        throw Exception("Oups, quelque chose s'est mal passé!");
      }
    }
  }

  static Future<dynamic> handleApiResponse({
    required Client http,
    required Response res,
    required Set<int> statusCodes,
    required SharedPreferences prefs,
  }) async {
    /* if (res.statusCode == 401) {
     // print("401 erreur ");
      final tokenRefreshed =
          await TokenManager.refreshAccessToken(http: http, prefs: prefs);
      if (tokenRefreshed) {
        throw AppException(message: 'Erreur, veuillez réessayer svp!');
      }
      throw AppException(message: 'Échec, veuillez vous reconnecter svp!');
    } */

    String source = const Utf8Decoder().convert(res.bodyBytes);

  //  print('RES HEADERS ---------> ${res.statusCode}');

      var data = json.decode(source);

      if (res.statusCode == 200) {
        return data;
      }

      if (statusCodes.contains(res.statusCode)) {
        throw AppException(message: data['message']);
      }

    // if (res.headers['Content-Type']!.contains('application/json')) {
    //   var data = json.decode(source);

    //   if (res.statusCode == 200) {
    //     return data;
    //   }

    //   if (statusCodes.contains(res.statusCode)) {
    //     throw AppException(message: data['message']);
    //   }
    // } else {
    //   return source;
    // }

    //throw AppException(message: 'Erreur, de la requête!');
  }

  static Map<String, String> reqHeaders({
    required bool secure,
    required SharedPreferences prefs,
  }) {
    if (secure) {
      var token = prefs.getString(AppPrefsKeys.authToken);

      return {
        // 'Accept-Language': 'fr',
        'Content-Type': 'application/json',
        'Authorization': 'bearer ${token ?? ''}'
      };
    }
    return {'Content-Type': 'application/json'};
  }
}
 */