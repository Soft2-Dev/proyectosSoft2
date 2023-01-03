import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pido/api/AllApi.dart';
import '../../models/pedidos/misPedidosModelo.dart';
import '../../serices/localStorage.dart';

class MisPedidosProvider extends ChangeNotifier {
  List<MiPedido> miPedidos = [];
  bool isMiPedidos = false;

  getMisPedidos() async {
    isMiPedidos = false;
    String id = LocalStorage.prefs.getString('idUsuarioLogeo');

    String url = "/webService.php?case=21&id=$id";
    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print("*********   " + resp);
    final dataMap = jsonDecode(resp);
    final MisPedidos miPedidos = new MisPedidos.fromlist(dataMap['rpta']);
    this.miPedidos = miPedidos.dato;
    if (miPedidos.dato[0].rp == 'ok') {
      isMiPedidos = true;
    }
    notifyListeners();
  }
}
