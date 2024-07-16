import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/providers/auth_providers.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/services/api_services.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';
import 'package:frontend/utils/routes.dart';
import 'package:frontend/widgets/click_button.dart';
import 'package:frontend/widgets/custom_text_field.dart';
import 'package:frontend/widgets/custom_title.dart';
import 'package:frontend/widgets/error_text.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.baseColor,
        actions: [
          ClickButton(
            text: loginText,
            onPressedFunction: () {
              CommonControllers.clearControllers();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: loginRoute)
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
              title: signUpText
            ),
            ErrorText(
                message: AuthErrorProvider.errorText
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      keyboardType: TextInputType.name,
                      controller: SignUpControllers.nameController,
                      hintText: signUpNameText,
                      prefixIcon: Icons.edit,
                      textObscureNeeded: false
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.text,
                      controller: SignUpControllers.usernameController,
                      hintText: signUpUsernameText,
                      prefixIcon: Icons.account_circle,
                      textObscureNeeded: false
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: SignUpControllers.emailController,
                      hintText: signUpEmailText,
                      prefixIcon: Icons.mail,
                      textObscureNeeded: false
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: SignUpControllers.phoneController,
                      hintText: signUpPhoneText,
                      prefixIcon: Icons.phone,
                      textObscureNeeded: false
                    ),
                    CustomTextField(
                      keyboardType: TextInputType.text,
                      controller: SignUpControllers.passwordController,
                      hintText: signUpPasswordText,
                      prefixIcon: Icons.key,
                      textObscureNeeded: true
                    ),
                    ClickButton(
                      text: signUpText,
                      onPressedFunction: () async {
                        CommonControllers.hidePassword = true;
                        await AuthenticationCalls.signUp(
                          SignUpControllers.nameController.text.toString(),
                          SignUpControllers.usernameController.text.toString(),
                          SignUpControllers.emailController.text.toString(),
                          SignUpControllers.phoneController.text.toString(),
                          SignUpControllers.passwordController.text.toString(),
                          context
                        );
                        setState(() {});
                      }
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}