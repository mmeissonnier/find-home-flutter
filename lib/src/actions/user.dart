import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:find_home/src/globals.dart';

Future<http.Response> logIn(String username, String password) {
  return http.Client().post(Uri.https(apiBasePath, '/auth'),
      body: jsonEncode({"username": username, "password": password}));
}

Future<http.Response> getProfileInfos() {
  return http.Client().get(Uri.https(apiBasePath, '/profile'));
}
