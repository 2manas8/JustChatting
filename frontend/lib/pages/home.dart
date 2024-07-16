import 'package:flutter/material.dart';
import 'package:frontend/repositories/auth_repository.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/widgets/action_button.dart';
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
              AuthRepository.removeToken();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: loginRoute)
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
    );
  }
}