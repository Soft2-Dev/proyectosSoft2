import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/productos/productoProvider.dart';
import '../../../provider/validaClientes/validaClientesFromProvider.dart';
import '../../../provider/validaClientes/validaClientesProvider.dart';
import '../../../serices/localStorage.dart';

class ValidaCliente extends StatefulWidget {
  const ValidaCliente({Key key}) : super(key: key);

  @override
  State<ValidaCliente> createState() => _ValidaClienteState();
}

class _ValidaClienteState extends State<ValidaCliente> {
  @override
  void initState() {
    Provider.of<ValidaClientesProvider>(context, listen: false).getUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formProvider = Provider.of<ValidaClientesFromProvider>(context);
    final provider = Provider.of<ValidaClientesProvider>(context);
    final usuarios = Provider.of<ValidaClientesProvider>(context).usuario;

    List<Widget> itemMap = [];

    if (provider.isUsuario) {
      itemMap = usuarios
          .map((e) => Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      hoverColor: Color(0xff082452),
                      onTap: () {
                        setState(() {
                          LocalStorage.prefs.setString('idClienteValida', e.id);
                          LocalStorage.prefs
                              .setString('nombreClienteValida', e.nombre);
                          provider.asignaCliente(e.nombre, e.id);
                          Provider.of<ProviderProductos>(context, listen: false)
                              .getProductos();
                          Navigator.pop(context);
                          print('ssssssssssssssss');
                        });
                      },
                      title: Text(e.nombre),
                      subtitle: Text(e.ciudad + ' - ' + e.correo),
                      trailing: Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Divider()
                ],
              ))
          .toList();
    } else {
      itemMap = [
        Container(
          height: size.height * 0.5,
          child: Center(
            child: Text('Ingrese Documento de Usuario'),
          ),
        )
      ];
    }

    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.14),
        child: Column(
          children: [
            Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Color(0xff082452),
                height: size.height * 0.055,
                child: Text(
                  'Buscar Clientes',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                )),
            Container(
              //padding: EdgeInsets.all(1.5),
              padding: EdgeInsets.only(left: 15),
              margin: EdgeInsets.only(
                  left: size.width * 0.1,
                  right: size.width * 0.1,
                  top: size.height * 0.01),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: size.width * 0.4,
                      height: 60,
                      child: Form(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) => formProvider.dato = value,
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
                  ),
                  Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xff082452),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            provider.getUsuario(formProvider.dato);
                          });
                        },
                        child: Icon(
                          Icons.search_outlined,
                          size: 40,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Colors.black26, offset: Offset(1, 1), blurRadius: 3)
              ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
      body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Container(
                  height: size.height * 0.8,
                  width: size.width,
                  child: ListView(children: [...itemMap])),
              Positioned(
                  bottom: 17,
                  right: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'NuevoCliente');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      height: 40,
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add_alt,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Nuevo Cliente',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 2,
                                offset: Offset(0, 1))
                          ],
                          color: Color(0xff082452)),
                    ),
                  ))
            ],
          )),
      // floatingActionButton: Container(
      //   width: 70,
      //   height: 70,
      //   child: FloatingActionButton(
      //     backgroundColor: Color(0xff082452),
      //     onPressed: () {},
      //     child: Icon(
      //       Icons.person_add_alt_1_outlined,
      //       size: 30,
      //     ),
      //   ),
      // ),
    ));
  }
}
