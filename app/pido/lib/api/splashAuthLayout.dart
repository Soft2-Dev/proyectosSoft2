import 'package:flutter/material.dart';
import 'package:pido/ui/layout/homePages.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import '../ui/layout/auth/login.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: LoginPages(),
      duration: 4000,
      imageSize: 130,
      imageSrc: "img/logo.png",
      textType: TextType.NormalText,
      textStyle: TextStyle(
        fontSize: 30.0,
      ),
    );
  }
}
