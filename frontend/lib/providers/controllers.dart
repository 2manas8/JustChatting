import 'package:flutter/material.dart';

class LoginControllers {
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
}

class SignUpControllers {
  static TextEditingController nameController = TextEditingController();
  static TextEditingController usernameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
}

class RoomsControllers {
  static bool isFetchingRooms = false;
}

class ChatControllers {
  static TextEditingController chatController = TextEditingController();
  static bool isFetchingChatHistory = false;
}

class CommonControllers {
  static bool hidePassword = true;

  static void clearControllers() {
    LoginControllers.usernameController.clear();
    LoginControllers.passwordController.clear();
    SignUpControllers.nameController.clear();
    SignUpControllers.usernameController.clear();
    SignUpControllers.emailController.clear();
    SignUpControllers.phoneController.clear();
    SignUpControllers.passwordController.clear();
    ChatControllers.chatController.clear();
  }
}