import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/ui/cards/whiteCard.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/localStorage.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    final nombre = LocalStorage.prefs.getString('nombre');
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Bienvenido',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          WhiteCard(title: nombre, child: Text(user.correo.toString())),
          Container(
            child: Image(
                width: size.width * 0.4,
                height: size.width * 0.4,
                image: AssetImage('img/logo.png')),
          )
        ],
      ),
    );
  }
}
