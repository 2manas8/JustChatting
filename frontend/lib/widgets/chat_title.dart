import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class ChatTitle extends StatelessWidget {
  final String title;

  const ChatTitle({
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 35
      ),
    );
  }
}