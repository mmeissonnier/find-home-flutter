import 'package:http/http.dart' as http;
import 'package:find_home/src/globals.dart';

Future<http.Response> getHouseList() {
  return http.Client().get(Uri.http(apiBasePath, '/houselist'));
}
