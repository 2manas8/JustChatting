import 'package:flutter/material.dart';
import 'package:frontend/models/chat.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/repositories/personal_details.dart';
import 'package:frontend/services/chat_services.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/websocket.dart';
import 'package:frontend/widgets/action_button.dart';
import 'package:frontend/widgets/chat_title.dart';
import 'package:frontend/widgets/loading.dart';
import 'package:frontend/widgets/message_box.dart';
import 'package:frontend/widgets/text_bar.dart';

class IndividualChatPage extends StatefulWidget {
  final String title;
  final String roomId;

  const IndividualChatPage({
    required this.title,
    required this.roomId
  });

  @override
  State<IndividualChatPage> createState() => IndividualChatPageState();
}

class IndividualChatPageState extends State<IndividualChatPage> {
  List<Chat>? chats;

  @override
  void initState() {
    super.initState();
    fetchChatHistory();
    Websocket.joinRoom(widget.roomId);
    Websocket.receiveMessage(() {
      fetchChatHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: ActionButton(
          onPressedFunction: () {
            Websocket.leaveRoom(widget.roomId);
            Navigator.pop(context);
          },
          icon: Icons.arrow_back,
        ),
        title: ChatTitle(
          title: widget.title
        ),
        actions: [
          ActionButton(
            onPressedFunction: () async {
              await ChatServices.deleteChat(widget.roomId);
              Navigator.pop(context);
            },
            icon: Icons.delete
          )
        ],
        backgroundColor: AppColors.baseColor,
      ),
      backgroundColor: AppColors.baseColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ChatControllers.isFetchingChatHistory
              ? Loading()
              : chats != null
                ? ListView.builder(
                  reverse: true,
                  itemCount: chats!.length,
                  itemBuilder: (context, index) {
                    final chat = chats![index];
                    return MessageBox(
                      messageSent: chat.sender == PersonalDetails.id,
                      message: chat.message
                    );
                  }
                )
                : Container(),
            ),
            TextBar(
              keyboardType: TextInputType.multiline,
              controller: ChatControllers.chatController,
              hintText: sendMessageHintText,
              suffixIcon: Icons.send,
              onPressedFunction: () {
                if(ChatControllers.chatController.text.isNotEmpty) {
                  Websocket.sendMessage(
                      widget.roomId,
                      ChatControllers.chatController.text.toString()
                  );
                  CommonControllers.clearControllers();
                }
                fetchChatHistory();
              },
              maxLines: 5,
            )
          ],
        ),
      ),
    );
  }

  void fetchChatHistory() async {
    ChatControllers.isFetchingChatHistory = true;
    chats = await ChatServices.loadChat(widget.roomId);
    ChatControllers.isFetchingChatHistory = false;
    setState(() {});
  }
}