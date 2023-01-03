import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/clientes/Clientes.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:flutter/material.dart';

import '../../models/productos/Categorias.dart';
import '../../models/productos/Productos.dart';
import '../../services/notificationService.dart';

class ProductosProvider extends ChangeNotifier {
  List<Producto> producto = [];
  List<Producto> productoBuscar = [];
  List<Categoria> categoria = [];

  bool ascending = true;
  bool isBuscar = false;
  bool isCategoria = false;
  String isSelectCategoria = 'Categoria';
  String isSelectIdCategoria = 'Categoria';

  int? sortColumnIndex;

  getProductos() async {
    String url = '/FranciaApi.php?case=6';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Productos productos = new Productos.fromlist(dataMap['rpta']);
    this.producto = productos.dato;
    //print(this.estudiantes);
    notifyListeners();
  }

  getCategorias() async {
    String url = '/FranciaApi.php?case=8';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Categorias categoria = new Categorias.fromlist(dataMap['rpta']);
    this.categoria = categoria.dato;
    if (categoria.dato[0].rp == 'ok') {
      isCategoria = true;
    }
    //print(this.estudiantes);
    notifyListeners();
  }

  buscarUsuarios(String id) async {
    String url = '/FranciaApi.php?case=2&id=$id';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Productos productos = new Productos.fromlist(dataMap['rpta']);
    producto = productos.dato;
    if (productos.dato[0].rp == 'ok') {
      this.isBuscar = true;
    }

    //print(this.estudiantes);
    notifyListeners();
  }

  inactivarProductos(String id, String s) async {
    String url = '/FranciaApi.php?case=7&id=$id&estado=$s';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Productos productos = new Productos.fromlist(dataMap['rpta']);
    producto = productos.dato;
    if (productos.dato[0].rp == 'ok') {
      this.isBuscar = true;
    }

    //print(this.estudiantes);
    notifyListeners();
  }

  registrarProductos(
      String posicion,
      String plu,
      String producto,
      String cantidad,
      String descripcion,
      String referencia,
      String presentacion,
      String valorMayor,
      String valorDetal,
      String impuesto,
      String url2,
      String estado,
      BuildContext context) async {
    String url =
        '/FranciaApi.php?case=9&posicion=$posicion&plu=$plu&producto=$producto&cantidad=$cantidad&descripcion=$descripcion&referencia=$referencia&presentacion=$presentacion&valorMayor=$valorMayor&valorDetal=$valorDetal&impuesto=$impuesto&categoria=$isSelectIdCategoria&url=$url2&estado=$estado';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Productos productos = new Productos.fromlist(dataMap['rpta']);
    this.producto = productos.dato;
    if (productos.dato[0].rp == 'ok') {
      this.isBuscar = true;
      NotificationService.showSnackBarExito('Producto Creado Exitosamente');
      Navigator.pop(context);
    }

    //print(this.estudiantes);
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Producto user) getField) {
    producto.sort((a, b) {
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
