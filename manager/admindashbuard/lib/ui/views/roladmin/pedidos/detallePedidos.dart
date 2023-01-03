import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../datatables/pedidos/DetallePedidosDTS.dart';
import '../../../../provider/pedidos/pedidosProvider.dart';
import '../../../labels/customLabels.dart';

class DetallePedidos extends StatefulWidget {
  final id;
  const DetallePedidos({Key? key, required this.id}) : super(key: key);

  @override
  State<DetallePedidos> createState() => _DetallePedidosState();
}

class _DetallePedidosState extends State<DetallePedidos> {
  @override
  void initState() {
    Provider.of<PedidosProvider>(context, listen: false).getDetalle(widget.id);
    Provider.of<PedidosProvider>(context, listen: false).getEstados();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSelectPedido = Provider.of<PedidosProvider>(context).isSelectPedido;
    final provider = Provider.of<PedidosProvider>(context);

    final estados = Provider.of<PedidosProvider>(context).estado;
    final detalle = Provider.of<PedidosProvider>(context).detalles;
    int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

    final List<Widget> itemMap = estados
        .map((e) => InkWell(
            onTap: () {
              setState(() {
                Navigator.pop(context);
                provider.selectEstado = e.parametro!;
                provider.colorEstado = e.confi!;
                provider.editEstados(e.id!, isSelectPedido.id!);
              });
            },
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 3, bottom: 3, right: 20),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                children: [
                  Text(
                    e.parametro!,
                    style: TextStyle(color: Color(e.confi!)),
                  ),
                  Expanded(child: Container()),
                  CircleAvatar(
                    backgroundColor: Color(e.confi!),
                  )
                ],
              ),
            )))
        .toList();

    return Container(
      color: Colors.black45,
      height: size.height,
      padding: EdgeInsets.only(
        top: size.height * 0.01,
        bottom: size.height * 0.01,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1.5, color: Color(provider.colorEstado)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.only(bottom: 10, top: 10),
                width: size.width * 0.5,
                alignment: Alignment.center,
                child: Text(
                  'Detalle de Pedido',
                  style: CustomLabels.h1,
                )),
            Container(
              margin: EdgeInsets.symmetric(vertical: 7),
              width: size.width * 0.5,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1.5, color: Color(provider.colorEstado)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              //color: Colors.green,
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.5,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        alignment: Alignment.centerLeft,
                        width: double.infinity,
                        // color: Colors.amber,
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(isSelectPedido.nombre!,
                                      style: TextStyle(
                                          // color: Colors.grey,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 17)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Total Pedido'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(isSelectPedido.totalPedido!,
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2),
                        width: double.infinity,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.content_paste,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(isSelectPedido.orden!,
                                    style: TextStyle(
                                        // color: Colors.grey,
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  isSelectPedido.fecha!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        // padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 2),
                        width: size.width * 0.1,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (() {
                                _buildAlertDialog(itemMap);
                              }),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1,
                                        color: Color(provider.colorEstado)),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(provider.selectEstado,
                                          style: TextStyle(
                                              color:
                                                  Color(provider.colorEstado))),
                                      Expanded(child: Container()),
                                      Icon(
                                          Icons.arrow_drop_down_circle_outlined,
                                          color: Color(provider.colorEstado)),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      //listado de productos
                    ],
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(width: 1.5, color: Color(provider.colorEstado)),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              width: size.width * 0.5,
              child: PaginatedDataTable(
                header: Text(
                  // titulo de la tabla
                  'Detalle de Pedido',
                ),

                actions: [
                  // botones de accion
                  // CustomIconButton(
                  //   text: 'Agregar Nueva Carrera',
                  //   icon: Icons.person_add_alt_1_outlined,
                  //   color: Colors.green,
                  //   onPressd: () {
                  //     showModalBottomSheet(
                  //         backgroundColor: Colors.transparent,
                  //         context: context,
                  //         builder: (_) => CarreraModals(
                  //               carrera: null,
                  //             ));
                  //   },
                  // )
                ],

                columns: [
                  // nombres de las columnas
                  DataColumn(label: Text('Id')),
                  DataColumn(label: Text('producto')),
                  DataColumn(label: Text('cantidad')),
                  DataColumn(label: Text('valor Unidad')),
                  DataColumn(label: Text('impuesto')),
                  DataColumn(label: Text('Total')),
                  // DataColumn(label: Text('Acciones')),
                ],

                source:
                    DetallePedidosDTS(detalle, context), //datos cargados de BD

                onRowsPerPageChanged: (value) {
                  // lista de opcion para carga de productos
                  setState(() {
                    _rowsPerPage = value ?? 10;
                  });
                },
                rowsPerPage:
                    _rowsPerPage, //limitando la cantidad de registro por pagina
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildAlertDialog(List<Widget> itemMap) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Notificaciones'),
        content: Container(
          height: 450,
          width: 200,
          child: ListView(children: [...itemMap]),
        ),
      ),
    );
  }
}
