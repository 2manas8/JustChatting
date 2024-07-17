import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onPressedFunction;
  final void Function() onTapFunction;

  CustomListTile({
    required this.title,
    required this.subtitle,
    required this.onPressedFunction,
    required this.onTapFunction
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTapFunction,
        leading: CircleAvatar(
          backgroundColor: AppColors.tertiaryColor,
          radius: 35,
          child: Icon(
            Icons.person,
            color: AppColors.primaryColor,
            size: 40,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: AppColors.primaryColor
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: AppColors.primaryColor,
            size: 25
          ),
          onPressed: onPressedFunction,
        ),
      ),
    );
  }
}