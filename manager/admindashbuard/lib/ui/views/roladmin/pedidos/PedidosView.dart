import 'package:admin_dashbuard/datatables/carrerasDTS.dart';
import 'package:admin_dashbuard/provider/carrerasProvider.dart';
import 'package:admin_dashbuard/ui/buttons/customIconButton.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:admin_dashbuard/ui/modals/carrerasModals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../datatables/pedidos/PedidosDTS.dart';
import '../../../../provider/pedidos/pedidosProvider.dart';

class PedidosView extends StatefulWidget {
  @override
  _PedidosViewState createState() => _PedidosViewState();
}

class _PedidosViewState extends State<PedidosView> {
  @override
  void initState() {
    super.initState();
    Provider.of<PedidosProvider>(context, listen: false).getPedidos();
  }

  @override
  Widget build(BuildContext context) {
    final pedidos = Provider.of<PedidosProvider>(context).pedidos;
    int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Pedidos',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            header: Text(
              // titulo de la tabla
              'Lista de Pedidos',
              maxLines: 2,
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
              DataColumn(label: Text('No.Orden')),
              DataColumn(label: Text('fecha')),
              DataColumn(label: Text('nombre')),
              DataColumn(label: Text('totalPedido')),
              DataColumn(label: Text('Estado')),

              DataColumn(label: Text('Acciones')),
            ],

            source: PedidosDTS(pedidos, context), //datos cargados de BD

            onRowsPerPageChanged: (value) {
              // lista de opcion para carga de productos
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage:
                _rowsPerPage, //limitando la cantidad de registro por pagina
          )
        ],
      ),
    );
  }
}
