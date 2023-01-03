import 'package:admin_dashbuard/models/http/carrerasModels.dart';
import 'package:admin_dashbuard/provider/carrerasProvider.dart';
import 'package:admin_dashbuard/ui/modals/carrerasModals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrerasDTS extends DataTableSource {
  final List<Carrera> carreras;
  final BuildContext context;

  CarrerasDTS(this.carreras, this.context);

  @override
  DataRow getRow(int index) {
    final carrera = this.carreras[index];
    String estado = (carrera.estado == '1') ? 'Activo' : 'Incativo';

    String labelDialogo = (carrera.estado == '1')
        ? '¿Desea Inactivar esta Carrera?'
        : '¿Desea Activar esta Carrera?';

    String texDialogo = (carrera.estado == '1')
        ? 'Inactivar la Carrera ${carrera.carrera}'
        : 'Activar la Carrera ${carrera.carrera}';

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(carrera.id!)),
      DataCell(Text(carrera.carrera!)),
      DataCell(Container(width: 500, child: Text(carrera.descripcion!))),
      DataCell(Text(estado)),
      DataCell(Row(
        children: [
          IconButton(
              // editar estudiantes
              color: Colors.blue,
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (_) => CarreraModals(
                          carrera: carrera,
                        ));
                print(carrera.carrera);
              }),
          IconButton(
              // inactivar estudiantes
              color: Colors.red[400],
              icon: (carrera.estado == '1')
                  ? Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    )
                  : Icon(Icons.highlight_off), //Icon(Icons.delete_outline)
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text(labelDialogo),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(texDialogo)
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () async {
                          final carreraProvider = Provider.of<CarrerasProvider>(
                              context,
                              listen: false);
                          String nestado = (carrera.estado == '1') ? '0' : '1';
                          await carreraProvider.borrarCarrera(
                              carrera.id!, nestado);

                          Navigator.of(context).pop();
                        },
                        child: Text('Si, Inactivar')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No')),
                  ],
                );
                showDialog(context: context, builder: (_) => dialog);
              })
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => carreras.length;

  @override
  int get selectedRowCount => 0;
}
