import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CargarUsuarios extends StatefulWidget {
  const CargarUsuarios({Key? key}) : super(key: key);

  @override
  State<CargarUsuarios> createState() => _CargarUsuariosState();
}

class _CargarUsuariosState extends State<CargarUsuarios> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff092044),
          title: Text('Cargar Archivos'),
        ),
        body: WebView(
          initialUrl: 'https://pido.des-cali.com/cargaExcel/cargaUsuarios.php',
        ));
  }
}
