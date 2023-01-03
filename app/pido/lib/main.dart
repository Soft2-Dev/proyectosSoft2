import 'package:flutter/material.dart';
import 'package:pido/provider/auth/loginFromProvider.dart';
import 'package:pido/provider/auth/loginProvider.dart';
import 'package:pido/provider/misPedidos/misPedidosProvider.dart';
import 'package:pido/provider/perfil/perfilFromProvider.dart';
import 'package:pido/provider/usuarios/usuariosFromProvider.dart';
import 'package:pido/provider/usuarios/usuariosProvider.dart';
import 'package:pido/provider/validaClientes/validaClientesFromProvider.dart';
import 'package:pido/provider/validaClientes/validaClientesProvider.dart';
import 'package:pido/router/routers.dart';
import 'package:pido/serices/notificationService.dart';
import 'package:pido/ui/construcion_page.dart';
import 'package:provider/provider.dart';

import 'api/AllApi.dart';
import 'api/splashAuthLayout.dart';
import 'provider/categoriasProvider.dart';
import 'provider/perfil/PerfilProvider.dart';
import 'provider/productos/productoProvider.dart';
import 'serices/localStorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AllApi.configuteDio();
  await LocalStorage.configurePrefs();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        //--------- provider login --------------
        ChangeNotifierProvider(
            lazy: false, create: (_) => ProviderCategorias()),

        ChangeNotifierProvider(lazy: false, create: (_) => ProviderProductos()),

        // perfiles -PerfilProvider
        ChangeNotifierProvider(
            lazy: false, create: (_) => PerfilFromProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => PerfilProvider()),

        ChangeNotifierProvider(lazy: false, create: (_) => LoginFromProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => LoginProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => ValidaClientesFromProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => ValidaClientesProvider()),

        ChangeNotifierProvider(
            lazy: false, create: (_) => UsuariosFromProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => UsuariosProvider()),
        ChangeNotifierProvider(
            lazy: false, create: (_) => MisPedidosProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop',
      home: SplashScreenPage(),
      initialRoute: 'splas',
      routes: getRutas(),
      scaffoldMessengerKey: NotificationService.msnKey,
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => Construccion());
      },
    );
  }
}
