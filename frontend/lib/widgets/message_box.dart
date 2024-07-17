import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class MessageBox extends StatelessWidget {
  final bool messageSent;
  final String message;

  const MessageBox({
    required this.messageSent,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      alignment: messageSent ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45
        ),
        child: Container(
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
          decoration: BoxDecoration(
            color: messageSent ? AppColors.secondaryColor : AppColors.tertiaryColor,
            borderRadius: BorderRadius.circular(defaultBorderRadius)
          ),
        ),
      ),
    );
  }
}