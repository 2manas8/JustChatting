import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
          margin: EdgeInsets.all(defaultMargin),
          height: 50,
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          )
      ),
    );
  }
}