import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperPublicidadHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> img = ['baner1', 'baner2', 'baner3'];

    return Container(
      child: Swiper(
        autoplay: true,
        duration: 3000,
        viewportFraction: 0.99,
        scale: 0.7,
        control: SwiperControl(),
        pagination: new SwiperPagination(alignment: Alignment.bottomCenter),
        itemCount: img.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: buildBoxDecoration(),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: 600,
                height: 800,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: 500,
                  height: 300,
                  child: FadeInImage(
                    placeholder: AssetImage('img/no-image.jpg'),
                    image: AssetImage('img/' + img[index]),
                    fit: BoxFit.contain,
                  ),
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
}
