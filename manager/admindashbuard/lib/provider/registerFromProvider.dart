import 'package:flutter/material.dart';

class RegisterFromProvider extends ChangeNotifier {
  GlobalKey<FormState> fromkeyRegister = new GlobalKey<FormState>();
  String documento = '';
  String name = '';
  String telefono = '';
  String correo = '';
  String direccion = '';
  String ciudad = '';
  String contrasena = '';
  String porcentaje = '';

  validateFrom() {
    if (fromkeyRegister.currentState!.validate()) {
      print('from valid ... login');
      //print('$email ==== $password === $name');
      return true;
    } else {
      print('from not valid');
      return false;
    }
  }
}
