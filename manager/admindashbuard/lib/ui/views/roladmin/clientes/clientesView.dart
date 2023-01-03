import 'package:admin_dashbuard/provider/clientes/clientesProvider.dart';

import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/ui/buttons/customIconButton.dart';

import 'package:admin_dashbuard/ui/labels/customLabels.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../datatables/ClientesDTS.dart';

class ClientesView extends StatefulWidget {
  @override
  _ClientesViewState createState() => _ClientesViewState();
}

class _ClientesViewState extends State<ClientesView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ClientesProvider>(context, listen: false).getClientes();
  }

  @override
  Widget build(BuildContext context) {
    final clientes = Provider.of<ClientesProvider>(context);
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
            'Clientes',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            sortAscending: clientes.ascending,
            sortColumnIndex: clientes.sortColumnIndex,
            header: Text(
              // titulo de la tabla
              'Listado de Clientes',
              maxLines: 2,
            ),
            actions: [
              // botones de accion

              CustomIconButton(
                text: 'Cargar desde excel',
                icon: Icons.upload_file,
                color: Colors.green,
                iconColor: Colors.white,
                onPressd: () {
                  NavigationService.navigateTo('/dashboard/cargarclientes');
                },
              )
            ],

            columns: [
              // nombres de las columnas
              DataColumn(label: Text('Avatar')),
              DataColumn(
                  label: Text('Documento'),
                  onSort: (colIndex, _) {
                    clientes.sortColumnIndex = colIndex;
                    clientes.sort<String>((user) => user.nombre!);
                  }),
              DataColumn(
                  label: Text('Nombre'),
                  onSort: (colIndex, _) {
                    clientes.sortColumnIndex = colIndex;
                    clientes.sort<String>((user) => user.nombre!);
                  }),
              DataColumn(
                  label: Text('Dirección'),
                  onSort: (colIndex, _) {
                    clientes.sortColumnIndex = colIndex;
                    clientes.sort<String>((user) => user.correo!);
                  }),
              DataColumn(
                  label: Text('Teléfono'),
                  onSort: (colIndex, _) {
                    clientes.sortColumnIndex = colIndex;
                    clientes.sort<String>((user) => user.correo!);
                  }),
              // DataColumn(
              //     label: Text('Celular'),
              //     onSort: (colIndex, _) {
              //       clientes.sortColumnIndex = colIndex;
              //       clientes.sort<String>((user) => user.correo!);
              //     }),
              DataColumn(
                  label: Text('Ciudad'),
                  onSort: (colIndex, _) {
                    clientes.sortColumnIndex = colIndex;
                    clientes.sort<String>((user) => user.correo!);
                  }),
              // DataColumn(
              //     label: Text('Departamento'),
              //     onSort: (colIndex, _) {
              //       clientes.sortColumnIndex = colIndex;
              //       clientes.sort<String>((user) => user.correo!);
              //     }),
              DataColumn(
                  label: Text('Correo'),
                  onSort: (colIndex, _) {
                    clientes.sortColumnIndex = colIndex;
                    clientes.sort<String>((user) => user.correo!);
                  }),

              DataColumn(
                label: Text('Estado'),
                onSort: (colIndex, _) {
                  clientes.sortColumnIndex = colIndex;
                  clientes.sort<String>((user) => user.estado!);
                },
              ),
              DataColumn(label: Text('Acciones')),
            ],

            source: ClientesDTS(clientes.estudiantes, context,
                clientes), //cargando datos cargados de BD

            onRowsPerPageChanged: (value) {
              // lista de opcion para carga de productos
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,

            onPageChanged: (page) {
              print(page);
            }, //limitando la cantidad de registro por pagina
          )
        ],
      ),
    );
  }
}
