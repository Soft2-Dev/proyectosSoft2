import 'package:flutter/material.dart';
import 'package:pido/ui/construcion_page.dart';
import 'package:pido/ui/layout/categorias/productosCategorias.dart';
import 'package:pido/ui/layout/homePages.dart';
import 'package:pido/ui/layout/productos/detalleProducto.dart';

import '../api/splashAuthLayout.dart';
import '../ui/layout/auth/login.dart';
import '../ui/layout/carrito/carrito.dart';
import '../ui/layout/clientes/nuevoCliente.dart';
import '../ui/layout/clientes/perfil.dart';
import '../ui/layout/menu/menu.dart';
import '../ui/layout/misPedidos/misPedidos.dart';
import '../ui/layout/validaClientes/validaCliente.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    'HomePage': (BuildContext context) => HomePage(),
    'splas': (BuildContext context) => SplashScreenPage(),
    'DetalleProducto': (BuildContext context) => DetalleProducto(),
    'ProductosCategoria': (BuildContext context) => ProductosCategoria(),
    'PerfilPages': (BuildContext context) => PerfilPages(),
    'MenuPages': (BuildContext context) => MenuPages(),
    'CarritoPages': (BuildContext context) => CarritoPages(),
    'LoginPages': (BuildContext context) => LoginPages(),
    'ValidaCliente': (BuildContext context) => ValidaCliente(),
    'NuevoCliente': (BuildContext context) => NuevoCliente(),
    'MisPedidos': (BuildContext context) => MisPedidos(),
  };
}

Map<String, WidgetBuilder> getNoRutas() {
  return <String, WidgetBuilder>{
    'construccion': (BuildContext context) => Construccion(),
  };
}
