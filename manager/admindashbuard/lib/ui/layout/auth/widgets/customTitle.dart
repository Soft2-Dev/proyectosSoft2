import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    return Container(
      // color: Colors.amber,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'img/texto.png',
          ),
          SizedBox(
            height: 50,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text(
              authprovider.gettitle,
              style: GoogleFonts.montserratAlternates(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
