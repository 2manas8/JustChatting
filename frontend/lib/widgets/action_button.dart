import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';

class ActionButton extends StatelessWidget {
  final void Function() onPressedFunction;
  final IconData icon;

  const ActionButton({super.key, 
    required this.onPressedFunction,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressedFunction,
      icon: Icon(
        icon,
        color: AppColors.secondaryColor,
        size: 30,
      )
    );
  }
}