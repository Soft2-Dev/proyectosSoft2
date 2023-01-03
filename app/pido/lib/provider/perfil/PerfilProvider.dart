import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pido/api/AllApi.dart';
import 'package:pido/models/productosModelo.dart';
import 'package:pido/provider/categoriasProvider.dart';

import '../../models/perfil/PerfilModelo.dart';
import '../../serices/localStorage.dart';

class PerfilProvider extends ChangeNotifier {
  List<Perfil> perfiles = [];
  bool isProducto = false;

  getPerfiles() async {
    String idLogueo = LocalStorage.prefs.getString('idUsuarioLogeo');
  

    String idvalida = LocalStorage.prefs.getString('idClienteValida');


    String id = '';

    if (idvalida != null) {
      id = idvalida;
    } else {
      id = idLogueo;
    }
    print('ssssssssss ' + id);
    String url = "/webService.php?case=4&id=$id";
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print("*********   " + resp);
    final dataMap = jsonDecode(resp);
    final Perfiles perfiles = new Perfiles.fromlist(dataMap['rpta']);
    this.perfiles = perfiles.dato;
    if (perfiles.dato[0].rp == 'ok') {
      isProducto = true;
    }
    notifyListeners();
  }

  getEditar(String departamento, String ciudad, String direccion,
      String telefono, String celular, String correo, String id) async {
    String url =
        "/webService.php?case=5&departamento=$departamento&ciudad=$ciudad&direccion=$direccion&telefono=$telefono&celular=$celular&correo=$correo&id=$id";
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print("*********   " + resp);
    final dataMap = jsonDecode(resp);
    final Perfiles perfiles = new Perfiles.fromlist(dataMap['rpta']);
    this.perfiles = perfiles.dato;
    if (perfiles.dato[0].rp == 'ok') {
      isProducto = true;
    }
    notifyListeners();
  }
}
