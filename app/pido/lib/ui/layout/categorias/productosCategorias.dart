import 'package:flutter/material.dart';
import 'package:pido/provider/categoriasProvider.dart';
import 'package:pido/provider/productos/productoProvider.dart';
import 'package:provider/provider.dart';

class ProductosCategoria extends StatefulWidget {
  const ProductosCategoria({Key key}) : super(key: key);

  @override
  _ProductosCategoriaState createState() => _ProductosCategoriaState();
}

class _ProductosCategoriaState extends State<ProductosCategoria> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderCategorias>(context, listen: false)
        .getCategoriaProductos();
  }

  @override
  Widget build(BuildContext context) {
    final productos = Provider.of<ProviderCategorias>(context).productos;
    final providerCategoria =
        Provider.of<ProviderCategorias>(context, listen: false);
    final provider = Provider.of<ProviderProductos>(context, listen: false);

    List<Widget> itemMap = productos
        .map((e) => Container(
              margin: EdgeInsets.only(top: 5, left: 10, right: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, offset: Offset(1, 1), blurRadius: 2)
                  ]),
              child: ListTile(
                onTap: () {
                  provider.productosSeleccion = e;
                  Navigator.pushNamed(context, 'DetalleProducto');
                },
                title: Text(e.producto),
                subtitle: Row(
                  children: [
                    Text('Plu: ' + e.plu),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Prest: ' + e.presentacion)
                  ],
                ),
                leading: Image(
                  image: NetworkImage(e.url),
                ),
                trailing: Column(
                  children: [
                    Text(
                      'Valor',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      e.valorMayor,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
            ))
        .toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(providerCategoria.isCategoria),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 10), child: Icon(Icons.search))
        ],
      ),
      body: ListView(
        children: [...itemMap],
      ),
    );
  }
}
