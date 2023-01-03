import 'package:admin_dashbuard/provider/noticisasProvider.dart';

import 'package:admin_dashbuard/ui/shared/widgets/SwiperNoticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoticiasViewUsuario extends StatefulWidget {
  @override
  _NoticiasViewUsuarioState createState() => _NoticiasViewUsuarioState();
}

class _NoticiasViewUsuarioState extends State<NoticiasViewUsuario> {
  @override
  void initState() {
    super.initState();
    Provider.of<NoticiasProvider>(context, listen: false).getTodasNoticias('1');
  }

  @override
  Widget build(BuildContext context) {
    final noticias = Provider.of<NoticiasProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
              width: 700,
              height: 800,
              child: SwiperNoticias(noticias: noticias.noticias)),
        ],
      ),
    );
  }
}
