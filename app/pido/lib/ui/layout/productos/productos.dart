import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:pido/provider/productos/productoProvider.dart';
import 'package:pido/provider/validaClientes/validaClientesProvider.dart';
import 'package:provider/provider.dart';

import '../../../serices/localStorage.dart';
import '../../../serices/notificationService.dart';

class ProductosPages extends StatefulWidget {
  const ProductosPages({Key key}) : super(key: key);

  @override
  _ProductosPagesState createState() => _ProductosPagesState();
}

class _ProductosPagesState extends State<ProductosPages> {
  @override
  void initState() {
    super.initState();
    // final id = Provider.of<ProviderCategorias>(context, listen: false);
    Provider.of<ProviderProductos>(context, listen: false).getProductos();
    // final providerw = Provider.of<ValidaClientesProvider>(context);
    // final cliente = LocalStorage.prefs.getString('nombreClienteValida');
    // final id = LocalStorage.prefs.getString('idClienteValida');
    // providerw.asignaCliente(cliente, id);
  }

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProviderProductos>(context).productos;
    final provider = Provider.of<ProviderProductos>(context, listen: false);
    final providervalida =
        Provider.of<ValidaClientesProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final cantidadProductos = LocalStorage.prefs.getString("cantidad");
    final rol = LocalStorage.prefs.getString('rol');
    final cliente = LocalStorage.prefs.getString('nombreClienteValida');
    final porcen = LocalStorage.prefs.getString('porcen');

    List<Widget> itemMap = productos
        .map((e) => Container(
              margin: EdgeInsets.only(top: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(1, 1), blurRadius: 2)
                  ]),
              child: ListTile(
                onTap: () {
                  provider.productosSeleccion = e;
                  Navigator.pushNamed(context, 'DetalleProducto');
                },
                title: Text(e.producto),
                subtitle: Row(
                  children: [
                    Row(
                      children: [
                        Text('Plu: '),
                        Text(
                          e.plu,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Prest: '),
                        Text(
                          e.presentacion,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Cant: '),
                        Text(
                          e.cantidad,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
                leading: Image(
                  image: NetworkImage(e.url),
                ),
                trailing: Column(
                  children: [
                    Text(
                      'Valor',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      ((int.parse(e.valorMayor) * int.parse(porcen) / 100) +
                              int.parse(e.valorMayor))
                          .toStringAsFixed(0),
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ))
        .toList();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.1),
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5, left: 25),
            width: size.width,
            height: size.height * 0.06,
            decoration: BoxDecoration(color: Color(0xff082452), boxShadow: [
              BoxShadow(color: Colors.black45, offset: Offset(0, 1))
            ]),
            child: Row(
              children: [
                (providervalida.idCliente == null ||
                        providervalida.idCliente == '')
                    ? Text(
                        'Catalogo de Productos',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )
                    : Text(
                        providervalida.nombre,
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                Expanded(
                  child: Container(),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'CarritoPages');
                  },
                  child: Container(
                    //width: size.width * 0.15,
                    margin: EdgeInsets.only(right: 15),
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 35,
                          color: Colors.white,
                        ),
                        if (cantidadProductos != null)
                          Positioned(
                            right: 0,
                            child: BounceInDown(
                              child: Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: Text(
                                      cantidadProductos,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 3),
          height: size.height * 0.97,
          child: ListView(
            children: [...itemMap],
          ),
        ),
        floatingActionButton: (rol == '26')
            ? Container(
                width: 70,
                height: 70,
                child: FloatingActionButton(
                  onPressed: () {
                    if (cliente != null) {
                      setState(() {
                        provider.pausaPedido(context);
                      });
                    } else {
                      Navigator.pushNamed(context, 'ValidaCliente');
                    }
                  },
                  child: Icon(
                    (cliente != null) ? Icons.pause : Icons.group_add_outlined,
                    size: 30,
                  ),
                  backgroundColor:
                      (cliente != null) ? Colors.orange : Color(0xff082452),
                ),
              )
            : null,
      ),
    );
  }
}
