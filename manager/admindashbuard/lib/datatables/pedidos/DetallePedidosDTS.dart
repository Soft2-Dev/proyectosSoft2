import 'package:admin_dashbuard/models/http/carrerasModels.dart';
import 'package:admin_dashbuard/models/pedidos/DetallePedidos.dart';
import 'package:admin_dashbuard/provider/carrerasProvider.dart';
import 'package:admin_dashbuard/provider/pedidos/pedidosProvider.dart';
import 'package:admin_dashbuard/ui/modals/carrerasModals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/pedidos/Pedidos.dart';
import '../../services/navigationService.dart';

class DetallePedidosDTS extends DataTableSource {
  final List<Detalle> pedidos;
  final BuildContext context;

  DetallePedidosDTS(this.pedidos, this.context);

  @override
  DataRow getRow(int index) {
    final pedido = this.pedidos[index];
    // String estado = '';
    // switch (pedido.estadoPedido) {
    //   case '1':
    //     estado = 'En Proceso';
    //     break;
    //   case '2':
    //     estado = 'Enviado';
    //     break;
    //   case '3':
    //     estado = 'Gestionado';
    //     break;
    // }

    // String labelDialogo = (pedido.estadoPedido == '1')
    //     ? '¿Desea Inactivar esta Carrera?'
    //     : '¿Desea Activar esta Carrera?';

    // String texDialogo = (pedido.estadoPedido == '1')
    //     ? 'Inactivar la Carrera ${pedido.orden}'
    //     : 'Activar la Carrera ${pedido.orden}';

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(pedido.id!)),
      DataCell(Text(pedido.producto!)),
      DataCell(Text(pedido.cantidad!)),
      DataCell(Text(pedido.valorProducto!)),
      DataCell(Text(pedido.impuestoProducto!)),
      DataCell(Text(pedido.totalProducto!)),
      // DataCell(Row(
      //   children: [
      //     IconButton(
      //         // editar estudiantes
      //         color: Colors.blue,
      //         icon: Icon(Icons.remove_red_eye_outlined),
      //         onPressed: () {
      //           final provider =
      //               Provider.of<PedidosProvider>(context, listen: false);
      //           provider.isSelectPedido = pedido;
      //           NavigationService.navigateTo(
      //               '/dashboard/detalle-pedido/${pedido.id}');
      //         }),
      //     // IconButton(
      //     //     // inactivar estudiantes
      //     //     color: Colors.red[400],
      //     //     icon: (pedido.estadoPedido == '1')
      //     //         ? Icon(
      //     //             Icons.check_circle_outline,
      //     //             color: Colors.green,
      //     //           )
      //     //         : Icon(Icons.highlight_off), //Icon(Icons.delete_outline)
      //     //     onPressed: () {
      //     //       final dialog = AlertDialog(
      //     //         title: Text(labelDialogo),
      //     //         content: Row(
      //     //           mainAxisAlignment: MainAxisAlignment.center,
      //     //           children: [
      //     //             Icon(
      //     //               Icons.warning,
      //     //               color: Colors.red,
      //     //             ),
      //     //             SizedBox(
      //     //               width: 20,
      //     //             ),
      //     //             Text(texDialogo)
      //     //           ],
      //     //         ),
      //     //         actions: [
      //     //           TextButton(
      //     //               onPressed: () async {
      //     //                 final carreraProvider = Provider.of<CarrerasProvider>(
      //     //                     context,
      //     //                     listen: false);
      //     //                 String nestado =
      //     //                     (pedido.estadoPedido == '1') ? '0' : '1';
      //     //                 await carreraProvider.borrarCarrera(
      //     //                     pedido.id!, nestado);

      //     //                 Navigator.of(context).pop();
      //     //               },
      //     //               child: Text('Si, Inactivar')),
      //     //           TextButton(
      //     //               onPressed: () {
      //     //                 Navigator.of(context).pop();
      //     //               },
      //     //               child: Text('No')),
      //     //         ],
      //     //       );
      //     //       showDialog(context: context, builder: (_) => dialog);
      //     //     })
      //   ],
      // )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => pedidos.length;

  @override
  int get selectedRowCount => 0;
}
