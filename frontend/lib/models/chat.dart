class Chat {
  String roomId;
  String sender;
  String message;
  String timeStamp;

  Chat({
    required this.roomId,
    required this.sender,
    required this.message,
    required this.timeStamp
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      roomId: json['roomId'],
      sender: json['sender'],
      message: json['message'],
      timeStamp: json['timeStamp']
    );
  }
}