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
import 'package:frontend/widgets/text_bar.dart';

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
              RoomsControllers.isSearching = false;
              fetchUserDetails();
              setState(() {});
            },
            icon: Icons.refresh
          ),
          ActionButton(
            onPressedFunction: () {
              RoomsControllers.isSearching = false;
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
          TextBar(
            keyboardType: TextInputType.text,
            controller: RoomsControllers.searchController,
            hintText: searchBarText,
            suffixIcon: RoomsControllers.isSearching ? Icons.close : Icons.search,
            onPressedFunction: RoomsControllers.isSearching
            ? () async {
              RoomsControllers.isSearching = false;
              CommonControllers.clearControllers();
              fetchUserDetails();
              setState(() {});
            }
            : () async {
              RoomsControllers.isSearching = true;
              fetchUserDetails();
              setState(() {});
            },
            maxLines: 1,
          ),
          Expanded(
            child: RoomsControllers.isFetchingRooms
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
                  onPressedFunction: () async {
                    String? roomId = await ChatServices.findChatRoom(PersonalDetails.id, user.userId);
                    await ChatServices.deleteChat(roomId!);
                    fetchUserDetails();
                  },
                  onTapFunction: () async {
                    String? roomId = await ChatServices.findChatRoom(PersonalDetails.id, user.userId);
                    CommonControllers.clearControllers();
                    RoomsControllers.isSearching = false;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: individualChatRoute(user.name, roomId!))
                    );
                  },
                );
              }),
          ),
        ],
      )
    );
  }

  void fetchUserDetails() async {
    RoomsControllers.isFetchingRooms = true;
    String? token = await AuthRepository.getToken();
    Jwt.decodeToken(token!);
    if(RoomsControllers.isSearching) {
      users = await UserServices.findUser(RoomsControllers.searchController.text.toString());
    } else {
      users = await UserServices.loadRooms(PersonalDetails.id);
    }
    RoomsControllers.isFetchingRooms = false;
    setState(() {});
  }
}