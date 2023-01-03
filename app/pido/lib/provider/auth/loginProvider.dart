import 'dart:convert';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/material.dart';
import 'package:pido/router/routers.dart';
import 'package:provider/provider.dart';

import '../../api/AllApi.dart';
import '../../models/modeloAuth/modeloUsuarios.dart';
import '../../serices/localStorage.dart';
import '../../serices/notificationService.dart';
import '../validaClientes/validaClientesProvider.dart';

class LoginProvider extends ChangeNotifier {
  List<Usuario> usuario = [];
  String rol = '0';
  // bool correcto = false;

  getUsuario(String documento, String password, BuildContext context) async {
    String url = '/webService.php?case=15&docu=$documento';

    print(AllApi.url + url);
    final resp = await AllApi.httpGet(url);
    print(resp);
    final dataMap = jsonDecode(resp);

    final Usuarios usuarios = Usuarios.fromlist(dataMap['rpta']);

    if (usuarios.dato[0].estado == 'NoExiste') {
      NotificationService.showSnackBarError('Usuario no Existe');
    } else {
      String bd = usuarios.dato[0].contrasena.toString();
      print(password);
      print(bd);
      var isCorrect = DBCrypt().checkpw(password, bd);

      if (isCorrect) {
        // usuario = usuarios.dato;
        // correcto = true;
        // rol = usuarios.dato[0].rol;
        final providerw =
            Provider.of<ValidaClientesProvider>(context, listen: false);
        print('wwwwwwwwwww ' + usuarios.dato[0].id);
        LocalStorage.prefs.setString('idUsuarioLogeo', usuarios.dato[0].id);
        LocalStorage.prefs.setString('rol', usuarios.dato[0].rol);
        LocalStorage.prefs.setString('nombre', usuarios.dato[0].nombre);
        LocalStorage.prefs.setString('porcen', usuarios.dato[0].porcentaje);

        final cliente = LocalStorage.prefs.getString('nombreClienteValida');
        final id = LocalStorage.prefs.getString('idClienteValida');
        if (cliente != null) {
          providerw.asignaCliente(cliente, id);
        } else {
          if (usuarios.dato[0].rol == '27') {
            print('asdasdasdas');
            providerw.asignaCliente(
                usuarios.dato[0].nombre, usuarios.dato[0].id);
          }
        }

        NotificationService.showSnackBarExito(
            'Bienvenido ' + usuarios.dato[0].nombre);
        Navigator.pushNamed(context, 'HomePage');
      } else {
        NotificationService.showSnackBarError('Contraseña Errada');
        // correcto = false;
      }
    }
    notifyListeners();
  }
  /*
      LocalStorage.prefs.setString('idUsuarioLogeo', usuarios.dato[0].id);
      LocalStorage.prefs.setString('rol', usuarios.dato[0].rol);
      LocalStorage.prefs.setString('nombre', usuarios.dato[0].nombre);
      LocalStorage.prefs.setString('cantidad', pedidos.dato[0].cantidad);
      LocalStorage.prefs.setString('idPedido', pedidos.dato[0].id);
      LocalStorage.prefs.setString('idClienteValida', e.id);
      LocalStorage.prefs
      .setString('nombreClienteValida', e.nombre);
  
  */

  logout(BuildContext context) {
    final providervalida =
        Provider.of<ValidaClientesProvider>(context, listen: false);
    providervalida.asignaCliente('', '');
    LocalStorage.prefs.remove("idUsuarioLogeo");
    LocalStorage.prefs.remove("rol");
    LocalStorage.prefs.remove("nombre");
    LocalStorage.prefs.remove("cantidad");
    LocalStorage.prefs.remove("idPedido");
    LocalStorage.prefs.remove("idClienteValida");
    LocalStorage.prefs.remove("nombreClienteValida");

    Navigator.of(context)
        .pushNamedAndRemoveUntil('LoginPages', (Route<dynamic> route) => false);
  }
}
