import 'package:flutter/material.dart';

class ProductosFormProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = new GlobalKey<FormState>();

  String id = '';
  String posicion = '';
  String plu = '';
  String producto = '';
  String cantidad = '';
  String descripcion = '';
  String referencia = '';
  String presentacion = '';
  String valorMayor = '';
  String valorDetal = '';
  String impuesto = '';
  String fecha = '';
  String categoria = '';
  String url = '';
  String estado = '';

  validateFrom() {
    if (fromkey.currentState!.validate()) {
      print('from valid ... login');

      return true;
    } else {
      print('from not valid');
      return false;
    }
  }
}
