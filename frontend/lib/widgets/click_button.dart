import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class ClickButton extends StatefulWidget {
  final String text;
  final void Function() onPressedFunction;

  const ClickButton({
    required this.text,
    required this.onPressedFunction
  });

  @override
  State<ClickButton> createState() => ClickButtonState();
}

class ClickButtonState extends State<ClickButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(defaultMargin),
      child: ElevatedButton(
        onPressed: widget.onPressedFunction,
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.secondaryColor)
        ),
      ),
    );
  }
}