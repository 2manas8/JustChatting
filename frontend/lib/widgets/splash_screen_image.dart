import 'package:flutter/material.dart';
import 'package:frontend/utils/constants.dart';

class SplashScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: 300,
          width: 300,
          child: Image.asset(logo)
      ),
    );
  }
}