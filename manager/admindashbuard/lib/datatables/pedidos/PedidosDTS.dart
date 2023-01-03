import 'package:admin_dashbuard/models/http/carrerasModels.dart';
import 'package:admin_dashbuard/provider/carrerasProvider.dart';
import 'package:admin_dashbuard/provider/pedidos/pedidosProvider.dart';
import 'package:admin_dashbuard/ui/modals/carrerasModals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/pedidos/Pedidos.dart';
import '../../services/navigationService.dart';

class PedidosDTS extends DataTableSource {
  final List<Pedido> pedidos;
  final BuildContext context;

  PedidosDTS(this.pedidos, this.context);

  @override
  DataRow getRow(int index) {
    final pedido = this.pedidos[index];

    // String labelDialogo = (pedido.estadoPedido == '1')
    //     ? '¿Desea Inactivar esta Carrera?'
    //     : '¿Desea Activar esta Carrera?';

    // String texDialogo = (pedido.estadoPedido == '1')
    //     ? 'Inactivar la Carrera ${pedido.orden}'
    //     : 'Activar la Carrera ${pedido.orden}';

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(pedido.id!)),
      DataCell(Text(pedido.orden!)),
      DataCell(Text(pedido.fecha!)),
      DataCell(Text(pedido.nombre!)),
      DataCell(Text(pedido.totalPedido!)),
      DataCell(Text(
        pedido.estado!,
        style: TextStyle(color: Color(pedido.confi!)),
      )),
      DataCell(Row(
        children: [
          IconButton(
              // editar estudiantes
              color: Colors.blue,
              icon: Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                final provider =
                    Provider.of<PedidosProvider>(context, listen: false);
                provider.selectEstado = pedido.estado!;
                provider.colorEstado = pedido.confi!;
                provider.isSelectPedido = pedido;
                NavigationService.navigateTo(
                    '/dashboard/detalle-pedido/${pedido.id}');
              }),
          // IconButton(
          //     // inactivar estudiantes
          //     color: Colors.red[400],
          //     icon: (pedido.estadoPedido == '1')
          //         ? Icon(
          //             Icons.check_circle_outline,
          //             color: Colors.green,
          //           )
          //         : Icon(Icons.highlight_off), //Icon(Icons.delete_outline)
          //     onPressed: () {
          //       final dialog = AlertDialog(
          //         title: Text(labelDialogo),
          //         content: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(
          //               Icons.warning,
          //               color: Colors.red,
          //             ),
          //             SizedBox(
          //               width: 20,
          //             ),
          //             Text(texDialogo)
          //           ],
          //         ),
          //         actions: [
          //           TextButton(
          //               onPressed: () async {
          //                 final carreraProvider = Provider.of<CarrerasProvider>(
          //                     context,
          //                     listen: false);
          //                 String nestado =
          //                     (pedido.estadoPedido == '1') ? '0' : '1';
          //                 await carreraProvider.borrarCarrera(
          //                     pedido.id!, nestado);

          //                 Navigator.of(context).pop();
          //               },
          //               child: Text('Si, Inactivar')),
          //           TextButton(
          //               onPressed: () {
          //                 Navigator.of(context).pop();
          //               },
          //               child: Text('No')),
          //         ],
          //       );
          //       showDialog(context: context, builder: (_) => dialog);
          //     })
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => pedidos.length;

  @override
  int get selectedRowCount => 0;
}
