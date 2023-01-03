import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/auth/loginProvider.dart';
import '../../../serices/localStorage.dart';

class MenuPages extends StatelessWidget {
  const MenuPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cantidadProductos = LocalStorage.prefs.getString("cantidad");
    final rol = LocalStorage.prefs.getString('rol');

    return SafeArea(
        child: Scaffold(
      body: ListView(children: [
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.02, bottom: size.height * 0.02),
          //color: Colors.red,
          alignment: Alignment.center,
          child: Text(
            'Menu',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
        ListTile(
          title: Text('Perfil'),
          leading: Icon(Icons.person_outline),
          onTap: () {
            Navigator.pushNamed(context, 'PerfilPages');
          },
        ),
        Divider(
          color: Colors.grey,
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, 'CarritoPages');
          },
          title: Text('Carrito'),
          leading: (cantidadProductos != null)
              ? Stack(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 35,
                      color: Colors.grey,
                    ),
                    if (cantidadProductos != null)
                      Positioned(
                        right: 0,
                        child: BounceInDown(
                          child: Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Text(
                                  cantidadProductos,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              : Icon(Icons.shopping_cart_outlined),
        ),
        Divider(
          color: Colors.grey,
          height: 20,
        ),
        if (rol == '26')
          ListTile(
            onTap: () {
              //MisPedidos
              Navigator.pushNamed(context, 'MisPedidos');
            },
            title: Text('Mis Pedidos'),
            leading: Icon(Icons.assignment),
          ),
        if (rol == '26')
          Divider(
            color: Colors.grey,
            height: 20,
          ),
        Container(
          height: 30,
        ),
        ListTile(
          onTap: () {
            Provider.of<LoginProvider>(context, listen: false).logout(context);
          },
          title: Text('logout'),
          leading: Icon(Icons.logout),
        ),
        Divider(
          color: Colors.grey,
        ),
        Divider(
          color: Colors.grey,
        ),
      ]),
    ));
  }
}
