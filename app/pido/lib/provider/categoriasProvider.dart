import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pido/api/AllApi.dart';
import 'package:pido/models/categoriaModelo.dart';
import 'package:pido/models/productosModelo.dart';

class ProviderCategorias extends ChangeNotifier {
  List<Categoria> categorias = [];
  List<Producto> productos = [];
  String isSelectCategoria = '0';
  String isCategoria = 'Categoria';
  bool isCategorias = false;

  getcategorias() async {
    print('/webService.php?case=1');
    final resp = await AllApi.httpGet('/webService.php?case=1');
    print(resp);
    final dataMap = jsonDecode(resp);

    final Categorias categorias = new Categorias.fromlist(dataMap['rpta']);
    this.categorias = categorias.dato;

    if (categorias.dato[0].rp == 'ok') {
      isCategorias = true;
    }
    notifyListeners();
  }

  getCategoriaProductos() async {
    String url = '/webService.php?case=3&id=$isSelectCategoria';
    print(AllApi.url + url);

    final resp = await AllApi.httpGet(url);
    print(resp);
    final dataMap = jsonDecode(resp);

    final Productos productos = new Productos.fromlist(dataMap['rpta']);
    this.productos = productos.dato;

    if (productos.dato[0].rp == 'ok') {
      isCategorias = true;
    }
    notifyListeners();
  }
}
