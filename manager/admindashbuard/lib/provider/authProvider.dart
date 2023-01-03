import 'dart:convert';

import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:admin_dashbuard/router/router.dart';
import 'package:admin_dashbuard/services/localStorage.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/services/notificationService.dart';
import 'package:flutter/material.dart';

import 'package:dbcrypt/dbcrypt.dart';
import 'package:provider/provider.dart';

import 'usuariosProvider.dart';

enum AuthStatus { checking, authenticated, notAuthenticated, nulo }

class AuthProvider extends ChangeNotifier {
  AuthStatus authStatus = AuthStatus.checking;

  bool scrim = false;
  String? _token;
  Usuario? user;
  String? _title;
  Usuarios? usuarios;

  AuthProvider() {
    this._title = 'Login';

    isAuthnticated();
  }

  void settitle(String title) {
    this._title = title;
    notifyListeners();
  }

  void setscrim(bool title) {
    this.scrim = true;
    notifyListeners();
  }

  String get gettitle => _title!;

  login(String email, String password) {
    final data = {
      'case': '1',
      'usu': email,
    };
    print(AllApi.url + '/FranciaApi.php' + data.toString());
    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      print(dataMap);
      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      this.usuarios = usuarios;
      print('xxxxxxxxxxxxxxxxxxxxxxx 1');
      _isValidaEstado(usuarios, password);
    }).catchError((onError) {
      print(onError.toString());
    });
  }

  registroUsuarios(
      String documento,
      String name,
      String telefono,
      String correo,
      String direccion,
      String ciudad,
      String rol,
      BuildContext context,
      String porcentaje) {
    var contrasena = new DBCrypt().hashpw(documento, new DBCrypt().gensalt());
    final data = {
      'case': '2',
      'docu': documento,
      'name': name,
      'tel': telefono,
      'correo': correo,
      'direc': direccion,
      'ciudad': ciudad,
      'rol': rol,
      'contra': contrasena,
      'porcentaje': porcentaje,
    };
    print(AllApi.url + '/FranciaApi.php' + data.toString());
    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      print(dataMap);
      final usu = Provider.of<UsuariosProvider>(context, listen: false);
      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      usu.estudiantes = usuarios.dato;

      if (usuarios.dato[0].rp == 'ok') {
        NotificationService.showSnackBarExito('Usuario Creado Exitosamente');
        Navigator.pop(context);
        notifyListeners();
      } else {
        NotificationService.showSnackBarError('Usuario No Creado');
      }
    }).catchError((onError) {
      print(onError.toString());
    });
    notifyListeners();
  }

  editarUsuarios(
      String documento,
      String name,
      String telefono,
      String correo,
      String direccion,
      String ciudad,
      String rol,
      BuildContext context,
      String porcentaje) {
    //var contrasena = new DBCrypt().hashpw(documento, new DBCrypt().gensalt());
    final data = {
      'case': '3',
      'docu': documento,
      'name': name,
      'tel': telefono,
      'correo': correo,
      'direc': direccion,
      'ciudad': ciudad,
      'porcentaje': porcentaje,
    };
    print(AllApi.url + '/FranciaApi.php' + data.toString());
    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      print(dataMap);
      final usu = Provider.of<UsuariosProvider>(context, listen: false);
      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      usu.estudiantes = usuarios.dato;

      if (usuarios.dato[0].rp == 'ok') {
        NotificationService.showSnackBarExito('Usuario Creado Exitosamente');
        Navigator.pop(context);
        notifyListeners();
      } else {
        NotificationService.showSnackBarError('Usuario No Creado');
      }
    }).catchError((onError) {
      print(onError.toString());
    });
    notifyListeners();
  }

  void _isValidaEstado(Usuarios usuarios, String password) {
    if (usuarios.dato[0].estado == 'NoExiste') {
      NotificationService.showSnackBarError(
          'Usuario No Esta Registrado en Nuestra Base de Datos');
    } else {
      if (usuarios.dato[0].estado == '33') {
        this.user = usuarios.dato[0];
        final String bd = usuarios.dato[0].contrasena.toString();
        final bool isCorrect = new DBCrypt().checkpw(password, bd);
        if (isCorrect) {
          NotificationService.showSnackBarExito(
              'Bienvenido ' + usuarios.dato[0].nombre.toString());
          print('xxxxxxxxxxxxxxxxxxxxxxx 2 ' + usuarios.dato[0].id!);
          LocalStorage.prefs.setString('rol', usuarios.dato[0].rol!);
          LocalStorage.prefs.setString('id', usuarios.dato[0].id!);
          LocalStorage.prefs.setString('nombre', usuarios.dato[0].nombre!);
          LocalStorage.prefs.setString('porcen', usuarios.dato[0].porcentaje!);

          authStatus = AuthStatus.authenticated;
          NavigationService.replaceTo(Flurorouter.dashboardRoute);
          // if (usuarios.dato[0].rol == '26') {
          //   NavigationService.replaceTo(Flurorouter.dashboardRoute);
          // } else {
          //   NavigationService.replaceTo(Flurorouter.productosRoute);
          // }
        } else {
          NotificationService.showSnackBarError(
              'Usuario y/o Contraseña errada');
        }
      } else if (usuarios.dato[0].estado == 'pendiente') {
        NotificationService.showSnackBarIfo(
            'La Cuenta Asociada A Este Correo No Se A Verificado Por Favor Ingrese Al Link Enviado A Su Correo Para Activarla');
      } else if (usuarios.dato[0].estado == 'inactivo') {
        NotificationService.showSnackBarIfo(
            'Cuenta Inactiva Por Favor Comuníquese Con Administración');
      }
    }
    scrim = false;
    notifyListeners();
  }

  Future<bool> isAuthnticated() async {
    print('------------->');
    await LocalStorage.configurePrefs();
    //final token = LocalStorage.prefs.getString('rol');
    final id = LocalStorage.prefs.getString('id');
    if (id == null) {
      //final token = LocalStorage.prefs.getString('token');
      //NavigationService.replaceTo(Flurorouter.rootRoute);
      print('------------->  9999 ');
      if (id == null) {
        authStatus = AuthStatus.notAuthenticated;
      } else {
        authStatus = AuthStatus.authenticated;
      }

      notifyListeners();
      return false;
    }

    final data = {
      'case': '4',
      'id': id,
    };
    await Future.delayed(Duration(milliseconds: 1000));
    AllApi.httpPost('/FranciaApi.php', data).then((rpta) {
      final dataMap = jsonDecode(rpta);
      final Usuarios usuarios = new Usuarios.fromlist(dataMap['rpta']);
      this.user = usuarios.dato[0];
      authStatus = AuthStatus.authenticated;
      notifyListeners();
    }).catchError((onError) {
      print(onError.toString());
    });

    return true;
  }

  void _eviarEmail(String email, String name) {
    final data = {
      'nombre': name,
      'correo': email,
      'token': this._token,
    };
    AllApi.httpPost('/correo/email.php', data).then((rpta) {
      NotificationService.showSnackBarExito(
          'Se Envío un Correo Electrónico con un Enlace de Activación para Cuenta');
    }).catchError((onError) {
      // mostrar notificacion de error o tomar una decicion
      print(onError.toString());
    });
    scrim = false;
    notifyListeners();
  }

  logout() {
    LocalStorage.prefs.remove('token');
    LocalStorage.prefs.remove('rol');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

  loguin() {
    LocalStorage.prefs.setString('home', '1');
    authStatus = AuthStatus.notAuthenticated;
    NavigationService.replaceTo(Flurorouter.loginRoute);
    notifyListeners();
  }
}

//LocalStorage.prefs.getString('token');
