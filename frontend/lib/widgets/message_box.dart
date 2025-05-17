import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class MessageBox extends StatelessWidget {
  final bool messageSent;
  final String message;

  const MessageBox({super.key, 
    required this.messageSent,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      alignment: messageSent ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 100
        ),
        child: Container(
          decoration: BoxDecoration(
            color: messageSent ? AppColors.secondaryColor : AppColors.tertiaryColor,
            borderRadius: BorderRadius.circular(defaultBorderRadius)
          ),
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor
              ),
            ),
          ),
        ),
      ),
    );
  }
}