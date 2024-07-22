import 'dart:convert';
import 'package:frontend/models/user.dart';
import 'package:frontend/repositories/personal_details.dart';
import 'package:frontend/utils/constants.dart';
import 'package:http/http.dart';

class UserServices {
  static Future<List<User>?> loadRooms(String userId) async {
    try {
      Response response = await get(Uri.parse(apiBaseUrl + userRoomsEndpoint).replace(queryParameters: {'userId': userId}));
      if(response.statusCode == 200) {
        final List<dynamic> jsonData = (json.decode(response.body))['users'];
        return jsonData.map((json) => User.fromJson(json)).toList();
      }
    } catch(error) {
      print(error.toString());
    }
    return null;
  }

  static Future<List<User>?> findUser(String username) async {
    try {
      Response response = await get(
        Uri.parse(apiBaseUrl + userDetailsEndpoint).replace(queryParameters: {
          'username': username,
          'my_username': PersonalDetails.username
        })
      );
      if(response.statusCode == 200) {
        final List<dynamic> jsonData = (json.decode(response.body))['users'];
        return jsonData.map((json) => User.fromJson(json)).toList();
      }
    } catch(error) {
      print(error.toString());
    }
    return null;
  }
}