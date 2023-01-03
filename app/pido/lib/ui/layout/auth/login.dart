import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../buttons/customOuntlined.dart';
import '../../../provider/auth/loginFromProvider.dart';
import '../../../provider/auth/loginProvider.dart';

class LoginPages extends StatelessWidget {
  const LoginPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formProvider = Provider.of<LoginFromProvider>(context);
    final provider = Provider.of<LoginProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              _Datos(
                size: size,
                fromProvider: formProvider,
                provider: provider,
              ),
              Positioned(
                top: size.height * 0.05,
                left: size.width * 0.3,
                child: SizedBox(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  //color:const Color(0xff238276),
                  child: const Image(
                    image: AssetImage('img/logo.png'),
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Datos extends StatelessWidget {
  const _Datos({
    Key key,
    this.size,
    this.fromProvider,
    this.provider,
  }) : super(key: key);

  final Size size;
  final LoginFromProvider fromProvider;
  final LoginProvider provider;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.28,
      left: size.width * 0.05,
      child: Container(
          alignment: Alignment.center,
          width: size.width * 0.9,
          height: size.height * 0.6,
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.grey, offset: Offset(3, 0), blurRadius: 5)
          ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    color: Color(0xff082452),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Usuario(
                size: size,
                fromProvider: fromProvider,
              ),
              const SizedBox(
                height: 25,
              ),
              Contrasena(
                size: size,
                fromProvider: fromProvider,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                margin: EdgeInsets.only(
                    left: size.width * 0.07, right: size.width * 0.07),
                child: OuntlinedButton(
                    textColor: const Color(0xff082452),
                    color: const Color(0xff082452),
                    onPressed: () {
                      provider.getUsuario(
                          fromProvider.usuario, fromProvider.password, context);
                    },
                    text: 'INGRESAR'),
              ),
              const SizedBox(
                height: 20,
              ),
              // const Text(
              //   'Recuperar Contraseña',
              //   style: TextStyle(
              //     color: Color(0xff082452),
              //     fontStyle: FontStyle.italic,
              //     fontSize: 16,
              //     decoration: TextDecoration.underline,
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }
}

class Usuario extends StatelessWidget {
  const Usuario({
    Key key,
    this.size,
    this.fromProvider,
  }) : super(key: key);

  final Size size;
  final LoginFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: const Icon(
              Icons.person_outline_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: size.width * 0.4,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value) => fromProvider.usuario = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'USUARIO',
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 3)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class Contrasena extends StatelessWidget {
  const Contrasena({
    Key key,
    this.size,
    this.fromProvider,
  }) : super(key: key);

  final Size size;
  final LoginFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: const Icon(
              Icons.password_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: size.width * 0.4,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.number,
                obscureText: true,
                onChanged: (value) => fromProvider.password = value,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'CONTRASEÑA',
                    hintStyle: TextStyle(fontSize: 20),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 3)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}
