import 'package:flutter/material.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/services/api_services.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/widgets/custom_text_field.dart';
import 'package:frontend/widgets/custom_title.dart';
import 'package:frontend/widgets/click_button.dart';
import 'package:frontend/widgets/error_text.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.baseColor,
        actions: [
          ClickButton(
            text: signUpText,
            onPressedFunction: () {
              CommonControllers.clearControllers();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: signUpRoute)
              );
            },
          )
        ],
      ),
      backgroundColor: AppColors.baseColor,
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTitle(
              title: loginText
            ),
            ErrorText(
              message: AuthErrorProvider.errorText
            ),
            CustomTextField(
              keyboardType: TextInputType.text,
              controller: LoginControllers.usernameController,
              hintText: loginUsernameText,
              prefixIcon: Icons.account_circle,
              textObscureNeeded: false
            ),
            CustomTextField(
              keyboardType: TextInputType.text,
              controller: LoginControllers.passwordController,
              hintText: loginPasswordText,
              prefixIcon: Icons.key,
              textObscureNeeded: true
            ),
            ClickButton(
              text: loginText,
              onPressedFunction: () async {
                CommonControllers.hidePassword = true;
                await AuthenticationCalls.login(
                  LoginControllers.usernameController.text.toString(),
                  LoginControllers.passwordController.text.toString(),
                  context
                );
                setState(() {});
              }
            )
          ],
        ),
      ),
    );
  }
}