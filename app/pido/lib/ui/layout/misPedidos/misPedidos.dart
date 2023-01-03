import 'package:flutter/material.dart';
import 'package:pido/models/pedidos/misPedidosModelo.dart';
import 'package:pido/provider/misPedidos/misPedidosProvider.dart';
import 'package:provider/provider.dart';

import '../../../buttons/customOuntlined.dart';
import '../../../provider/productos/productoProvider.dart';
import '../../../provider/validaClientes/validaClientesProvider.dart';
import '../../../serices/localStorage.dart';

class MisPedidos extends StatefulWidget {
  const MisPedidos({Key key}) : super(key: key);

  @override
  State<MisPedidos> createState() => _MisPedidosState();
}

class _MisPedidosState extends State<MisPedidos> {
  @override
  void initState() {
    Provider.of<MisPedidosProvider>(context, listen: false).getMisPedidos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final misPedidos = Provider.of<MisPedidosProvider>(context).miPedidos;
    final provider = Provider.of<MisPedidosProvider>(context);
    final size = MediaQuery.of(context).size;

    List<Widget> itemMap = [];
    if (provider.isMiPedidos) {
      itemMap = misPedidos
          .map((e) => InkWell(
                onTap: () {
                  _modalAbrirSala(e);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 3, color: Color(int.parse('0xff' + e.confi)))),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          ListTile(
                            title: Row(
                              children: [
                                Text(
                                  e.nombre,
                                ),
                                Expanded(
                                  child: Container(
                                    width: size.width * 0.1,
                                  ),
                                ),
                                Text(
                                  e.orden,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                )
                              ],
                            ),
                            subtitle: Column(children: [
                              Row(
                                children: [
                                  Text(
                                    'Total: ',
                                  ),
                                  Text(
                                    ' \$' + e.totalPedido,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.green),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: size.width * 0.1,
                                    ),
                                  ),
                                  Text(
                                    e.estado,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color(int.parse('0xff' + e.confi))),
                                  )
                                ],
                              ),
                            ]),
                          ),
                          Divider()
                        ],
                      ),
                    ],
                  ),
                ),
              ))
          .toList();
    } else {
      itemMap = misPedidos
          .map((e) => Container(
                child: Text('No Tienes Pedidos Pendientes'),
              ))
          .toList();
    }

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Mis Pedidos'),
        centerTitle: true,
        backgroundColor: Color(0xff082452),
      ),
      body: ListView(children: [...itemMap]),
    ));
  }

  _modalAbrirSala(MiPedido e) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(30))),
              padding: const EdgeInsets.only(top: 10),
              height: size.height * 0.15,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Desea retomar este Pedido?',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(
                            left: size.width * 0.01, right: size.width * 0.02),
                        child: OuntlinedButton(
                            textColor: const Color(0xff006414),
                            color: const Color(0xff006414),
                            onPressed: () {
                              // LocalStorage.prefs
                              //     .setString('idClienteValida', idCliente);

                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //     'HomePage', (Route<dynamic> route) => false);
                              final provider =
                                  Provider.of<ValidaClientesProvider>(context,
                                      listen: false);
//idPedido
                              LocalStorage.prefs
                                  .setString('idClienteValida', e.idCliente);
                              LocalStorage.prefs
                                  .setString('nombreClienteValida', e.nombre);
                              LocalStorage.prefs.setString('idPedido', e.id);
                              LocalStorage.prefs.setString('id', e.nombre);
                              provider.asignaCliente(e.nombre, e.id);
                              Provider.of<ProviderProductos>(context,
                                      listen: false)
                                  .getProductos();
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  'HomePage', (Route<dynamic> route) => false);
                              print('ssssssssssssssss');
                            },
                            text: 'Si'),
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.only(
                            left: size.width * 0.02, right: size.width * 0.01),
                        child: OuntlinedButton(
                            textColor: const Color(0xffbd0003),
                            color: const Color(0xffbd0003),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: 'No'),
                      ),
                    ],
                  )
                ],
              ));
        });
  }
}
