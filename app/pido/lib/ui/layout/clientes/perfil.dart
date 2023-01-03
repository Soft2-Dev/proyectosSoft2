import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/perfil/PerfilModelo.dart';
import '../../../provider/perfil/PerfilProvider.dart';
import '../../../provider/perfil/perfilFromProvider.dart';

class PerfilPages extends StatefulWidget {
  const PerfilPages({Key key}) : super(key: key);

  @override
  State<PerfilPages> createState() => _PerfilPagesState();
}

class _PerfilPagesState extends State<PerfilPages> {
  @override
  void initState() {
    Provider.of<PerfilProvider>(context, listen: false).getPerfiles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fromProvider = Provider.of<PerfilFromProvider>(context);
    final provider = Provider.of<PerfilProvider>(context);

    return SafeArea(
        child: Scaffold(
      body: ListView(children: [
        Container(
          width: size.height * 0.10,
          height: size.height * 0.10,
          margin: EdgeInsets.only(top: size.height * 0.02),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Container(
                width: size.height * 0.2,
                height: size.height * 0.2,
                child: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 40,
                )),
          ),
        ),

        // SizedBox(height: size.height*0.02,),

        // Nombre(size: size,fromProvider: fromProvider,),

        SizedBox(
          height: size.height * 0.02,
        ),

        Departamento(
            size: size, fromProvider: fromProvider, provider: provider),
        SizedBox(
          height: size.height * 0.02,
        ),

        Ciudad(size: size, fromProvider: fromProvider, provider: provider),
        SizedBox(
          height: size.height * 0.02,
        ),

        Direccion(size: size, fromProvider: fromProvider, provider: provider),
        SizedBox(
          height: size.height * 0.02,
        ),

        Telefono(size: size, fromProvider: fromProvider, provider: provider),
        SizedBox(
          height: size.height * 0.02,
        ),

        Celular(size: size, fromProvider: fromProvider, provider: provider),
        SizedBox(
          height: size.height * 0.02,
        ),

        Correo(size: size, fromProvider: fromProvider, provider: provider),

        SizedBox(
          height: size.height * 0.04,
        ),

        InkWell(
          onTap: () {
            String id = provider.perfiles[0].id;
            String departamento = (fromProvider.departamento != null)
                ? fromProvider.departamento
                : provider.perfiles[0].departamento;
            String ciudad = (fromProvider.ciudad != null)
                ? fromProvider.ciudad
                : provider.perfiles[0].ciudad;
            String direccion = (fromProvider.direccion != null)
                ? fromProvider.direccion
                : provider.perfiles[0].direccion;
            String telefono = (fromProvider.telefono != null)
                ? fromProvider.telefono
                : provider.perfiles[0].telefono;
            String celular = (fromProvider.celular != null)
                ? fromProvider.celular
                : provider.perfiles[0].celular;
            String correo = (fromProvider.correo != null)
                ? fromProvider.correo
                : provider.perfiles[0].correo;

            provider.getEditar(
                departamento, ciudad, direccion, telefono, celular, correo, id);
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
  final PerfilFromProvider fromProvider;

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
                color: Color(0xff3c3c3c),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.badge,
              size: 30,
              color: Colors.white.withOpacity(0.5),
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
                    hintText: 'NOMBRE',
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
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class Departamento extends StatelessWidget {
  const Departamento({
    Key key,
    this.size,
    this.fromProvider,
    this.provider,
  }) : super(key: key);

  final Size size;
  final PerfilFromProvider fromProvider;
  final PerfilProvider provider;

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
                color: Color(0xff3c3c3c),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.badge,
              size: 30,
              color: Colors.white.withOpacity(0.5),
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
                    helperText: (provider.isProducto)
                        ? provider.perfiles[0].departamento
                        : '',
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
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class Ciudad extends StatelessWidget {
  const Ciudad({Key key, this.size, this.fromProvider, this.provider})
      : super(key: key);

  final Size size;
  final PerfilFromProvider fromProvider;
  final PerfilProvider provider;

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
                color: Color(0xff3c3c3c),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.location_city,
              size: 30,
              color: Colors.white.withOpacity(0.5),
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
                    helperText: (provider.isProducto)
                        ? provider.perfiles[0].ciudad
                        : '',
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
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class Direccion extends StatelessWidget {
  const Direccion({Key key, this.size, this.fromProvider, this.provider})
      : super(key: key);

  final Size size;
  final PerfilFromProvider fromProvider;
  final PerfilProvider provider;

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
                color: Color(0xff3c3c3c),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.map,
              size: 30,
              color: Colors.white.withOpacity(0.5),
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
                    helperText: (provider.isProducto)
                        ? provider.perfiles[0].direccion
                        : '',
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
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class Telefono extends StatelessWidget {
  const Telefono({Key key, this.size, this.fromProvider, this.provider})
      : super(key: key);

  final Size size;
  final PerfilFromProvider fromProvider;
  final PerfilProvider provider;

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
                color: Color(0xff3c3c3c),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.call,
              size: 30,
              color: Colors.white.withOpacity(0.5),
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
                    helperText: (provider.isProducto)
                        ? provider.perfiles[0].telefono
                        : '',
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
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class Celular extends StatelessWidget {
  const Celular({Key key, this.size, this.fromProvider, this.provider})
      : super(key: key);

  final Size size;
  final PerfilFromProvider fromProvider;
  final PerfilProvider provider;

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
                color: Color(0xff3c3c3c),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.phone_android_outlined,
              size: 30,
              color: Colors.white.withOpacity(0.5),
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
                    helperText: (provider.isProducto)
                        ? provider.perfiles[0].celular
                        : '',
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
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}

class Correo extends StatelessWidget {
  const Correo({Key key, this.size, this.fromProvider, this.provider})
      : super(key: key);

  final Size size;
  final PerfilFromProvider fromProvider;
  final PerfilProvider provider;

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
                color: Color(0xff3c3c3c),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Icon(
              Icons.email,
              size: 30,
              color: Colors.white.withOpacity(0.5),
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
                    helperText: (provider.isProducto)
                        ? provider.perfiles[0].correo
                        : '',
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
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}
