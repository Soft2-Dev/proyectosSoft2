import 'package:admin_dashbuard/ui/cards/whiteCard.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';

class BlankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Blank View',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          WhiteCard(title: 'Sales Statistics', child: Text('Hola Mundo')),
        ],
      ),
    );
  }
}
