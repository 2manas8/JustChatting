import 'dart:convert';
import 'package:frontend/utils/constants.dart';
import 'package:http/http.dart';

class ChatServices {
  static Future<String?> findChatRoom(String userId1, String userId2) async {
    Map<String, List<String>> body = {
      'memberIds': [
        userId1,
        userId2
      ]
    };
    try {
      Response response = await post(
        Uri.parse(apiBaseUrl + chatRoomEndpoint),
        headers: apiHeader,
        body: json.encode(body)
      );
      if(response.statusCode == 200 || response.statusCode == 400) {
        return (json.decode(response.body))['room'];
      }
    } catch(error) {
      print(error.toString());
    }
    return null;
  }
}