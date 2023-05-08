import 'package:shared_preferences/shared_preferences.dart';

const String token = "token";

void saveToken({
  required String valueToken,
}) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString(token, valueToken);
}

Future<String> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  // ignore: no_leading_underscores_for_local_identifiers
  final _token = prefs.getString(token);
  return _token ?? "";
}

void removeToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove(token);
}
