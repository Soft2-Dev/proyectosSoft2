import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/productos/productoProvider.dart';

class CarritoPages extends StatefulWidget {
  const CarritoPages({Key key}) : super(key: key);

  @override
  State<CarritoPages> createState() => _CarritoPagesState();
}

class _CarritoPagesState extends State<CarritoPages> {
  @override
  void initState() {
    Provider.of<ProviderProductos>(context, listen: false).getDetallePedido();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final detalle = Provider.of<ProviderProductos>(context).detalle;
    final provider = Provider.of<ProviderProductos>(context);
    final size = MediaQuery.of(context).size;
    List<Widget> itemMap = [];
    if (provider.isCarrito) {
      itemMap = detalle
          .map((e) => Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                width: size.width * 0.85,
                height: size.height * 0.2,
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 2)
                    ]),
                child: Row(
                  children: [
                    Container(
                      height: size.height * 0.17,
                      width: size.width * 0.40,
                      //child: Image(image: NetworkImage(e.url)),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(e.url), fit: BoxFit.cover),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 1),
                                blurRadius: 2)
                          ]),
                    ),
                    Container(
                      height: size.height * 0.17,
                      width: size.width * 0.40,
                      margin: EdgeInsets.only(left: 15),
                      //child: Image(image: NetworkImage(e.url)),
                      child: Column(
                        children: [
                          Text(e.producto),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              width: size.width * 0.45,
                              child: Row(
                                children: [
                                  Text(
                                    'Código: ',
                                    style: TextStyle(
                                        color: Colors.green[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                  Text(e.plu,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                ],
                              )),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              width: size.width * 0.45,
                              child: Row(
                                children: [
                                  Text(
                                    'Precio Final: ',
                                    style: TextStyle(
                                        color: Colors.red[900], fontSize: 17),
                                  ),
                                  Text('\$' + e.totalProducto,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                ],
                              )),
                          SizedBox(
                            height: size.height * 0.019,
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              width: size.width * 0.45,
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        final totalfinal =
                                            (int.parse(e.cantidad) + 1) *
                                                int.parse(e.valorMayor);
                                        provider.masDetalle(
                                            totalfinal, e.idDetalle);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5)),
                                            color: Colors.green[900],
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(1, 1),
                                                  blurRadius: 5)
                                            ]),
                                        width: size.width * 0.085,
                                        height: 33,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        e.cantidad,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(1, 1),
                                                blurRadius: 5)
                                          ]),
                                      width: size.width * 0.09,
                                      height: 33,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        final totalfinal =
                                            (int.parse(e.cantidad) - 1) *
                                                int.parse(e.valorMayor);
                                        provider.menosDetalle(
                                            totalfinal, e.idDetalle);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5)),
                                            color: Colors.red[900],
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(1, 1),
                                                  blurRadius: 5)
                                            ]),
                                        width: size.width * 0.085,
                                        height: 33,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ))
          .toList();
    } else {
      itemMap = detalle
          .map((e) => Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(left: 15, right: 15),
                width: size.width * 0.85,
                height: size.height * 0.2,
                margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1, 1),
                          blurRadius: 2)
                    ]),
                child: Text('Carrito Sin Productos'),
              ))
          .toList();
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Carrito'),
        backgroundColor: Color(0xff082452),
      ),
      body: Container(
        height: size.height * 1,
        width: size.width * 1,
        //color: Colors.red,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.8,
              width: size.width,
              child: ListView(
                children: [...itemMap],
              ),
            ),
            if (provider.gTotal != null)
              Positioned(
                  bottom: 0,
                  child: InkWell(
                    onTap: () {
                      _dialogo(context);
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: size.width * 0.05, right: size.width * 0.05),
                      height: size.height * 0.08,
                      width: size.width,
                      color: Colors.green[900],
                      child: Row(
                        children: [
                          Text(
                            'Enviar Pedido',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Expanded(child: Container()),
                          Text(
                            '\$ ' + provider.gTotal.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ))
          ],
        ),
      ),
    ));
  }

  _dialogo(BuildContext context) {
    final provider = Provider.of<ProviderProductos>(context, listen: false);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Container(
            alignment: Alignment.center,
            child: Text(
              '¿Desea Enviar el Pedido?',
              style: TextStyle(),
            )),
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
                    provider.finPedido(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 120,
                    height: 60,
                    color: Colors.green,
                    child: Text(
                      'Enviar',
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
