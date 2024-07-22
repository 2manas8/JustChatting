import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class TextBar extends StatelessWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String hintText;
  final IconData suffixIcon;
  final void Function() onPressedFunction;
  final int maxLines;

  const TextBar({
    required this.keyboardType,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
    required this.onPressedFunction,
    required this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(defaultPadding),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: false,
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textBarColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultBorderRadius)
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.tertiaryColor,
            fontWeight: FontWeight.w400
          ),
          suffixIcon: IconButton(
            icon: Icon(
              suffixIcon,
              color: AppColors.secondaryColor,
            ),
            onPressed: onPressedFunction,
          ),
        ),
        style: TextStyle(
          color: AppColors.primaryColor
        ),
        maxLines: maxLines,
        minLines: 1,
      ),
    );
  }
}