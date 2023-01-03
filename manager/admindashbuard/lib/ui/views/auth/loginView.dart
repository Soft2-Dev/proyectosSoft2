import 'package:admin_dashbuard/provider/authProvider.dart';
import 'package:admin_dashbuard/provider/loginFromProvider.dart';

import 'package:admin_dashbuard/ui/buttons/customOuntlined.dart';

import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
        create: (_) => LoginFromProvider(),
        child: Builder(builder: (context) {
          final loginFromProvider =
              Provider.of<LoginFromProvider>(context, listen: false);

          return Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 100),
                padding: EdgeInsets.symmetric(horizontal: 20),
                //color: Colors.green,
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 370),
                    child: Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: loginFromProvider.fromkey,
                        child: Column(
                          children: [
                            // usuario
                            TextFormField(
                              onChanged: (value) =>
                                  loginFromProvider.email = value,
                              style: TextStyle(color: Colors.white),
                              decoration: CustomInputs.loginInputDecoration(
                                  hint: 'Ingrese su Correo',
                                  label: 'Documento',
                                  icon: Icons.person),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            //password

                            TextFormField(
                              onChanged: (value) =>
                                  loginFromProvider.password = value,
                              validator: (value) {
                                if (value == null)
                                  return 'Ingrese una Contraseña';
                                if (value.length < 6)
                                  return 'La contraseña debe tener mas de 6 caracteres';

                                return null; //---> valido
                              },
                              obscureText: true,
                              style: TextStyle(color: Colors.white),
                              decoration: CustomInputs.loginInputDecoration(
                                  hint: '******',
                                  label: 'Contraseña',
                                  icon: Icons.lock_outline_rounded),
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            OuntlinedButton(
                              text: 'Ingresar',
                              onPressed: () {
                                voidFromSubmit(authprovider, loginFromProvider);
                              },
                              isFilled: false,
                            ),

                            SizedBox(
                              height: 20,
                            ),

                            // LinkText(
                            //   text: 'Nueva Cuenta',
                            //   onPressed: () {
                            //     //print('ir a registro');
                            //     authprovider.settitle('Nueva Cuenta');
                            //     Navigator.pushReplacementNamed(
                            //         context, Flurorouter.registerRoute);
                            //   },
                            // )
                          ],
                        )),
                  ),
                ),
              ),
              if (authprovider.scrim)
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black26,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          );
        }));
  }

  void voidFromSubmit(
      AuthProvider authprovider, LoginFromProvider loginFromProvider) {
    final isvalid = loginFromProvider.validateFrom();
    if (isvalid) {
      authprovider.setscrim(true);
      authprovider.login(loginFromProvider.email, loginFromProvider.password);
    }
  }
}
