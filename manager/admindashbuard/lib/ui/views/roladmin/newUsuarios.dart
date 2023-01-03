import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/registerFromProvider.dart';
import 'package:admin_dashbuard/ui/buttons/customOuntlined.dart';
import 'package:admin_dashbuard/ui/buttons/customOuntlinedIcon.dart';
import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../services/navigationService.dart';

class NewUsuarios extends StatefulWidget {
  final String rol;

  const NewUsuarios({Key? key, required this.rol}) : super(key: key);
  @override
  _NewUsuariosState createState() => _NewUsuariosState();
}

class _NewUsuariosState extends State<NewUsuarios> {
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);
    final size = MediaQuery.of(context).size;
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
                    child: (widget.rol != '2')
                        ? Text(
                            'Nuevo Usuario',
                            style: CustomLabels.h1,
                          )
                        : Text(
                            'Nuevo Estudiante',
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
                              // usuario

                              TextFormField(
                                onChanged: (value) =>
                                    registerFromProvider.documento = value,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Este campo es obligatorio';
                                  return null; //---> valido
                                },
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Documento',
                                    label: 'Documento',
                                    icon: Icons.fact_check_outlined),
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                onChanged: (value) =>
                                    registerFromProvider.name = value,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return 'Este campo es obligatorio';
                                  return null; //---> valido
                                },
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Nombre',
                                    label: 'Nombre',
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
                                      widget.rol);
                                },
                                onChanged: (value) =>
                                    registerFromProvider.correo = value,
                                validator: (value) {
                                  if (!EmailValidator.validate(value ?? ''))
                                    return 'Email no Valido ';
                                },
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Correo',
                                    label: 'Email',
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
                                      widget.rol);
                                },
                                onChanged: (value) =>
                                    registerFromProvider.direccion = value,
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Dirección',
                                    label: 'Dirección',
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
                                      widget.rol);
                                },
                                onChanged: (value) =>
                                    registerFromProvider.ciudad = value,
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: 'Ingrese Ciudad',
                                    label: 'Ciudad',
                                    icon: Icons.location_on_outlined),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              //password

                              TextFormField(
                                onChanged: (value) =>
                                    registerFromProvider.telefono = value,
                                validator: (value) {
                                  if (value == null)
                                    return 'Ingrese un Nuemro de Celular';
                                  if (value.length < 7)
                                    return 'Ingrese un Numero de Celular valido';
                                  return null; //---> valido
                                },
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: '3103535353',
                                    label: 'Celular',
                                    icon: Icons.smartphone_outlined),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              //password

                              TextFormField(
                                onChanged: (value) =>
                                    registerFromProvider.porcentaje = value,
                                validator: (value) {
                                  if (value == null)
                                    return 'Ingrese porcentaje';
                                  if (value.length < 7)
                                    return 'Ingrese un porcentaje valido';
                                  return null; //---> valido
                                },
                                style: TextStyle(color: Colors.grey),
                                decoration: CustomInputs.formInputDecoration(
                                    hint: '10',
                                    label: 'Porcentaje',
                                    icon: Icons.percent_outlined),
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              OuntlinedButton(
                                text: 'Crear Cuenta',
                                onPressed: () {
                                  _voidFromSubmit(
                                      authprovider,
                                      registerFromProvider,
                                      context,
                                      widget.rol);
                                },
                                isFilled: false,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              OuntlinedButtonIcon(
                                text: 'Carga Masiva',
                                color: Colors.green,
                                textColor: Colors.green,
                                onPressed: () {
                                  NavigationService.navigateTo(
                                      '/dashboard/cargarusuarios');
                                },
                                padingHorizontal: size.width * 0.04,
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
      String rol) {
    authprovider.setscrim(true);
    final validFrom = registerFromProvider.validateFrom();
    if (!validFrom) return;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    authProvider.registroUsuarios(
      registerFromProvider.documento,
      registerFromProvider.name,
      registerFromProvider.telefono,
      registerFromProvider.correo,
      registerFromProvider.direccion,
      registerFromProvider.ciudad,
      rol,
      context,
      registerFromProvider.porcentaje,
    );
  }
}
