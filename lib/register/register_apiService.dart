import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas_example/login/loginResponseModel.dart';
import 'package:pas_example/register/registerResponseModel.dart';

class RegisterService {
  final url = Uri.parse('https://mediadwi.com/api/latihan/register-user');
  Future<RegisterResponseModel> registerUser(
      String username, String password, String fullName, String email) async {
    try {
      final response = await http
          .post(url, headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      }, body: <String, String>{
        'username': username,
        'password': password,
        'email': email,
        'full_name': fullName
      });

      // Cek status code dan decode response body
      if (response.statusCode == 200) {
        return RegisterResponseModel.fromJson(json.decode(response.body));
      } else {
        return RegisterResponseModel(status: false, message: 'Server error.');
      }
    } catch (e) {
      return RegisterResponseModel(status: false, message: 'An error occurred: $e');
    }
  }
}
