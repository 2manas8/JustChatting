import 'package:frontend/repositories/personal_details.dart';
import 'package:frontend/utils/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Websocket {
  static late IO.Socket socket;

  static void socketConnect() {
    socket = IO.io(socketUrl, <String, dynamic> {
      'transports': ['websocket'],
      'autoConnect': false
    });
    socket.connect();
  }

  static void joinRoom(String roomId) {
    socket.emit('joinRoom', roomId);
  }

  static void leaveRoom(String roomId) {
    socket.emit('leaveRoom', roomId);
  }

  static void sendMessage(String roomId, String message) {
    Map<String, dynamic> sendMessage = {
      'roomId': roomId,
      'sender': PersonalDetails.id,
      'message': message
    };
    socket.emit('sendMessage', sendMessage);
  }

  static void receiveMessage(Function receivedMessage) {
    socket.on('receiveMessage', (data) {
      receivedMessage();
    });
  }
}