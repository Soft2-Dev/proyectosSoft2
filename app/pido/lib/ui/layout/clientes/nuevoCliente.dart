import 'package:flutter/material.dart';
import 'package:pido/provider/validaClientes/validaClientesProvider.dart';
import 'package:pido/ui/layout/validaClientes/validaCliente.dart';
import 'package:provider/provider.dart';

import '../../../provider/usuarios/usuariosFromProvider.dart';
import '../../../provider/usuarios/usuariosProvider.dart';

class NuevoCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final fromProvider = Provider.of<UsuariosFromProvider>(context);
    final provider = Provider.of<ValidaClientesProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff082452),
        title: Text('Nuevo Cliente'),
        centerTitle: true,
      ),
      body: ListView(children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        Nombre(size: size, fromProvider: fromProvider),
        SizedBox(
          height: size.height * 0.02,
        ),
        Documento(size: size, fromProvider: fromProvider),
        SizedBox(
          height: size.height * 0.02,
        ),
        // Departamento(size: size, fromProvider: fromProvider),
        // SizedBox(
        //   height: size.height * 0.02,
        // ),
        Ciudad(size: size, fromProvider: fromProvider),
        SizedBox(
          height: size.height * 0.02,
        ),
        Direccion(size: size, fromProvider: fromProvider),
        SizedBox(
          height: size.height * 0.02,
        ),
        // Telefono(size: size, fromProvider: fromProvider),
        // SizedBox(
        //   height: size.height * 0.02,
        // ),
        Celular(size: size, fromProvider: fromProvider),
        SizedBox(
          height: size.height * 0.02,
        ),
        Correo(size: size, fromProvider: fromProvider),
        SizedBox(
          height: size.height * 0.04,
        ),
        InkWell(
          onTap: () {
            provider.setUsuarios(
                fromProvider.nombre,
                fromProvider.documento,
                fromProvider.ciudad,
                fromProvider.direccion,
                fromProvider.celular,
                fromProvider.correo,
                context
                );
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
            width: size.width * 0.25,
            height: size.height * 0.06,
            child: Text(
              'Guardar',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            decoration: BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.circular(10)),
          ),
        )
      ]),
    ));
  }
}

class Nombre extends StatelessWidget {
  const Nombre({
    Key key,
    this.size,
    this.fromProvider,
  }) : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.person_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.nombre = value,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Nombre',
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
    );
  }
}

class Documento extends StatelessWidget {
  const Documento({
    Key key,
    this.size,
    this.fromProvider,
  }) : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.assignment_ind,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.documento = value,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Documento',
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
    );
  }
}

class Departamento extends StatelessWidget {
  const Departamento({
    Key key,
    this.size,
    this.fromProvider,
  }) : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.badge,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.departamento = value,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    helperStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Departamento',
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
    );
  }
}

class Ciudad extends StatelessWidget {
  const Ciudad({Key key, this.size, this.fromProvider}) : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.location_city,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.ciudad = value,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    helperStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Ciudad',
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
    );
  }
}

class Direccion extends StatelessWidget {
  const Direccion({Key key, this.size, this.fromProvider}) : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.map,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.direccion = value,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    helperStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Dirección',
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
    );
  }
}

class Telefono extends StatelessWidget {
  const Telefono({Key key, this.size, this.fromProvider}) : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.call,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.telefono = value,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Telefono',
                    helperStyle: TextStyle(fontSize: 13),
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
    );
  }
}

class Celular extends StatelessWidget {
  const Celular({Key key, this.size, this.fromProvider}) : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.phone_android_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.celular = value,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    helperStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Celular',
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
    );
  }
}

class Correo extends StatelessWidget {
  const Correo({Key key, this.size, this.fromProvider}) : super(key: key);

  final Size size;
  final UsuariosFromProvider fromProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1.5),
      margin: EdgeInsets.only(
        left: size.width * 0.08,
        right: size.width * 0.08,
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Color(0xff082452),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.email,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            width: size.width * 0.65,
            height: 60,
            child: Form(
              child: TextFormField(
                keyboardType: TextInputType.text,
                onChanged: (value) => fromProvider.correo = value,
                style: TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                    helperStyle: TextStyle(fontSize: 13),
                    contentPadding: EdgeInsets.only(top: 10),
                    hintText: 'Correo',
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
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 1))
          ]),
    );
  }
}
