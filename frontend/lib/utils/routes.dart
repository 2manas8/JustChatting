import 'package:flutter/material.dart';
import 'package:frontend/pages/home.dart';
import 'package:frontend/pages/individual_chat.dart';
import 'package:frontend/pages/login.dart';
import 'package:frontend/pages/sign_up.dart';

WidgetBuilder loginRoute() {
  return ((context) => LoginPage());
}

WidgetBuilder signUpRoute() {
  return ((context) => SignUpPage());
}

WidgetBuilder homeRoute() {
  return (context) => HomePage();
}

WidgetBuilder individualChatRoute(String title) {
  return (context) => IndividualChatPage(title: title);
}