import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/repositories/auth_repository.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/routes.dart';
import 'package:http/http.dart';

class AuthenticationCalls {
  static Future<void> login(String username, String password, context) async {
    Map<String, String> body = {
      'username' : username,
      'password' : password
    };
    try {
      Response response  = await post(
        Uri.parse(apiBaseUrl + loginEndpoint),
        headers: apiHeader,
        body: json.encode(body)
      );
      if(response.statusCode == 200) {
        AuthErrorProvider.errorText = '';
        AuthRepository.saveToken(((json.decode(response.body))['token']).toString());
        CommonControllers.clearControllers();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: homeRoute())
        );
      } else {
        AuthErrorProvider.errorText = ((json.decode(response.body))['message']).toString();
      }
    } catch(error) {
      AuthErrorProvider.errorText = error.toString();
    }
  }

  static Future<void> signUp(String name, String username, String email, String phone, String password, context) async {
    Map<String, String> body = {
      'name' : name,
      'username' : username,
      'email' : email,
      'phone' : phone,
      'password' : password
    };
    try {
      Response response = await post(
        Uri.parse(apiBaseUrl + signUpEndpoint),
        headers: apiHeader,
        body: json.encode(body)
      );
      if(response.statusCode == 200) {
        AuthErrorProvider.errorText = '';
        CommonControllers.clearControllers();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: loginRoute())
        );
      } else {
        AuthErrorProvider.errorText = ((json.decode(response.body))['message']).toString();
      }
    } catch(error) {
      AuthErrorProvider.errorText = error.toString();
    }
  }
}