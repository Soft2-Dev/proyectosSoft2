import 'package:admin_dashbuard/provider/usuariosProvider.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/ui/buttons/customIconButton.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../datatables/UsuariosDTS.dart';

class UsuariosView extends StatefulWidget {
  @override
  _UsuariosViewState createState() => _UsuariosViewState();
}

class _UsuariosViewState extends State<UsuariosView> {
  @override
  void initState() {
    super.initState();
    Provider.of<UsuariosProvider>(context, listen: false).getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<UsuariosProvider>(context);
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
            'Usuarios',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            sortAscending: usuarios.ascending,
            sortColumnIndex: usuarios.sortColumnIndex,
            header: Text('Todos los Usuarios'),
            columns: [
              DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: Text('Nombre'),
                  onSort: (colIndex, _) {
                    usuarios.sortColumnIndex = colIndex;
                    usuarios.sort<String>((user) => user.nombre!);
                  }),
              DataColumn(
                  label: Text('Correo'),
                  onSort: (colIndex, _) {
                    usuarios.sortColumnIndex = colIndex;
                    usuarios.sort<String>((user) => user.correo!);
                  }),
              DataColumn(
                  label: Text('Télefono'),
                  onSort: (colIndex, _) {
                    usuarios.sortColumnIndex = colIndex;
                    usuarios.sort<String>((user) => user.telefono!);
                  }),
              DataColumn(
                  label: Text('Dirección'),
                  onSort: (colIndex, _) {
                    usuarios.sortColumnIndex = colIndex;
                    usuarios.sort<String>((user) => user.telefono!);
                  }),
              DataColumn(
                  label: Text('Ciudad'),
                  onSort: (colIndex, _) {
                    usuarios.sortColumnIndex = colIndex;
                    usuarios.sort<String>((user) => user.telefono!);
                  }),
              DataColumn(
                label: Text('Estado'),
                onSort: (colIndex, _) {
                  usuarios.sortColumnIndex = colIndex;
                  usuarios.sort<String>((user) => user.estado!);
                },
              ),
              DataColumn(label: Text('Acciones')),
            ],
            actions: [
              // botones de accion
              CustomIconButton(
                text: 'Agregar Nuevo',
                icon: Icons.person_add_alt_1_outlined,
                color: Colors.green,
                onPressd: () {
                  NavigationService.navigateTo(
                      '/dashboard/registro-usuarios/${'26'}');
                },
              )
            ],
            source: UsuariosDTS(usuarios.estudiantes, context, usuarios),
            onRowsPerPageChanged: (value) {
              // lista de opcion para carga de productos
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            onPageChanged: (page) {
              print(page);
            },
          )
        ],
      ),
    );
  }
}
