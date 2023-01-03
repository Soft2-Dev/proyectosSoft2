import 'package:flutter/material.dart';

class EstadosPedidosFormProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = new GlobalKey<FormState>();

  String id = '';
  String parametro = '';
  String tipoParametro = '';
  String confi = '';
  

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
