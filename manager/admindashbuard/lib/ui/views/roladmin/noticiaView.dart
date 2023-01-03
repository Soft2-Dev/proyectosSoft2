import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/provider/noticiaFromProvider.dart';
import 'package:admin_dashbuard/provider/noticisasProvider.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/services/notificationService.dart';
import 'package:admin_dashbuard/ui/inputs/customInpunt.dart';

import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiaView extends StatefulWidget {
  @override
  _NoticiaViewState createState() => _NoticiaViewState();
}

class _NoticiaViewState extends State<NoticiaView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Nueva Noticia',
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
                //_NewImagen(),
                SizedBox(
                  height: 20,
                ),
                _ViewFrom(),
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
  @override
  __ViewFromState createState() => __ViewFromState();
}

class __ViewFromState extends State<_ViewFrom> {
  @override
  Widget build(BuildContext context) {
    final noticiaFormProvider = Provider.of<NoticiaFromProvider>(context);
    final noticiasProvider = Provider.of<NoticiasProvider>(context);
    return Form(
      key: noticiaFormProvider.fromkeyNotice,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600),
            child: TextFormField(
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
              onChanged: (value) => noticiaFormProvider.urlnota = value,
              decoration: CustomInputs.formInputDecoration(
                  hint: 'Link', label: 'Link de la Noticia', icon: Icons.link),
            ),
          ),
          if (noticiasProvider.isSaveNotice)
            SizedBox(
              height: 30,
            ),
          if (noticiasProvider.isSaveNotice)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 150),
              child: ElevatedButton(
                onPressed: () {
                  _launchURL(
                      tipo: 'notice',
                      uid: noticiasProvider.noticia!.id!,
                      text: noticiaFormProvider.titulo);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.green[300]),
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
                        '/dashboard/finalnoticia/${noticiasProvider.noticia!.id}');
                  } else {
                    noticiasProvider.registerNoticia(
                        noticiaFormProvider.titulo,
                        noticiaFormProvider.descricion,
                        noticiaFormProvider.urlnota);
                  }
                }
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)),
              child: Row(children: [
                Icon(Icons.save_outlined),
                if (noticiasProvider.isSaveNotice) Text('     Ver Noticia'),
                if (!noticiasProvider.isSaveNotice) Text('    Continuar'),
              ]),
            ),
          )
        ],
      ),
    );
  }

  _launchURL(
      {required String tipo, required String uid, required String text}) async {
    final base = AllApi.url;
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

class _NewImagen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noticiasProvider = Provider.of<NoticiasProvider>(context);
    final noticia = noticiasProvider.noticia;
    final noticiaFormProvider = Provider.of<NoticiaFromProvider>(context);
    return Container(
      child: Stack(
        children: [
          Container(
            width: 500,
            height: 250,
            child:
                (noticiasProvider.existeImage) ? Text('nulo') : Text('no nulo'),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black87, offset: Offset(2, 2), blurRadius: 2)
            ]),
          ),
          Positioned(
            right: 2,
            bottom: 2,
            child: Container(
              padding: EdgeInsets.only(right: 5, top: 2, bottom: 2),
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: FloatingActionButton(
                backgroundColor: (noticiasProvider.isSaveNotice)
                    ? Colors.indigo
                    : Colors.grey,
                onPressed: () {
                  if (!noticiasProvider.isLoadImage) {
                    if (noticiasProvider.isSaveNotice) {
                      _launchURL(
                          tipo: 'notice',
                          uid: noticia!.id!,
                          text: noticiaFormProvider.titulo);
                      noticiasProvider.getIsLoadImage(true);
                    } else {
                      NotificationService.showSnackBarIfo(
                          'Debe crear primero Una noticia');
                    }
                  } else {
                    if (noticiasProvider.isLoadImage) {
                      print('ooooooooooooooo ');
                      noticiasProvider.getNoticia(noticia!.id!);
                    }
                  }
                },
                child: Icon(
                  Icons.done_outlined,
                  size: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _launchURL(
      {required String tipo, required String uid, required String text}) async {
    final base = AllApi.url;
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
