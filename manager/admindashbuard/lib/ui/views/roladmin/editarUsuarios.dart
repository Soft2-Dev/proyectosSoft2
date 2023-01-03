import 'dart:html';

import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/registerFromProvider.dart';
import 'package:admin_dashbuard/ui/buttons/customOuntlined.dart';
import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/usuariosProvider.dart';

class EditUsuarios extends StatefulWidget {
  final String id;

  const EditUsuarios({Key? key, required this.id}) : super(key: key);
  @override
  _EditUsuariosState createState() => _EditUsuariosState();
}

class _EditUsuariosState extends State<EditUsuarios> {
  @override
  void initState() {
    Provider.of<UsuariosProvider>(context, listen: false)
        .buscarUsuarios(widget.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    final usuario = Provider.of<UsuariosProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => RegisterFromProvider(),
        child: Builder(builder: (context) {
          final registerFromProvider =
              Provider.of<RegisterFromProvider>(context, listen: false);
          return Container(
            color: Colors.black45,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 100),
                    padding: EdgeInsets.only(bottom: 20, top: 20),
                    width: 400,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Text(
                      'Editar Usuario',
                      style: CustomLabels.h1,
                    )),
                Container(
                  width: 400,
                  color: Colors.white,

                  padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  //color: Colors.green,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 370),
                      child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: registerFromProvider.fromkeyRegister,
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.only(left: 6),
                                  height: 48,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: Colors.indigo.withOpacity(0.5)),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.fact_check_outlined,
                                          color: Colors.grey),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                          (usuario.isBuscar)
                                              ? usuario
                                                  .usuarioBuscar[0].documento!
                                              : '',
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  )),

                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                onChanged: (value) =>
                                    registerFromProvider.name = value,
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Nombre',
                                    label: (usuario.isBuscar)
                                        ? usuario.usuarioBuscar[0].nombre!
                                        : 'Nombre',
                                    icon: Icons.supervised_user_circle_sharp),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                onFieldSubmitted: (value) {
                                  _voidFromSubmit(
                                      authprovider,
                                      registerFromProvider,
                                      context,
                                      widget.id,
                                      usuario.usuarioBuscar);
                                },
                                onChanged: (value) =>
                                    registerFromProvider.correo = value,
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Correo',
                                    label: (usuario.isBuscar)
                                        ? usuario.usuarioBuscar[0].correo!
                                        : 'Email',
                                    icon: Icons.email_outlined),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              //password

                              TextFormField(
                                onFieldSubmitted: (value) {
                                  _voidFromSubmit(
                                      authprovider,
                                      registerFromProvider,
                                      context,
                                      widget.id,
                                      usuario.usuarioBuscar);
                                },
                                onChanged: (value) =>
                                    registerFromProvider.direccion = value,
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Dirección',
                                    label: (usuario.isBuscar)
                                        ? usuario.usuarioBuscar[0].direccion!
                                        : 'Dirección',
                                    icon: Icons.location_on_outlined),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                onFieldSubmitted: (value) {
                                  _voidFromSubmit(
                                      authprovider,
                                      registerFromProvider,
                                      context,
                                      widget.id,
                                      usuario.usuarioBuscar);
                                },
                                onChanged: (value) =>
                                    registerFromProvider.ciudad = value,
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Ciudad',
                                    label: (usuario.isBuscar)
                                        ? usuario.usuarioBuscar[0].ciudad!
                                        : 'Ciudad',
                                    icon: Icons.location_on_outlined),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              //password

                              TextFormField(
                                onChanged: (value) =>
                                    registerFromProvider.telefono = value,
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: '3103535353',
                                    label: (usuario.isBuscar)
                                        ? usuario.usuarioBuscar[0].telefono!
                                        : 'Celular',
                                    icon: Icons.smartphone_outlined),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                onChanged: (value) =>
                                    registerFromProvider.porcentaje = value,
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: '10',
                                    label: (usuario.isBuscar)
                                        ? usuario.usuarioBuscar[0].porcentaje!
                                        : 'Porcentaje',
                                    icon: Icons.smartphone_outlined),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              OuntlinedButton(
                                text: 'Editar Usuario',
                                onPressed: () {
                                  _voidFromSubmit(
                                      authprovider,
                                      registerFromProvider,
                                      context,
                                      widget.id,
                                      usuario.usuarioBuscar);
                                },
                                isFilled: false,
                              ),

                              SizedBox(
                                height: 20,
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  _voidFromSubmit(
      AuthProvider authprovider,
      RegisterFromProvider registerFromProvider,
      BuildContext context,
      String rol,
      List<Usuario> usuarioBuscar) {
    authprovider.setscrim(true);
    final validFrom = registerFromProvider.validateFrom();
    if (!validFrom) return;
    String docu = (registerFromProvider.documento == '')
        ? usuarioBuscar[0].documento!
        : registerFromProvider.documento;

    String nom = (registerFromProvider.name == '')
        ? usuarioBuscar[0].nombre!
        : registerFromProvider.name;

    String tel = (registerFromProvider.telefono == '')
        ? usuarioBuscar[0].telefono!
        : registerFromProvider.telefono;

    String cor = (registerFromProvider.correo == '')
        ? usuarioBuscar[0].correo!
        : registerFromProvider.correo;

    String dire = (registerFromProvider.direccion == '')
        ? usuarioBuscar[0].direccion!
        : registerFromProvider.direccion;

    String ciudad = (registerFromProvider.ciudad == '')
        ? usuarioBuscar[0].ciudad!
        : registerFromProvider.ciudad;
    String porcentaje = (registerFromProvider.porcentaje == '')
        ? usuarioBuscar[0].porcentaje!
        : registerFromProvider.porcentaje;

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    authProvider.editarUsuarios(
        docu, nom, tel, cor, dire, ciudad, rol, context,porcentaje);
  }
}
