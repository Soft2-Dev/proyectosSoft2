import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/clientes/Clientes.dart';
import 'package:admin_dashbuard/models/confirma.dart';
import 'package:admin_dashbuard/models/pedidos/DetallePedidos.dart';
import 'package:admin_dashbuard/models/pedidos/Pedidos.dart';
import 'package:flutter/material.dart';

import '../../models/pedidos/EstadosPedidos.dart';
import '../../services/notificationService.dart';

class PedidosProvider extends ChangeNotifier {
  List<Pedido> pedidos = [];
  List<Detalle> detalles = [];
  List<Estado> estado = [];

  bool ascending = true;
  bool isBuscar = false;
  late String idIdSelectEstado;
  String selectEstado = 'Estado';
  late int colorEstado = 0;
  late Pedido isSelectPedido;

  int? sortColumnIndex;

  getPedidos() async {
    String url = '/FranciaApi.php?case=10';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Pedidos pedidos = new Pedidos.fromlist(dataMap['rpta']);
    this.pedidos = pedidos.dato;
    //print(this.estudiantes);
    notifyListeners();
  }

  getDetalle(String id) async {
    String url = '/FranciaApi.php?case=11&id=$id';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Detalles detalles = new Detalles.fromlist(dataMap['rpta']);
    this.detalles = detalles.dato;
    if (detalles.dato[0].rp == 'ok') {
      this.isBuscar = true;
    }

    //print(this.estudiantes);
    notifyListeners();
  }

  getEstados() async {
    String url = '/FranciaApi.php?case=12';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Estados estados = new Estados.fromlist(dataMap['rpta']);
    this.estado = estados.dato;
    if (estados.dato[0].rp == 'ok') {
      this.isBuscar = true;
    }

    //print(this.estudiantes);
    notifyListeners();
  }

  editEstados(String idEstado, String idPedido) async {
    String url =
        '/FranciaApi.php?case=13&idPedido=$idPedido&idEstado=$idEstado';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Confirmas rp = new Confirmas.fromlist(dataMap['rpta']);

    if (rp.dato[0].rp == 'ok') {
      NotificationService.showSnackBarExito(
          'Estado Cambiado a ' + selectEstado);
    }

    //print(this.estudiantes);
    notifyListeners();
  }

  // inactivarUsuarios(String id, String s) async {
  //   String url = '/FranciaApi.php?case=5&id=$id&estado=$s';
  //   print(AllApi.url + url);
  //   final resp = await AllApi.httpGet(url);
  //   final dataMap = jsonDecode(resp);
  //   print(dataMap);
  //   final Clientes usuarios = new Clientes.fromlist(dataMap['rpta']);
  //   pedidos = usuarios.dato;
  //   if (usuarios.dato[0].rp == 'ok') {
  //     this.isBuscar = true;
  //   }

  //   //print(this.estudiantes);
  //   notifyListeners();
  // }

  void sort<T>(Comparable<T> Function(Pedido user) getField) {
    pedidos.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;
    notifyListeners();
  }
}
