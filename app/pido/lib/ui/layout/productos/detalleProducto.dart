import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pido/models/productosModelo.dart';
import 'package:pido/provider/productos/productoProvider.dart';
import 'package:provider/provider.dart';

import '../../../serices/localStorage.dart';
import '../../../serices/notificationService.dart';

class DetalleProducto extends StatefulWidget {
  const DetalleProducto({Key key}) : super(key: key);

  @override
  State<DetalleProducto> createState() => _DetalleProductoState();
}

class _DetalleProductoState extends State<DetalleProducto> {
  @override
  Widget build(BuildContext context) {
    final cantidadProductos = LocalStorage.prefs.getString("cantidad");

    final producto = Provider.of<ProviderProductos>(context).productosSeleccion;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle Producto'),
        backgroundColor: Color(0xff082452),
        actions: [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 10),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'CarritoPages');
                    },
                    child: Icon(
                      Icons.shopping_cart_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                  if (cantidadProductos != null)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: BounceInDown(
                        child: Container(
                          width: 20,
                          height: 20,
                          child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Text(
                              cantidadProductos,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ))
        ],
      ),
      body: ListView(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.only(left: 20),
              child: Text(producto.producto, style: TextStyle(fontSize: 18))),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Codígo: ' + producto.plu,
                style: TextStyle(color: Colors.grey),
              )),
          Container(
            //color: Colors.red,
            height: size.height * 0.32,
            child: Image(
              image: NetworkImage(producto.url),
            ),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(1, 1), blurRadius: 1)
            ]),
          ),
          Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Valor ',
                style: TextStyle(fontSize: 15),
              )),
          Container(
              padding: EdgeInsets.only(left: 20),
              child: Text('\$' + producto.valorMayor,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.green,
                      fontWeight: FontWeight.w600))),
          Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Text(
                    'Descripción: ',
                    style: TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  )),
                  Container(
                      child: Text(producto.descripcion,
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Presentación: ' + producto.presentacion,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      Expanded(child: Container()),
                      Text('Referencia: ' + producto.referencia,
                          style: TextStyle(fontStyle: FontStyle.italic))
                    ],
                  )
                ],
              )),
          InkWell(
            onTap: () {
              final idUsuarioLogeo =
                  LocalStorage.prefs.getString("idUsuarioLogeo");
              if (idUsuarioLogeo == null) {
                Navigator.pushNamed(context, 'LoginPages');
              } else {
                final id = LocalStorage.prefs.getString('idClienteValida');
                if (id == null) {
                  NotificationService.showSnackBarError(
                      'Debes validar un Cliente');
                } else {
                  _dialogo(context, producto);
                }
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              child: Text(
                'Agregar al Carrito',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black54, blurRadius: 5, offset: Offset(1, 1))
              ], borderRadius: BorderRadius.circular(5), color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }

  _dialogo(BuildContext context, Producto productosSeleccion) {
    TextEditingController controller = TextEditingController();
    final provider = Provider.of<ProviderProductos>(context, listen: false);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Container(
            alignment: Alignment.center,
            child: Text(
              'Cantidad',
              style: TextStyle(color: Colors.grey),
            )),
        content: TextField(
          controller: controller,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.grey, fontSize: 30),
          decoration: InputDecoration(
            hintText: '1',
            hintStyle:
                TextStyle(fontSize: 23, color: Colors.grey.withOpacity(0.3)),
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      String cod = productosSeleccion.id;
                      String cantidad =
                          (controller.text != '') ? controller.text : '1';
                      String valor = productosSeleccion.valorMayor;

                      provider.getGuardarProductos(
                          cod, cantidad, valor, context);
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 60,
                    color: Colors.green,
                    child: Text(
                      'Guardar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 60,
                    color: Colors.red,
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
