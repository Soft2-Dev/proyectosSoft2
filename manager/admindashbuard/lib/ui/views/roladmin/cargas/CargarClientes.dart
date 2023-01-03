import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CargarClientes extends StatefulWidget {
  const CargarClientes({Key? key}) : super(key: key);

  @override
  State<CargarClientes> createState() => _CargarClientesState();
}

class _CargarClientesState extends State<CargarClientes> {
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
          initialUrl: 'https://pido.des-cali.com/cargaExcel/cargaClientes.php',
        ));
  }
}
