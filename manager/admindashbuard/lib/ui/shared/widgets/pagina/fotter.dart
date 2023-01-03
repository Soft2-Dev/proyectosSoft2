import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      //color: Colors.blue,
      child: Column(
        children: [
          Container(
            color: Color(0xff383838),
            height: 250,
            width: double.infinity,
            alignment: Alignment.center,
            child: Container(
              width: size.width * 0.6,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    width: size.width * 0.3,
                    //color: Colors.amber,
                    height: 280,
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Academia Francia Belleza y Diseño Cauca',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Cra. 4 #N 0 - 66, Popayán, Cauca',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Telé:fono: 032 4554544 - 315 02456444',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.3,
                    //color: Colors.pink[50],
                    height: 280,
                    alignment: Alignment.centerLeft,
                    child: Image(
                      image: AssetImage('img/escudo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Color(0xff272727),
            height: (size.width > 600) ? 60 : 80,
            alignment: Alignment.center,
            child: Container(
              width: (size.width > 600) ? double.infinity : double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: (size.width > 600) ? _DerechosDestock() : _DerechosMovil(),
            ),
          )
        ],
      ),
    );
  }
}

class _DerechosDestock extends StatelessWidget {
  const _DerechosDestock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            'Copyright ',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ),
        Container(
          child: Icon(
            Icons.copyright,
            color: Colors.grey,
            size: 15,
          ),
        ),
        Container(
          child: Text(
            ' Academia Francia Belleza Y Diseño Cauca',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ),
        Expanded(child: Container()),
        Container(
          child: Text(
            'Desarrollado por Desarrollando-Cali 322-6431138',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }
}

class _DerechosMovil extends StatelessWidget {
  const _DerechosMovil({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'Copyright ',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              child: Icon(
                Icons.copyright,
                color: Colors.grey,
                size: 15,
              ),
            ),
          ],
        ),
        Container(
          child: Text(
            ' Academia Francia Belleza Y Diseño Cauca',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          child: Text(
            'Desarrollado por Desarrollando-Cali 322-6431138',
            style: TextStyle(
                color: Colors.grey, fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ),
      ],
    );
  }
}
