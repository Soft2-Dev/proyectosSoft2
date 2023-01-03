import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/ui/buttons/linkText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Linksbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: (size.width > 1000) ? size.height * 0.07 : null,
      color: Colors.black,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(
            text: 'Inicio',
            onPressed: () {
              //Provider.of<AuthProvider>(context, listen: false).homePage();
            },
          ),
        ],
      ),
    );
  }
}
