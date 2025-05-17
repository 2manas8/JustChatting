import 'package:flutter/material.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/individual_chat.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/pages/sign_up.dart';

WidgetBuilder loginRoute() {
  return ((context) => const LoginPage());
}

WidgetBuilder signUpRoute() {
  return ((context) => const SignUpPage());
}

WidgetBuilder homeRoute() {
  return (context) => const HomePage();
}

WidgetBuilder individualChatRoute(String title, String roomId) {
  return (context) => IndividualChatPage(
    title: title,
    roomId: roomId
  );
}