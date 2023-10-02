import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<Map<String, dynamic>>?> getUser() async {
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      // Parse the JSON response and return the 'data' list
      final List<Map<String, dynamic>> result =
          List<Map<String, dynamic>>.from(jsonDecode(response.body)['data']);
      print(result);

      return result; // Return the parsed data
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
