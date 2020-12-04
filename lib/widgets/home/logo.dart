import 'package:flutter/material.dart';
import 'package:filmesApp/core/constants.dart';

class LogoWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Logo(),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            app_name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 96,
      child: Image.asset(app_logo_path),
    );
  }
}
