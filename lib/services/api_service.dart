import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> login(String username, String password) async {
    final url = 'https://mfatest.wijungle.com:9084/auth.php?type=login&username=$username&password=$password';
    final response = await http.post(Uri.parse(url));
    return json.decode(response.body);
  }
}
