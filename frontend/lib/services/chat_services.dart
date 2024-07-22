import 'dart:convert';
import 'package:frontend/models/chat.dart';
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

  static Future<List<Chat>?> loadChat(String roomId) async {
    try {
      Response response = await get(Uri.parse(apiBaseUrl + chatHistoryEndpoint).replace(queryParameters: {'roomId': roomId}));
      if(response.statusCode == 200) {
        final List<dynamic> jsonData = (json.decode(response.body))['chats'];
        return jsonData.map((json) => Chat.fromJson(json)).toList();
      }
    } catch(error) {
      print(error.toString());
    }
    return null;
  }

  static Future<void> deleteChat(String roomId) async {
    try {
      Response response = await delete(Uri.parse(apiBaseUrl + deleteChatEndpoint).replace(queryParameters: {'roomId': roomId}));
      if(response.statusCode == 200) {
        print(response.body);
      }
    } catch(error) {
      print(error.toString());
    }
  }
}