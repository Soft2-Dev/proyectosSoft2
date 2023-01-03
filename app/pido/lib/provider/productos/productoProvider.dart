import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pido/api/AllApi.dart';
import 'package:pido/models/pedidos/carritoModelo.dart';
import 'package:pido/models/productosModelo.dart';
import 'package:provider/provider.dart';

import '../../models/pedidos/pedidosModelo.dart';
import '../../serices/localStorage.dart';
import '../../serices/notificationService.dart';
import '../validaClientes/validaClientesProvider.dart';

class ProviderProductos extends ChangeNotifier {
  List<Producto> productos = [];
  List<Detalle> detalle = [];

  Producto productosSeleccion;
  String idPedido;
  String isSelectProducto = '0';
  bool isProducto = false;
  bool isCarrito = false;
  int gTotal;
  String idCliente;
  String nombre;

  String id = '1';

  asignaCliente(String nombre, String idCliente) {
    this.idCliente = idCliente;
    this.nombre = nombre;
    notifyListeners();
  }

  ///aquiii

  getProductos() async {
    print('/webService.php?case=2');
    final idUsuarioLogeo = LocalStorage.prefs.getString("idUsuarioLogeo");
    String url = '';

    if (idUsuarioLogeo == null) {
      url = '/webService.php?case=2';
    } else {
      url = '/webService.php?case=2';
    }
    print(AllApi.url + url);
    final resp = await AllApi.httpGet('/webService.php?case=2');
    print(resp);
    final dataMap = jsonDecode(resp);
    final Productos categorias = new Productos.fromlist(dataMap['rpta']);
    this.productos = categorias.dato;
    if (categorias.dato[0].rp == 'ok') {
      isProducto = true;
    }
    notifyListeners();
  }

  getGuardarProductos(
      String cod, String cantidad, String valor, BuildContext context) async {
    String idClientePedido = '';
    String idUsuario = '';

    final rol = LocalStorage.prefs.getString("rol");
    if (rol == '27') {
      idUsuario = LocalStorage.prefs.getString("idUsuarioLogeo");
      idClientePedido = LocalStorage.prefs.getString("idUsuarioLogeo");
    } else {
      idClientePedido = LocalStorage.prefs.getString('idClienteValida');
      idUsuario = LocalStorage.prefs.getString("idUsuarioLogeo");
    }

    String url =
        "/webService.php?case=6&idUsuario=$idUsuario&idcliente=$idClientePedido&&codigo=$cod&cantidad=$cantidad&valor=$valor";

    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print("*********   " + resp);
    final dataMap = jsonDecode(resp);
    final Pedidos pedidos = new Pedidos.fromlist(dataMap['rpta']);
    if (pedidos.dato[0].rp == 'ok') {
      idPedido = pedidos.dato[0].id;
      LocalStorage.prefs.setString('cantidad', pedidos.dato[0].cantidad);
      LocalStorage.prefs.setString('idPedido', pedidos.dato[0].id);
      NotificationService.showSnackBarExito('Producto Agregado');
      Navigator.pop(context);
    }
    notifyListeners();
  }

  getDetallePedido() async {
    //
    final idPedido = LocalStorage.prefs.getString("idPedido");
    String url = "/webService.php?case=10&idPedido=$idPedido";
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print("*********   " + resp);
    final dataMap = jsonDecode(resp);
    final Detalles detalle = new Detalles.fromlist(dataMap['rpta']);
    this.detalle = detalle.dato;
    if (detalle.dato[0].rp == 'ok') {
      //LocalStorage.prefs.setString('idPedido', detalle.dato[0].id);
      isCarrito = true;
      gTotal = 0;
      for (var i = 0; i < detalle.dato.length; i++) {
        print(detalle.dato[i].totalProducto);
        gTotal += int.parse(detalle.dato[i].totalProducto);
      }
    }
    notifyListeners();
  }

  menosDetalle(int nTotal, String idDetalle) async {
    //UPDATE `detallePedido` SET `cantidad`=cantidad-1, `totalProducto`=5 WHERE `id`=3
    final idPedido = LocalStorage.prefs.getString("idPedido");
    String url = "/webService.php?case=11&idDetalle=$idDetalle&nTotal=$nTotal";
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print("*********   " + resp);
    final dataMap = jsonDecode(resp);
    final Detalles detalle = new Detalles.fromlist(dataMap['rpta']);
    this.detalle = detalle.dato;
    if (detalle.dato[0].rp == 'ok') {
      getDetallePedido();
    }
    // notifyListeners();
  }

  masDetalle(int nTotal, String idDetalle) async {
    //UPDATE `detallePedido` SET `cantidad`=cantidad-1, `totalProducto`=5 WHERE `id`=3
    final idPedido = LocalStorage.prefs.getString("idPedido");
    String url = "/webService.php?case=12&idDetalle=$idDetalle&nTotal=$nTotal";
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print("*********   " + resp);
    final dataMap = jsonDecode(resp);
    final Detalles detalle = new Detalles.fromlist(dataMap['rpta']);
    this.detalle = detalle.dato;
    if (detalle.dato[0].rp == 'ok') {
      getDetallePedido();
    }
    // notifyListeners();
  }

  pausaPedido(BuildContext context) async {
    //UPDATE `detallePedido` SET `cantidad`=cantidad-1, `totalProducto`=5 WHERE `id`=3
    final idPedido = LocalStorage.prefs.getString("idPedido");
    String url = "/webService.php?case=19&idPedido=$idPedido";
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print("*********   " + resp);
    final dataMap = jsonDecode(resp);
    final Detalles detalle = new Detalles.fromlist(dataMap['rpta']);
    if (detalle.dato[0].rp == 'ok') {
      final providerw =
          Provider.of<ValidaClientesProvider>(context, listen: false);
      print('ffffff');

      isCarrito = false;
      gTotal = 0;
      LocalStorage.prefs.remove("idPedido");
      LocalStorage.prefs.remove("cantidad");
      LocalStorage.prefs.remove("nombreClienteValida");
      LocalStorage.prefs.remove("idClienteValida");
      providerw.asignaCliente('', '');
    }
    notifyListeners();
  }

  finPedido(BuildContext context) async {
    //UPDATE `detallePedido` SET `cantidad`=cantidad-1, `totalProducto`=5 WHERE `id`=3
    final idPedido = LocalStorage.prefs.getString("idPedido");
    String url = "/webService.php?case=13&idPedido=$idPedido";
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print("*********   " + resp);
    final dataMap = jsonDecode(resp);
    final Detalles detalle = new Detalles.fromlist(dataMap['rpta']);
    if (detalle.dato[0].rp == 'ok') {
      getDetallePedido();
      isCarrito = false;
      gTotal = 0;
      LocalStorage.prefs.remove("idPedido");
      LocalStorage.prefs.remove("cantidad");
      Navigator.pop(context);
    }
    // notifyListeners();
  }
}
