import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/noticiasModels.dart';
import 'package:flutter/material.dart';

class NoticiasProvider extends ChangeNotifier {
  List<Noticia> noticias = [];

  Noticia? noticia;
  bool ascending = true;
  int? sortColumnIndex;
  bool isSaveNotice = false;
  bool isLoadImage = false;
  bool existeImage = false;

  getTodasNoticias(String estado) async {
    final resp =
        await AllApi.httpGet('/FranciaApi.php?case=5&estado=' + estado);
    final dataMap = jsonDecode(resp);
    final Noticias usuarios = new Noticias.fromlist(dataMap['rpta']);
    noticias = usuarios.dato;

    //print(this.noticias[0].titulo);
    notifyListeners();
  }

  Future<List<Noticia>> getNoticia(String id) async {
    final resp = await AllApi.httpGet('/FranciaApi.php?case=6&id=' + id);
    final dataMap = jsonDecode(resp);

    final Noticias noticias = new Noticias.fromlist(dataMap['rpta']);
    this.noticia = noticias.dato[0];

    //print(this.noticias[0]);

    final notice = noticias.dato;
    return notice;
  }

  Future borrarNoticia(String id, String estado) async {
    final data = {'case': '8', 'id': id, 'estado': estado};

    try {
      final json = await AllApi.httpPost('/FranciaApi.php', data);

      final dataMap = jsonDecode(json);

      final Noticias noticias = new Noticias.fromlist(dataMap['rpta']);
      this.noticias = noticias.dato;

      notifyListeners();
    } catch (e) {
      print('Error en editar noticias ' + e.toString());
    }
  }

  registerNoticia(String titulo, String descripcion, String urlnota) {
    final data = {
      'case': '9',
      'titulo': titulo,
      'descripcion': descripcion.replaceAll("'", ""),
      'urlnota': urlnota,
    };

    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      //print('-------------> ' + dataMap);
      final Noticias noticias = new Noticias.fromlist(dataMap['rpta']);
      this.noticia = noticias.dato[0];
      this.isSaveNotice = true;
      notifyListeners();
      return true;
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  editarNoticia(String caso, String titulo, String descripcion, String urlnota,
      String id) {
    final data = {
      'case': caso,
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion.replaceAll("'", ""),
      'urlnota': urlnota,
    };

    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      //print('-------------> ' + dataMap);
      final Noticias noticias = new Noticias.fromlist(dataMap['rpta']);
      this.noticia = noticias.dato[0];
      this.isSaveNotice = true;
      notifyListeners();
      return true;
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  void sort<T>(Comparable<T> Function(Noticia noticia) getField) {
    noticias.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;
    notifyListeners();
  }

  getIsLoadImage(bool d) {
    isLoadImage = d;
    notifyListeners();
  }
}
