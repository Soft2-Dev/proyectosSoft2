import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bubble_chart_outlined,
            color: Color(0xff7a6bf5),
          ),

          // Image(
          //   image: AssetImage('img/escudo.png'),
          //   fit: BoxFit.cover,
          // ),

          SizedBox(
            width: 10,
          ),
          Text(
            'SICOIN',
            style: GoogleFonts.montserratAlternates(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
          )
        ],
      ),
    );
  }
}
