import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CargarProductos extends StatefulWidget {
  const CargarProductos({Key? key}) : super(key: key);

  @override
  State<CargarProductos> createState() => _CargarProductosState();
}

class _CargarProductosState extends State<CargarProductos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff092044),
          title: Text('Cargar Productos'),
        ),
        body: WebView(
          initialUrl:
              'https://pido.des-cali.com/cargaExcel/cargaProductos.php?rpta=1',
        ));
  }
}
