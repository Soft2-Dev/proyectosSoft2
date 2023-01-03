import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';

import 'package:admin_dashbuard/models/confirma.dart';

import 'package:admin_dashbuard/models/pedidos/Pedidos.dart';

import 'package:flutter/material.dart';

import '../../services/notificationService.dart';

class EstadosPedidosProvider extends ChangeNotifier {
  guardarEstados(String nombre, String color) async {
    String url = '/FranciaApi.php?case=14&nombre=$nombre&confi=$color';
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    final dataMap = jsonDecode(resp);
    print(dataMap);
    final Confirmas rp = new Confirmas.fromlist(dataMap['rpta']);

    if (rp.dato[0].rp == 'ok') {
      NotificationService.showSnackBarExito(
          'Nuevo estado ' + nombre + ' guardado');
    }

    //print(this.estudiantes);
    notifyListeners();
  }
}
