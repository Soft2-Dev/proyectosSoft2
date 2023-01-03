import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:admin_dashbuard/provider/usuariosProvider.dart';

import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/authProvider.dart';

class UsuariosDTS extends DataTableSource {
  final List<Usuario> students;
  final BuildContext context;
  final UsuariosProvider usuarios;

  UsuariosDTS(this.students, this.context, this.usuarios);

  final url = AllApi.url;

  @override
  DataRow getRow(int index) {
    final student = this.students[index];
    final image = Image(
      image: AssetImage('img/no-image.jpg'),
      width: 35,
      height: 35,
    );

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(
        child: image,
      )),
      DataCell(Text(student.nombre!)),
      DataCell(Text(student.correo!)),
      DataCell(Text(student.telefono!)),
      DataCell(Text(student.direccion!)),
      DataCell(Text(student.ciudad!)),
      DataCell(Text(
        (student.estado == '33') ? 'Activo' : 'Inactivo',
      )),
      DataCell(Row(
        children: [
          IconButton(
              // editar estudiantes
              color: Colors.blue,
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                NavigationService.navigateTo(
                    '/dashboard/editar-usuarios/${student.id}');
              }),
          IconButton(
              // inactivar estudiantes
              color: (student.estado == '33') ? Colors.red[400] : Colors.green,
              icon: Icon((student.estado == '33')
                  ? Icons.delete_outline
                  : Icons.check_circle_outline),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text((student.estado == '33')
                      ? '¿Desea Inactivar este Estudiante?'
                      : '¿Desea Activar este Estudiante?'),
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
  int get rowCount => students.length;

  @override
  int get selectedRowCount => 0;
}
