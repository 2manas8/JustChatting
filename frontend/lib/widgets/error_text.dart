import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class ErrorText extends StatelessWidget {
  final String message;

  const ErrorText({super.key, 
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25,
      alignment: Alignment.center,
      child: Text(
        message,
        style: TextStyle(
            color: AppColors.errorTextColor,
            fontSize: 16
        ),
      ),
    );
  }
}