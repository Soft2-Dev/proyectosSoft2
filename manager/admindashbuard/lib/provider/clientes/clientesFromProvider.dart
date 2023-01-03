import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:admin_dashbuard/services/notificationService.dart';
import 'package:flutter/material.dart';

class ClientesFormProvider extends ChangeNotifier {
  Usuario? user;
  GlobalKey<FormState> fromkeyUsuario = new GlobalKey<FormState>();

  // id = datos['id'];
  // documento = datos['documento'];
  // nombre = datos['nombre'];
  // telefono = datos['telefono'];
  // correo = datos['correo'];
  // direccion = datos['direccion'];
  // contrasena = datos['contrasena'];
  // rol = datos['rol'];
  // estado = datos['estado'];

  copyUserWith({
    String? id,
    String? documento,
    String? nombre,
    String? telefono,
    String? correo,
    String? direccion,
    String? contrasena,
    String? rol,
    String? estado,
  }) {
    user = new Usuario(
      id: id ?? this.user!.id,
      documento: nombre ?? this.user!.nombre,
      nombre: correo ?? this.user!.correo,
      telefono: telefono ?? this.user!.telefono,
      correo: direccion ?? this.user!.direccion,
      direccion: rol ?? this.user!.rol,
      contrasena: estado ?? this.user!.estado,
      rol: estado ?? this.user!.estado,
      estado: estado ?? this.user!.estado,
    );
    notifyListeners();
  }

  bool _validForm() {
    return fromkeyUsuario.currentState!.validate();
  }

  updateUser(uid) async {
    if (!this._validForm()) return;

    final data = {
      'case': '7',
      'nombre': user!.nombre,
      'correo': user!.correo,
      'telefono': user!.telefono,
      'direccion': user!.direccion,
      'token': uid,
    };

    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      user = usuarios.dato[0];
      NotificationService.showSnackBarExito('Datos Actualizados Exitosamente');
    }).catchError((onError) {
      print(onError.toString());
    });
  }
}
