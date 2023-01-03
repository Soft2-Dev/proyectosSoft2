import 'package:admin_dashbuard/provider/clientes/clientesProvider.dart';
import 'package:admin_dashbuard/provider/configuracion/estadosFromProvider.dart';
import 'package:admin_dashbuard/provider/noticiaFromProvider.dart';
import 'package:admin_dashbuard/provider/noticisasProvider.dart';
import 'package:admin_dashbuard/provider/pedidos/pedidosProvider.dart';
import 'package:admin_dashbuard/provider/studentsProvider.dart';
import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/sideMenuProvide.dart';
import 'package:admin_dashbuard/provider/userFromProvider.dart';
import 'package:admin_dashbuard/provider/usuariosProvider.dart';
import 'package:admin_dashbuard/router/router.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/services/notificationService.dart';
import 'package:admin_dashbuard/ui/layout/auth/authLayout.dart';
import 'package:admin_dashbuard/ui/layout/dashboard/dashboardLayout.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'api/AllApi.dart';
import 'provider/carrerasProvider.dart';
import 'provider/clientes/clientesFromProvider.dart';
import 'provider/configuracion/estadosPedidosProvider.dart';
import 'provider/homeProvider.dart';
import 'provider/pedidos/pedidosFromProvider.dart';
import 'provider/productos/productosFromProvider.dart';
import 'provider/productos/productosProvider.dart';
import 'ui/layout/splash/splashAuthLayout.dart';
import 'ui/views/webView/register_web_webview.dart'
    if (dart.library.html) 'ui/views/webView/register_web_webview.dart';

void main() {
  Flurorouter.configureRoutes();
  AllApi.configuteDio();
  registerWebViewWebImpementation();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('__________>ZZZZZ');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
        ChangeNotifierProvider(lazy: false, create: (_) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_) => UsuariosProvider()),
        ChangeNotifierProvider(create: (_) => UserFormProvider()),

        //Clientes
        ChangeNotifierProvider(create: (_) => ClientesProvider()),
        ChangeNotifierProvider(create: (_) => ClientesFormProvider()),

        //Productos
        ChangeNotifierProvider(create: (_) => ProductosProvider()),
        ChangeNotifierProvider(create: (_) => ProductosFormProvider()),

        //Pedidos
        ChangeNotifierProvider(create: (_) => PedidosProvider()),
        ChangeNotifierProvider(create: (_) => PedidosFormProvider()),

        ChangeNotifierProvider(create: (_) => StudentsProvider()),
        ChangeNotifierProvider(create: (_) => CarrerasProvider()),
        ChangeNotifierProvider(create: (_) => NoticiasProvider()),
        ChangeNotifierProvider(create: (_) => NoticiaFromProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => EstadosPedidosFormProvider()),
        ChangeNotifierProvider(create: (_) => EstadosPedidosProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    String route = '';

    if (authProvider.authStatus == AuthStatus.authenticated) {
      route = '/dashboard';
    }

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      route = '/auth/login';
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pido',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationService.msnKey,
      builder: (_, child) {
        print(authProvider.authStatus.toString() + ' ' + route + ' ');

        if (authProvider.authStatus == AuthStatus.checking) {
          return SplashAuthLayout();
        } else {
          if (authProvider.authStatus == AuthStatus.authenticated) {
            return DashboardLayout(child: child!);
          } else {
            return AuthLayout(child: child!);
          }
        }
      },
      theme: ThemeData.light().copyWith(
          scrollbarTheme: ScrollbarThemeData()
              .copyWith(thumbColor: MaterialStateProperty.all(Colors.white38))),
    );
  }
}
