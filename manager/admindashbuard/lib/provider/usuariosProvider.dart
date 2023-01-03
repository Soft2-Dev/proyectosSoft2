import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:flutter/material.dart';

class UsuariosProvider extends ChangeNotifier {
  List<Usuario> estudiantes = [];
  List<Usuario> usuarioBuscar = [];
  bool ascending = true;
  bool isBuscar = false;

  int? sortColumnIndex;

  getUsuarios() async {
    String url = '/FranciaApi.php?case=1';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
    estudiantes = usuarios.dato;

    //print(this.estudiantes);
    notifyListeners();
  }

  buscarUsuarios(String id) async {
    String url = '/FranciaApi.php?case=2&id=$id';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
    usuarioBuscar = usuarios.dato;
    if (usuarios.dato[0].rp == 'ok') {
      this.isBuscar = true;
    }

    //print(this.estudiantes);
    notifyListeners();
  }

  inactivarUsuarios(String id, String s) async {
    String url = '/FranciaApi.php?case=3&id=$id&estado=$s';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
    estudiantes = usuarios.dato;
    if (usuarios.dato[0].rp == 'ok') {
      this.isBuscar = true;
    }

    //print(this.estudiantes);
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Usuario user) getField) {
    estudiantes.sort((a, b) {
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
