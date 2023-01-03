import 'dart:convert';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/material.dart';

import '../../api/AllApi.dart';
import '../../models/modeloAuth/modeloUsuarios.dart';
import '../../serices/localStorage.dart';
import '../../serices/notificationService.dart';

class ValidaClientesProvider extends ChangeNotifier {
  List<Usuario> usuario = [];
  String rol = '0';
  bool isUsuario = false;
  String idCliente;
  String nombre;

  getUsuario(String documento) async {
    String url = '/webService.php?case=17&docu=$documento';

    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print(resp);
    final dataMap = jsonDecode(resp);
    final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);

    if (usuarios.dato[0].rp != 'ok') {
      NotificationService.showSnackBarError('Usuario no Existe');
    } else {
      this.isUsuario = true;
      this.usuario = usuarios.dato;
    }
    notifyListeners();
  }

  getUsuarios() async {
    String url = '/webService.php?case=18';

    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print(resp);
    final dataMap = jsonDecode(resp);
    final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);

    if (usuarios.dato[0].rp != 'ok') {
      NotificationService.showSnackBarError('Usuario no Existe');
    } else {
      this.isUsuario = true;
      this.usuario = usuarios.dato;
    }
    notifyListeners();
  }

  setUsuarios(String nombre, String documento, String ciudad, String direccion,
      String celular, String correo, BuildContext context) async {
    var pass = new DBCrypt().hashpw(documento, new DBCrypt().gensalt());

    String url =
        '/webService.php?case=20&nombre=$nombre&documento=$documento&ciudad=$ciudad&direccion=$direccion&celular=$celular&correo=$correo&pass=$pass';

    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print(resp);
    final dataMap = jsonDecode(resp);
    final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);

    if (usuarios.dato[0].rp == 'ok') {
      
      NotificationService.showSnackBarExito('Cliente Registrado');

      this.isUsuario = true;
      this.usuario = usuarios.dato;
    } else if (usuarios.dato[0].rp == 'Existe') {
      //Documento Ya Existe
      NotificationService.showSnackBarError('Documento Ya Existe');
    }

    getUsuarios();
    Navigator.pop(context);
  }

  asignaCliente(String nombre, String idCliente) {
    this.idCliente = idCliente;
    this.nombre = nombre;
    notifyListeners();
  }
}
