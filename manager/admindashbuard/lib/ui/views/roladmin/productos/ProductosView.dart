import 'package:admin_dashbuard/provider/productos/productosProvider.dart';
import 'package:admin_dashbuard/provider/usuariosProvider.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/ui/buttons/customIconButton.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../datatables/ProductosDTS.dart';
import '../../../../datatables/UsuariosDTS.dart';

class ProductosView extends StatefulWidget {
  @override
  _ProductosViewState createState() => _ProductosViewState();
}

class _ProductosViewState extends State<ProductosView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductosProvider>(context, listen: false).getProductos();
  }

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProductosProvider>(context);
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
            'Productos',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            sortAscending: productos.ascending,
            sortColumnIndex: productos.sortColumnIndex,
            header: Text('Todos los Productos'),
            columns: [
              DataColumn(label: Text('Imagen')),
              DataColumn(
                  label: Text('Plu'),
                  onSort: (colIndex, _) {
                    productos.sortColumnIndex = colIndex;
                    productos.sort<String>((user) => user.plu!);
                  }),
              DataColumn(
                  label: Text('Producto'),
                  onSort: (colIndex, _) {
                    productos.sortColumnIndex = colIndex;
                    productos.sort<String>((user) => user.producto!);
                  }),
              DataColumn(
                  label: Text('Cantidad'),
                  onSort: (colIndex, _) {
                    productos.sortColumnIndex = colIndex;
                    productos.sort<String>((user) => user.cantidad!);
                  }),
              // DataColumn(
              //   label: Text('Descripción'),
              //   onSort: (colIndex, _) {
              //     productos.sortColumnIndex = colIndex;
              //     productos.sort<String>((user) => user.estado!);
              //   },
              // ),
              // DataColumn(
              //   label: Text('Referencia'),
              //   onSort: (colIndex, _) {
              //     productos.sortColumnIndex = colIndex;
              //     productos.sort<String>((user) => user.estado!);
              //   },
              // ),
              DataColumn(
                label: Text('Presentacion'),
                onSort: (colIndex, _) {
                  productos.sortColumnIndex = colIndex;
                  productos.sort<String>((user) => user.estado!);
                },
              ),
              DataColumn(
                label: Text('Valor'),
                onSort: (colIndex, _) {
                  productos.sortColumnIndex = colIndex;
                  productos.sort<String>((user) => user.estado!);
                },
              ),
              // DataColumn(
              //   label: Text('Impuesto'),
              //   onSort: (colIndex, _) {
              //     productos.sortColumnIndex = colIndex;
              //     productos.sort<String>((user) => user.estado!);
              //   },
              // ),
              // DataColumn(
              //   label: Text('Fecha'),
              //   onSort: (colIndex, _) {
              //     productos.sortColumnIndex = colIndex;
              //     productos.sort<String>((user) => user.estado!);
              //   },
              // ),
              DataColumn(
                label: Text('Categoria'),
                onSort: (colIndex, _) {
                  productos.sortColumnIndex = colIndex;
                  productos.sort<String>((user) => user.estado!);
                },
              ),
              DataColumn(
                label: Text('Estado'),
                onSort: (colIndex, _) {
                  productos.sortColumnIndex = colIndex;
                  productos.sort<String>((user) => user.estado!);
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
                  NavigationService.navigateTo('/dashboard/registro-producto');
                },
              )
            ],
            source: ProductosDTS(productos.producto, context, productos),
            onRowsPerPageChanged: (value) {
              // lista de opcion para carga de productos
              setState(() {
                _rowsPerPage = value ?? 50;
              });
            },
            rowsPerPage: 50,
            onPageChanged: (page) {
              print(page);
            },
          )
        ],
      ),
    );
  }
}
