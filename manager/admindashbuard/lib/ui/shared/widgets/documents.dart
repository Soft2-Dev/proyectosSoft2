import 'package:admin_dashbuard/api/AllApi.dart';
import 'package:admin_dashbuard/provider/studentsProvider.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentsWidget extends StatelessWidget {
  final String text;
  final String documento;
  final String? url;
  final String? uid;
  final String? tipo;

  const DocumentsWidget(
      {Key? key,
      required this.text,
      required this.documento,
      this.url,
      this.uid,
      this.tipo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Table(
          columnWidths: {1: FixedColumnWidth(300)}, //condicion
          children: [
            TableRow(children: [
              Container(
                //color: Colors.amber,
                child: Text(
                  text,
                  style: CustomLabels.h2,
                ),
              ),
              if (documento == '1')
                _DocumentsValidado(
                  url: url!,
                  uid: uid!,
                ),
              if (documento == '0')
                _DocumentsNotValidado(tipo: tipo, uid: uid, text: text),
            ])
          ],
        ),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 0))
        ]));
  }
}

class _DocumentsNotValidado extends StatelessWidget {
  final String? uid;
  final String? tipo;
  final String? text;

  const _DocumentsNotValidado({Key? key, this.uid, this.tipo, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //check_circle_outline
          ElevatedButton(
            onPressed: () {
              _launchURL(tipo: tipo!, uid: uid!, text: text!);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green[300]),
                shadowColor: MaterialStateProperty.all(Colors.transparent)),
            child: Row(
              children: [
                Icon(Icons.cloud_upload_outlined),
                Text(' Cargar Documento')
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<StudentsProvider>(context, listen: false)
                  .getdocuments(uid!);
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
                shadowColor: MaterialStateProperty.all(Colors.transparent)),
            child: Row(
              children: [Icon(Icons.check_circle), Text(' Validar Carga')],
            ),
          ),

          //file_upload
        ],
      ),
    );
  }

  _launchURL(
      {required String tipo, required String uid, required String text}) async {
    text = text.replaceAll('%', '');
    final base = AllApi.url;
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

class _DocumentsValidado extends StatelessWidget {
  final String url;
  final String uid;

  const _DocumentsValidado({Key? key, required this.url, required this.uid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //check_circle_outline
          IconButton(
            onPressed: () {},
            color: Colors.green,
            icon: Icon(
              Icons.check_circle_outline,
              size: 35,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            hoverColor: Colors.green,
            onPressed: () {
              print('1111111111 ' + url);

              _launchURL(url);
            },
            color: Colors.blue,
            icon: Icon(
              Icons.cloud_download_outlined,
              size: 35,
            ),
          ),

          //file_upload
        ],
      ),
    );
  }

  _launchURL(String ruta) async {
    print('2 ' + ruta.toString());
    final base = AllApi.url;
    String url = base + '/documentos/' + ruta;
    print('object ----- ' + ruta);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
