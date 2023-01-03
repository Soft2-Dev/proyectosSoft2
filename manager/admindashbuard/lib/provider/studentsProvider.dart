import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/documents.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';

import 'package:flutter/cupertino.dart';

class StudentsProvider extends ChangeNotifier {
  List<Usuario> estudiantes = [];
  List<Usuario> perfil = [];
  List<Documento> documents = [];
  bool ascending = true;
  int? sortColumnIndex;

  getEstudiantes() async {
    final resp = await AllApi.httpGet('/FranciaApi.php?case=1&rol=2');
    final dataMap = jsonDecode(resp);
    final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
    estudiantes = usuarios.dato;

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

  Future<List<Usuario>> getEstudiante(String uid) async {
    try {
      final resp = await AllApi.httpGet('/FranciaApi.php?case=3&token=' + uid);
      final dataMap = jsonDecode(resp);
      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      perfil = usuarios.dato;
     
      final user = usuarios.dato;
      return user;
    } catch (e) {
      print('Error en consulta de usuario  ' + e.toString());
      throw e;
    }
  }

  getdocuments(String uid) async {
    try {
      final resp = await AllApi.httpGet('/FranciaApi.php?case=4&token=' + uid);
      final dataMap = jsonDecode(resp);
      final Documentos documents = new Documentos.fromlist(dataMap['rpta']);
      this.documents = documents.dato;
      notifyListeners();
    } catch (e) {
      print('Error en consulta de de documentos  ' + e.toString());
      throw e;
    }
  }
}
