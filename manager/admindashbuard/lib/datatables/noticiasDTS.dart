import 'package:admin_dashbuard/models/http/noticiasModels.dart';
import 'package:admin_dashbuard/provider/noticisasProvider.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoticiasDTS extends DataTableSource {
  final List<Noticia> noticia;
  final BuildContext context;

  NoticiasDTS(this.noticia, this.context);

  @override
  DataRow? getRow(int index) {
    String estado = (noticia[index].estado == '1') ? 'Activo' : 'Incativo';

    String labelDialogo = (noticia[index].estado == '1')
        ? '¿Desea Inactivar esta Carrera?'
        : '¿Desea Activar esta Carrera?';

    String texDialogo = (noticia[index].estado == '1')
        ? 'Inactivar la Carrera ${noticia[index].titulo}'
        : 'Activar la Carrera ${noticia[index].titulo}';

    return DataRow.byIndex(index: index, cells: [
      DataCell(Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: 200,
        child: (noticia[index].urlImagen == null)
            ? Image(image: AssetImage('img/no-image.jpg'))
            : Image.network(
                noticia[index].urlImagen!,
                fit: BoxFit.contain,
              ),
      )),
      DataCell(
        Text(noticia[index].titulo!),
      ),
      DataCell(Text(estado)),
      DataCell(Row(
        children: [
          IconButton(
              // editar estudiantes
              color: Color(0xffff9800),
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                NavigationService.replaceTo(
                    '/dashboard/editarnoticia/${noticia[index].id!}');
              }),
          IconButton(
              // inactivar estudiantes
              color: Colors.red[400],
              icon: (noticia[index].estado == '1')
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
                          final noticiaProvider = Provider.of<NoticiasProvider>(
                              context,
                              listen: false);
                          String nestado =
                              (noticia[index].estado == '1') ? '0' : '1';
                          await noticiaProvider.borrarNoticia(
                              noticia[index].id!, nestado);

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
              }),
          IconButton(
              // editar estudiantes
              color: Colors.blue,
              icon: Icon(Icons.visibility_outlined),
              onPressed: () {
                NavigationService.replaceTo(
                    '/dashboard/finalnoticia/${noticia[index].id}');
              }),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => noticia.length;

  @override
  int get selectedRowCount => 0;
}
