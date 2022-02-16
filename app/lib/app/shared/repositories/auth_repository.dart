import 'dart:convert';

import 'package:http/http.dart' as httpClient;

class AuthRepository {
  Future<String> sendRegisterData({Map<String, dynamic>? registerData}) async {
    var response = await httpClient.post(
      Uri.parse("http://10.0.2.2:7777/products"),
      body: jsonEncode(registerData),
      encoding: Encoding.getByName('utf-8'),
      headers: {'Content-Type': 'application/json'},
    );

    return response.body;
  }

  Future<String> register(Map<String, dynamic> data) async {
    final result = await sendRegisterData(registerData: data);
    return result;
  }
}
