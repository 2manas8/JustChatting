import 'package:flutter/material.dart';
import 'package:frontend/providers/controllers.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/constants.dart';

class EmptyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(defaultPadding),
      child: Text(
        RoomsControllers.isSearching ? noUsersFoundText : emptyHomeText,
        style: TextStyle(
            color: AppColors.tertiaryColor,
            fontSize: 25
        ),
      ),
    );
  }
}