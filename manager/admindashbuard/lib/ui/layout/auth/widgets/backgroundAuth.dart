import 'package:flutter/material.dart';

class BackgroundAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildboxDecoration(),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image(
              image: AssetImage('img/logoBlanco.png'),
              width: 400,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration buildboxDecoration() {
    return BoxDecoration(
        color: Colors.black12,
        image: DecorationImage(
            image: AssetImage('img/imgLogin.png'), fit: BoxFit.cover));
  }
}
