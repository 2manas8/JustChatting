import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/routes.dart';
import 'package:http/http.dart';

class AuthenticationCalls {
  static Future<void> login(String username, String password, context) async {
    Map<String, String> body = {
      "username" : username,
      "password" : password
    };
    try {
      Response response  = await post(
        Uri.parse(apiBaseUrl + loginEndpoint),
        headers: apiHeader,
        body: json.encode(body)
      );
      if(response.statusCode == 200) {
        CommonControllers.clearControllers();
        print(response.body);
      } else {
        print(response.body);
      }
    } catch(error) {
      print(error.toString());
    }
  }

  static Future<void> signUp(String name, String username, String email, String phone, String password, context) async {
    Map<String, String> body = {
      "name" : name,
      "username" : username,
      "email" : email,
      "phone" : phone,
      "password" : password
    };
    try {
      Response response = await post(
        Uri.parse(apiBaseUrl + signUpEndpoint),
        headers: apiHeader,
        body: json.encode(body)
      );
      if(response.statusCode == 200) {
        CommonControllers.clearControllers();
        print(response.body);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: loginRoute)
        );
      } else {
        print(response.body);
      }
    } catch(error) {
      print(error.toString());
    }
  }
}