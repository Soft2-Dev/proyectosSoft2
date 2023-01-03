import 'package:admin_dashbuard/router/adminHandlers.dart';
import 'package:admin_dashbuard/router/dashnoardHandlers.dart';

import 'package:admin_dashbuard/router/view404Handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  // Auth Route
  static String rootRoute = '/';

  // Auth Route
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';

  static String clientesRoute = '/dashboard/clientes';
  static String clienteRoute = '/dashboard/estudiantes/:uid';

  static String usuariosRoute = '/dashboard/usuarios';
  static String newUsuarioRoute = '/dashboard/registro-usuarios/:rol';

  static String productosRoute = '/dashboard/productos';
  static String newproductoRoute = '/dashboard/registro-producto';

  static String pedidosRoute = '/dashboard/pedidos';
  static String detallePedidosRoute = '/dashboard/detalle-pedido/:id';

  static String editUsuarioRoute = '/dashboard/editar-usuarios/:id';
  static String noticiaFinalRoute = '/dashboard/finalnoticia/:id';
  static String noticiaEditarRoute = '/dashboard/editarnoticia/:id';
  static String perfilRoute = '/dashboard/perfil';

  static String cargarUsuarios = '/dashboard/cargarusuarios';
  static String cargarClientes = '/dashboard/cargarclientes';
  static String cargarProductos = '/dashboard/cargarproductos';

  static String estadosRoute = '/dashboard/estadosRoute'; //estadosRoute

  //rutas de la pagina

  static void configureRoutes() {
    // manejador rupas para las paginas
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);

    // router login
    router.define(loginRoute,
        handler: AdminHandlers.login,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 100));

    //router dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboardMain,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    //router perfil
    router.define(perfilRoute,
        handler: DashboardHandlers.perfil,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router icons
    router.define(iconsRoute,
        handler: DashboardHandlers.icons,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router usuarios
    router.define(usuariosRoute,
        handler: DashboardHandlers.usuarios,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router usuarios
    router.define(newUsuarioRoute,
        handler: DashboardHandlers.newUsuarios,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router Clientes
    router.define(clientesRoute,
        handler: DashboardHandlers.clientes,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router usuarios
    router.define(editUsuarioRoute,
        handler: DashboardHandlers.editUsuarios,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router pedidos
    router.define(pedidosRoute,
        handler: DashboardHandlers.pedidos,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router detalle
    router.define(detallePedidosRoute,
        handler: DashboardHandlers.detallePedido,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router productos
    router.define(productosRoute,
        handler: DashboardHandlers.productos,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router productos
    router.define(newproductoRoute,
        handler: DashboardHandlers.producto,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router final noticia
    router.define(noticiaFinalRoute,
        handler: DashboardHandlers.noticiaFinal,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router editar noticia
    router.define(noticiaEditarRoute,
        handler: DashboardHandlers.noticiaEditarFinal,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    // router blank
    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));
    // router blank
    router.define(estadosRoute,
        handler: DashboardHandlers.estadosRoute,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.define(cargarClientes,
        handler: DashboardHandlers.cargarClientes,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    router.define(cargarUsuarios,
        handler: DashboardHandlers.cargarUsuarios,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));

    //cargarProductos
    router.define(cargarProductos,
        handler: DashboardHandlers.cargarProductos,
        transitionType: TransitionType.fadeIn,
        transitionDuration: Duration(milliseconds: 75));


    //page 404

    router.notFoundHandler = View404Handlers.view404;
  }
}
