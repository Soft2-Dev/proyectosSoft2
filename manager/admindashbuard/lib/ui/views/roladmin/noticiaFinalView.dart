import 'package:admin_dashbuard/models/http/noticiasModels.dart';
import 'package:admin_dashbuard/provider/noticisasProvider.dart';
import 'package:admin_dashbuard/services/navigationService.dart';
import 'package:admin_dashbuard/ui/buttons/customIconButton.dart';
import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticiaFinalView extends StatefulWidget {
  final String id;

  const NoticiaFinalView({Key? key, required this.id}) : super(key: key);

  @override
  _NoticiaFinalViewState createState() => _NoticiaFinalViewState();
}

class _NoticiaFinalViewState extends State<NoticiaFinalView> {
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
    //final noticiasProvider = Provider.of<NoticiasProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            children: [
              if (noticia == null) CircularProgressIndicator(),
              if (noticia != null)
                Container(
                  decoration: buildBoxDecoration(),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  width: 600,
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Text(
                          this.noticia!.titulo!,
                          style: CustomLabels.h3,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.infinity,
                        child: (noticia!.urlImagen != null)
                            ? Image.network(
                                noticia!.urlImagen!,
                                fit: BoxFit.contain,
                              )
                            : Container(),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: double.infinity,
                        child: Text(
                          this.noticia!.descripcion!,
                          style: CustomLabels.p,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (noticia!.urlImagen != null)
                        InkWell(
                          onTap: () {
                            _launchURL(url: noticia!.urlnota!);
                          },
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Leer mas...',
                              style: CustomLabels.link,
                              textAlign: TextAlign.justify,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustomIconButton(
                              onPressd: () {
                                NavigationService.replaceTo(
                                    '/dashboard/editarnoticia/${widget.id}');
                              },
                              text: 'Editar',
                              icon: Icons.edit_outlined,
                              color: Colors.indigo.withOpacity(0.1),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5)
          ]);

  _launchURL({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
