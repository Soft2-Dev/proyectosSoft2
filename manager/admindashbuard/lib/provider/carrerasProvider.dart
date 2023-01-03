import 'dart:convert';
import 'dart:typed_data';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/carrerasModels.dart';

import 'package:flutter/cupertino.dart';

class CarrerasProvider extends ChangeNotifier {
  List<Carrera> carreras = [];

  getCarrera(String estado) async {
    final resp =
        await AllApi.httpGet('/FranciaApi.php?case=2&estado=' + estado);
    //print(resp);
    final dataMap = jsonDecode(resp);

    final Carreras carreras = new Carreras.fromlist(dataMap['rpta']);
    this.carreras = carreras.dato;
    //print(this.carreras);
    notifyListeners();
  }

  Future newCarrera(String carrera, String descripcion, String url) async {
    final data = {
      'case': '4',
      'carrera': carrera,
      'descripcion': descripcion,
      'url': url,
      'estado': '1'
    };

    try {
      final json = await AllApi.httpPost('/FranciaApi.php', data);

      final dataMap = jsonDecode(json);

      final Carreras carreras = new Carreras.fromlist(dataMap['rpta']);
      this.carreras = carreras.dato;
      notifyListeners();
    } catch (e) {
      print('Error en crear Carrera ' + e.toString());
    }
  }

  Future editardesCarrera(
      String id, String carrera, String descripcion, String url) async {
    final data = {
      'case': '5',
      'id': id,
      'carrera': carrera,
      'descripcion': descripcion,
      'img': url,
      'estado': '1'
    };

    try {
      final json = await AllApi.httpPost('/FranciaApi.php', data);

      final dataMap = jsonDecode(json);

      final Carreras carreras = new Carreras.fromlist(dataMap['rpta']);
      this.carreras = carreras.dato;

      notifyListeners();
    } catch (e) {
      print('Error en editar Carrera ' + e.toString());
    }
  }

  Future borrarCarrera(String id, String estado) async {
    final data = {'case': '6', 'id': id, 'estado': estado};

    try {
      final json = await AllApi.httpPost('/FranciaApi.php', data);

      final dataMap = jsonDecode(json);

      final Carreras carreras = new Carreras.fromlist(dataMap['rpta']);
      this.carreras = carreras.dato;

      notifyListeners();
    } catch (e) {
      print('Error en editar Carrera ' + e.toString());
    }
  }
}
