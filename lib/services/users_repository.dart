import 'dart:convert';

import 'package:deneme/models/users_model.dart';
import 'package:http/http.dart' as http;

class UsersRepository{

  static Future<List<UsersModel>> fetchUsers() async {
    final response = await http.get(Uri.parse("https://safirkurumsal.com/api/getUsers.php"));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((json) => UsersModel.fromJson(json)).toList();
    } else {
      throw Exception("API'den veri alınamadı.");
    }
  }

}