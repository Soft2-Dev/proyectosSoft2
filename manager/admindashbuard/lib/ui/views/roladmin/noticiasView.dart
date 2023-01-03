import 'package:admin_dashbuard/datatables/noticiasDTS.dart';
import 'package:admin_dashbuard/provider/noticisasProvider.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/ui/buttons/customIconButton.dart';

import 'package:admin_dashbuard/ui/labels/customLabels.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoticiasView extends StatefulWidget {
  @override
  _NoticiasViewState createState() => _NoticiasViewState();
}

class _NoticiasViewState extends State<NoticiasView> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoticiasProvider>(context, listen: false).getTodasNoticias('3');
  }

  @override
  Widget build(BuildContext context) {
    final noticias = Provider.of<NoticiasProvider>(context);
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
            'Noticias',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          PaginatedDataTable(
            dataRowHeight: 100,
            sortAscending: noticias.ascending,
            sortColumnIndex: noticias.sortColumnIndex,
            header: Text(
              // titulo de la tabla
              'Lista de Todas las Noticias',
              maxLines: 2,
            ),
            actions: [
              // botones de accion
              CustomIconButton(
                text: 'Agregar Nueva',
                icon: Icons.person_add_alt_1_outlined,
                color: Colors.green,
                onPressd: () {
                  NavigationService.navigateTo('/dashboard/noticia');
                  // showModalBottomSheet(
                  //     backgroundColor: Colors.transparent,
                  //     context: context,
                  //     builder: (_) => NoticiasModals(
                  //           carrera: null,
                  //         ));
                },
              )
            ],
            columns: [
              DataColumn(label: Text('Imagen')),
              DataColumn(
                  label: Text('Titulo'),
                  onSort: (colIndex, _) {
                    noticias.sortColumnIndex = colIndex;
                    noticias.sort<String>((noticia) => noticia.titulo!);
                  }),
              DataColumn(
                  label: Text('estado'),
                  onSort: (colIndex, _) {
                    noticias.sortColumnIndex = colIndex;
                    noticias.sort<String>((noticia) => noticia.estado!);
                  }),
              DataColumn(
                label: Text('Acciones'),
              ),
            ],
            source: NoticiasDTS(noticias.noticias, context),
            onRowsPerPageChanged: (value) {
              // lista de opcion para carga de productos
              setState(() {
                _rowsPerPage = value ?? 5;
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
