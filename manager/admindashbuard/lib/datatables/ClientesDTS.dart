import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/clientes/Clientes.dart';
import 'package:flutter/material.dart';
import '../provider/clientes/clientesProvider.dart';

class ClientesDTS extends DataTableSource {
  final List<Cliente> clientes;
  final BuildContext context;
  final ClientesProvider usuarios;

  ClientesDTS(this.clientes, this.context, this.usuarios);

  final url = AllApi.url;

  @override
  DataRow getRow(int index) {
    final student = this.clientes[index];
    final image = Image(
      image: AssetImage('img/no-image.jpg'),
      width: 35,
      height: 35,
    );

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(
        child: image,
      )),
      DataCell(Text(student.documento!)),
      DataCell(Text(student.nombre!)),
      DataCell(Text(student.direccion!)),
      DataCell(Text(student.telefono!)),
      //DataCell(Text(student.celular!)),
      DataCell(Text(student.ciudad!)),
      //DataCell(Text(student.departamento!)),
      DataCell(Text(student.correo!)),
      DataCell(Text(
        (student.estado == '33') ? 'Activo' : 'Inactivo',
      )),
      DataCell(Row(
        children: [
          // IconButton(
          //     // editar estudiantes
          //     color: Colors.blue,
          //     icon: Icon(Icons.edit_outlined),
          //     onPressed: () {
          //       NavigationService.navigateTo(
          //           '/dashboard/editar-usuarios/${student.id}');
          //     }),
          IconButton(
              // inactivar estudiantes
              color: (student.estado == '33') ? Colors.red[400] : Colors.green,
              icon: Icon((student.estado == '33')
                  ? Icons.delete_outline
                  : Icons.check_circle_outline),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text((student.estado == '33')
                      ? '¿Desea Inactivar este Cliente?'
                      : '¿Desea Activar este Cliente?'),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: (student.estado == '33')
                            ? Colors.red
                            : Colors.green,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text((student.estado == '33')
                          ? 'Inactivar ${student.nombre}'
                          : 'Activar ${student.nombre}')
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          if (student.estado == '33') {
                            usuarios.inactivarUsuarios(student.id!, '34');
                          } else {
                            usuarios.inactivarUsuarios(student.id!, '33');
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text((student.estado == '33')
                            ? 'Si, Inactivar'
                            : 'Si, Activar')),
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
  int get rowCount => clientes.length;

  @override
  int get selectedRowCount => 0;
}
