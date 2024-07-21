import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/repositories/auth_repository.dart';
import 'package:frontend/repositories/personal_details.dart';
import 'package:frontend/services/chat_services.dart';
import 'package:frontend/services/user_services.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/jwt.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/widgets/action_button.dart';
import 'package:frontend/widgets/custom_list_tile.dart';
import 'package:frontend/widgets/custom_title.dart';
import 'package:frontend/widgets/empty_home.dart';
import 'package:frontend/widgets/loading.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<User>? users;

  @override
  void initState() {
    super.initState();
    fetchUserDetails();
  }

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
      body: RoomsControllers.isFetchingRooms
        ? Loading()
        : users == null
          ? EmptyHome()
          : ListView.builder(
            itemCount: users!.length,
            itemBuilder: (context, index) {
              final user = users![index];
              return CustomListTile(
                title: user.name,
                subtitle: user.username,
                onPressedFunction: () {
                  print('Chat deleted');
                },
                onTapFunction: () async {
                  String? roomId = await ChatServices.findChatRoom(PersonalDetails.id, user.userId);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: individualChatRoute(user.name, roomId!))
                  );
                },
              );
            }
          )
    );
  }

  void fetchUserDetails() async {
    RoomsControllers.isFetchingRooms = true;
    String? token = await AuthRepository.getToken();
    Jwt.decodeToken(token!);
    users = await UserServices.loadRooms(PersonalDetails.id);
    RoomsControllers.isFetchingRooms = false;
    setState(() {});
  }
}