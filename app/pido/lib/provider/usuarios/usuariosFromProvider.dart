import 'package:flutter/cupertino.dart';

class UsuariosFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkey = new GlobalKey<FormState>();

  String id = '';
  String nombre = '';
  String documento = '';
  String departamento = '';
  String ciudad = '';
  String direccion = '';
  String telefono = '';
  String celular = '';
  String correo = '';

  validateFrom() {
    if (fromkey.currentState.validate()) {
      print('from valid ... login');

      return true;
    } else {
      print('from not valid');
      return false;
    }
  }
}
