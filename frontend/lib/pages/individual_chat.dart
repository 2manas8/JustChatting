import 'package:flutter/material.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/widgets/action_button.dart';
import 'package:frontend/widgets/chat_title.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: ActionButton(
          onPressedFunction: () {
            Navigator.pop(context);
          },
          icon: Icons.arrow_back,
        ),
        title: ChatTitle(
          title: widget.title
        ),
        actions: [
          ActionButton(
            onPressedFunction: () {
              print('Chat deleted');
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
        child: Stack(
          children: [
            ListView(
              children: [
                MessageBox(
                    messageSent: true,
                    message: 'Hello!'
                ),
                MessageBox(
                    messageSent: false,
                    message: 'Hey there! How are you?'
                )
              ],
            ),
            TextBar(
              controller: ChatControllers.chatController,
              hintText: sendMessageHintText,
              suffixIcon: Icons.send,
              onPressedFunction: () {
                print('Message sent');
                CommonControllers.clearControllers();
              },
              maxLines: 5,
            )
          ],
        ),
      ),
    );
  }
}