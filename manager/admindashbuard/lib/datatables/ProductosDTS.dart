import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/usuarios.dart';
import 'package:admin_dashbuard/models/productos/Productos.dart';
import 'package:admin_dashbuard/provider/productos/productosProvider.dart';
import 'package:admin_dashbuard/provider/usuariosProvider.dart';

import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/authProvider.dart';

class ProductosDTS extends DataTableSource {
  final List<Producto> productos;
  final BuildContext context;
  final ProductosProvider usuarios;

  ProductosDTS(this.productos, this.context, this.usuarios);

  final url = AllApi.url;

  @override
  DataRow getRow(int index) {
    final producto = this.productos[index];
    final image = Image(
      image: AssetImage('img/no-image.jpg'),
      width: 35,
      height: 35,
    );

    return DataRow.byIndex(index: index, cells: [
      DataCell(ClipOval(
        child: (producto.url == '')
            ? image
            : Image(
                image: NetworkImage(producto.url!),
                width: 35,
                height: 35,
              ),
      )),
      DataCell(Text(producto.plu!)),
      DataCell(Text(producto.producto!)),
      DataCell(Text(producto.cantidad!)),
      // DataCell(Text(producto.descripcion!)),
      // DataCell(Text(producto.referencia!)),
      DataCell(Text(producto.presentacion!)),
      DataCell(Text(producto.valorMayor!)),
      // DataCell(Text(producto.impuesto!)),
      // DataCell(Text(producto.fecha!)),
      DataCell(Text(producto.categoria!)),
      DataCell(Text(
        (producto.estado == '24') ? 'Activo' : 'Inactivo',
      )),
      DataCell(Row(
        children: [
          // IconButton(
          //     // editar estudiantes
          //     color: Colors.blue,
          //     icon: Icon(Icons.edit_outlined),
          //     onPressed: () {
          //       NavigationService.navigateTo(
          //           '/dashboard/editar-usuarios/${producto.id}');
          //     }),
          IconButton(
              // inactivar estudiantes
              color: (producto.estado == '24') ? Colors.red[400] : Colors.green,
              icon: Icon((producto.estado == '24')
                  ? Icons.delete_outline
                  : Icons.check_circle_outline),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text((producto.estado == '24')
                      ? '¿Desea Inactivar este Estudiante?'
                      : '¿Desea Activar este Estudiante?'),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning,
                        color: (producto.estado == '24')
                            ? Colors.red
                            : Colors.green,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text((producto.estado == '24')
                          ? 'Inactivar ${producto.producto}'
                          : 'Activar ${producto.producto}')
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          if (producto.estado == '24') {
                            usuarios.inactivarProductos(producto.id!, '25');
                          } else {
                            usuarios.inactivarProductos(producto.id!, '24');
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text((producto.estado == '24')
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
  int get rowCount => productos.length;

  @override
  int get selectedRowCount => 0;
}
