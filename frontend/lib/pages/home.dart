import 'package:flutter/material.dart';
import 'package:frontend/repositories/auth_repository.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/widgets/action_button.dart';
import 'package:frontend/widgets/custom_list_tile.dart';
import 'package:frontend/widgets/custom_title.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: AppColors.baseColor,
        actions: [
          ActionButton(
            onPressedFunction: () {
              print('Searching for username provided');
            },
            icon: Icons.add
          ),
          ActionButton(
            onPressedFunction: () {
              AuthRepository.removeToken();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: loginRoute())
              );
            },
            icon: Icons.logout
          )
        ],
        title: CustomTitle(
          title: appNameText,
        ),
      ),
      backgroundColor: AppColors.baseColor,
      body: Column(
        children: [
          CustomListTile(
            title: 'Name',
            subtitle: 'Username',
            onPressedFunction: () {
              print('Chat deleted');
            },
            onTapFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: individualChatRoute('Name'))
              );
            },
          ),
          CustomListTile(
            title: 'Name',
            subtitle: 'Username',
            onPressedFunction: () {
              print('Chat deleted');
            },
            onTapFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: individualChatRoute('Name'))
              );
            },
          )
        ],
      ),
    );
  }
}