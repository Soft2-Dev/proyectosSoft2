import 'package:admin_dashbuard/provider/sideMenuProvide.dart';
import 'package:admin_dashbuard/ui/shared/widgets/navbarAvatar.dart';

import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildDecoration(),
      child: Row(
        children: [
          //icono condicional
          if (size.width <= 700)
            IconButton(
                icon: Icon(Icons.menu_outlined),
                onPressed: () => SideMenuProvider.openMenu()),
          SizedBox(
            width: 10,
          ),

          // Search input

          // if (size.width >= 440)
          //   ConstrainedBox(
          //     constraints: BoxConstraints(maxWidth: 250),
          //     child: SearchText(),
          //   ),

          Spacer(),
          //notificaciones
          //NotificationsIndicator(),
          SizedBox(
            width: 10,
          ),

          // avatar
          NavbarAvatar(),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
