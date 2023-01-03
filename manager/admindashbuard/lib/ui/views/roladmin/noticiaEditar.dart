import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/models/http/noticiasModels.dart';
import 'package:admin_dashbuard/provider/noticiaFromProvider.dart';
import 'package:admin_dashbuard/provider/noticisasProvider.dart';
import 'package:admin_dashbuard/services/navigationService.dart';

import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';

import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiaEditarView extends StatefulWidget {
  final String id;

  const NoticiaEditarView({Key? key, required this.id}) : super(key: key);

  @override
  _NoticiaEditarViewState createState() => _NoticiaEditarViewState();
}

class _NoticiaEditarViewState extends State<NoticiaEditarView> {
  Noticia? noticia;
  @override
  void initState() {
    super.initState();
    final noticiaProvider =
        Provider.of<NoticiasProvider>(context, listen: false);
    noticiaProvider.getNoticia(widget.id).then((userDB) {
      setState(() {
        this.noticia = userDB[0];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: (noticia == null)
          ? ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 100),
              child: Container(
                  width: 100, height: 100, child: CircularProgressIndicator()),
            )
          : ListView(
              physics: ClampingScrollPhysics(),
              children: [
                Text(
                  'Nueva Noticia  ',
                  style: CustomLabels.h1,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      _ViewFrom(noticia: noticia!),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}

class _ViewFrom extends StatefulWidget {
  final Noticia noticia;

  const _ViewFrom({Key? key, required this.noticia}) : super(key: key);

  @override
  __ViewFromState createState() => __ViewFromState();
}

class __ViewFromState extends State<_ViewFrom> {
  @override
  Widget build(BuildContext context) {
    final noticiaFormProvider = Provider.of<NoticiaFromProvider>(context);
    final noticiasProvider = Provider.of<NoticiasProvider>(context);
    noticiaFormProvider.titulo = widget.noticia.titulo!;
    noticiaFormProvider.descricion = widget.noticia.descripcion!;
    noticiaFormProvider.urlnota = widget.noticia.urlnota!;

    return Form(
      key: noticiaFormProvider.fromkeyNotice,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: TextFormField(
              initialValue: noticiaFormProvider.titulo,
              onChanged: (value) => noticiaFormProvider.titulo = value,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Titulo',
                  label: 'Titulo de la Noticia',
                  icon: Icons.title),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Ingrese Un Titulo de noticia';
                if (value.length < 5) return 'El Titulo es Demaciado Corto';
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: TextFormField(
              initialValue: noticiaFormProvider.descricion,
              maxLines: 15,
              maxLength: 1000,
              onChanged: (value) => noticiaFormProvider.descricion = value,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Texto',
                  label: 'Texto de la Noticia',
                  icon: Icons.description),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Ingrese Un Titulo de noticia';
                if (value.length < 5) return 'El Titulo es Demaciado Corto';
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: TextFormField(
              initialValue: noticiaFormProvider.urlnota,
              onChanged: (value) => noticiaFormProvider.urlnota = value,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Link', label: 'Link de la Noticia', icon: Icons.link),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 150),
            child: ElevatedButton(
              onPressed: () {
                _launchURL(
                    tipo: 'notice',
                    uid: widget.noticia.id!,
                    text: noticiaFormProvider.titulo);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[300]),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)),
              child: Row(
                children: [
                  Icon(Icons.cloud_upload_outlined),
                  Text('     Cargar Imagen')
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 150),
            child: ElevatedButton(
              onPressed: () {
                if (noticiaFormProvider.validateFrom()) {
                  if (noticiasProvider.isSaveNotice) {
                    noticiasProvider.isSaveNotice = false;
                    NavigationService.replaceTo(
                        '/dashboard/finalnoticia/${widget.noticia.id!}');
                  } else {
                    noticiasProvider.editarNoticia(
                        '10',
                        noticiaFormProvider.titulo,
                        noticiaFormProvider.descricion,
                        noticiaFormProvider.urlnota,
                        widget.noticia.id!);

                    noticiaFormProvider.titulo = '';
                  }
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)),
              child: Row(children: [
                Icon(Icons.save_outlined),
                if (noticiasProvider.isSaveNotice) Text('     Ver Noticia'),
                if (!noticiasProvider.isSaveNotice) Text('    Guardar'),
              ]),
            ),
          )
        ],
      ),
    );
  }

  final base = AllApi.url;
  _launchURL(
      {required String tipo, required String uid, required String text}) async {
    text = text.replaceAll('%', '');

    String url = base +
        '/documentos/datos.php?tipo=' +
        tipo +
        '&token=' +
        uid +
        '&label=' +
        text;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
