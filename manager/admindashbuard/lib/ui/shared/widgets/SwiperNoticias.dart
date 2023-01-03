import 'package:admin_dashbuard/models/http/noticiasModels.dart';

import 'package:admin_dashbuard/ui/labels/customLabels.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SwiperNoticias extends StatelessWidget {
  final List<Noticia> noticias;

  const SwiperNoticias({Key? key, required this.noticias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        autoplay: true,
        duration: 3000,
        viewportFraction: 0.99,
        scale: 0.7,
        control: SwiperControl(),
        pagination: new SwiperPagination(alignment: Alignment.bottomCenter),
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: buildBoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: 600,
                height: 800,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Text(
                        noticias[index].titulo!,
                        style: CustomLabels.h3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: 500,
                      height: 300,
                      child: FadeInImage(
                        placeholder: AssetImage('img/no-image.jpg'),
                        image: NetworkImage(noticias[index].urlImagen!),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        noticias[index].descripcion!,
                        style: CustomLabels.p,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (noticias[index].urlnota != null)
                      InkWell(
                        onTap: () {
                          _launchURL(url: noticias[index].urlnota!);
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
                  ],
                ),
              ),
            ],
          );
        },
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
