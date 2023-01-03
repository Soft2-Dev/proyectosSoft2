import 'package:flutter/material.dart';

class SplashAuthLayout extends StatelessWidget {
  const SplashAuthLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 20,
            ),
            Text('Checking .....')
          ],
        ),
      ),
    );
  }
}
