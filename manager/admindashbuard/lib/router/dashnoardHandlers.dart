import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/sideMenuProvide.dart';
import 'package:admin_dashbuard/router/router.dart';
import 'package:admin_dashbuard/services/localStorage.dart';
import 'package:admin_dashbuard/ui/views/auth/loginView.dart';

import 'package:admin_dashbuard/ui/views/rolUsuario/PerfilView.dart';
import 'package:admin_dashbuard/ui/views/blankView.dart';
import 'package:admin_dashbuard/ui/views/dashboardView.dart';
import 'package:admin_dashbuard/ui/views/iconsView.dart';

import 'package:admin_dashbuard/ui/views/rolUsuario/noticiasViewUsuario.dart';
import 'package:admin_dashbuard/ui/views/roladmin/cargas/CargarProductos.dart';
import 'package:admin_dashbuard/ui/views/roladmin/cargas/CargarUsuarios.dart';
import 'package:admin_dashbuard/ui/views/roladmin/pedidos/PedidosView.dart';

import 'package:admin_dashbuard/ui/views/roladmin/newUsuarios.dart';
import 'package:admin_dashbuard/ui/views/roladmin/noticiaEditar.dart';
import 'package:admin_dashbuard/ui/views/roladmin/noticiaFinalView.dart';

import 'package:admin_dashbuard/ui/views/roladmin/usuariosView.dart';

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../ui/views/configuracion/estadosPedidos.dart';
import '../ui/views/roladmin/cargas/CargarClientes.dart';

import '../ui/views/roladmin/clientes/clientesView.dart';
import '../ui/views/roladmin/editarUsuarios.dart';
import '../ui/views/roladmin/pedidos/detallePedidos.dart';
import '../ui/views/roladmin/productos/ProductosView.dart';
import '../ui/views/roladmin/productos/newProductos.dart';

class DashboardHandlers {
  // manejador de dashboard
  static Handler dashboardMain = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return DashboardView();
    else
      return LoginView();
  });

  // manejador de dashboard
  static Handler perfil = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      final token = LocalStorage.prefs.getString('token')!;
      return PerfilView(
        uid: token,
      );
    } else
      return LoginView();
  });

  // manejador de Icons
  static Handler icons = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.iconsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return IconsView();
    else
      return LoginView();
  });

  // manejador de usuarios
  static Handler usuarios = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.usuariosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return UsuariosView();
    else
      return LoginView();
  });

  // manejador de usuarios
  static Handler clientes = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.clientesRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return ClientesView();
    else
      return LoginView();
  });

  // manejador de Detalle
  static Handler detallePedido = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.detallePedidosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return DetallePedidos(id: params['id']!.first);
    else
      return LoginView();
  });

  // manejador de Nuevo usuarios
  static Handler newUsuarios = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.newUsuarioRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return NewUsuarios(rol: params['rol']!.first);
    else
      return LoginView();
  });

  // manejador de Nuevo usuarios
  static Handler editUsuarios = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.newUsuarioRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return EditUsuarios(id: params['id']!.first);
    else
      return LoginView();
  });

  // manejador de students

  // manejador de blank
  static Handler blank = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return BlankView();
    else
      return LoginView();
  });

  // manejador de cursos
  static Handler pedidos = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.pedidosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return PedidosView();
    else
      return LoginView();
  });

  // manejador de productos
  static Handler productos = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    final rol = LocalStorage.prefs.getString('rol');
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.productosRoute);
    if (authProvider.authStatus == AuthStatus.authenticated)
      return ProductosView();
    else
      return LoginView();
  });

  static Handler producto = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.newproductoRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return NewProductos();
    else
      return LoginView();
  });

  static Handler noticiaFinal = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.noticiaFinalRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return NoticiaFinalView(id: params['id']!.first);
    else
      return LoginView();
  });

  static Handler noticiaEditarFinal =
      new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.noticiaEditarRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return NoticiaEditarView(id: params['id']!.first);
    else
      return LoginView();
  });

  // manejador de estados

  static Handler estadosRoute = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.estadosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return EstadosPedidosView();
    else
      return LoginView();
  });

  static Handler cargarClientes = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.estadosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return CargarClientes();
    else
      return LoginView();
  });

  static Handler cargarUsuarios = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.estadosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return CargarUsuarios();
    else
      return LoginView();
  });

  //cargarProductos

  static Handler cargarProductos = new Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.estadosRoute);

    if (authProvider.authStatus == AuthStatus.authenticated)
      return CargarProductos();
    else
      return LoginView();
  });
}
