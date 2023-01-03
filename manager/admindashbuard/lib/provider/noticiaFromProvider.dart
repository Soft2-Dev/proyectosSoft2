import 'package:flutter/material.dart';

class NoticiaFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkeyNotice = new GlobalKey<FormState>();

  String imagen = '';
  String titulo = '';
  String descricion = '';
  String urlnota = '';

  validateFrom() {
    if (fromkeyNotice.currentState!.validate()) {
      //print('from valid ... login');
      //print('$email ==== $password === $name');
      return true;
    } else {
      //print('from not valid');
      return false;
    }
  }
}
