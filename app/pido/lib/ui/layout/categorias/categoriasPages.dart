import 'package:flutter/material.dart';
import 'package:pido/provider/categoriasProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoriasPages extends StatefulWidget {
  const CategoriasPages({Key key}) : super(key: key);

  @override
  _CategoriasPagesState createState() => _CategoriasPagesState();
}

class _CategoriasPagesState extends State<CategoriasPages> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProviderCategorias>(context, listen: false).getcategorias();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<ProviderCategorias>(context).categorias;
    final provider = Provider.of<ProviderCategorias>(context);
    final size = MediaQuery.of(context).size;

    List<Widget> itemMap = [];

    if (provider.isCategorias) {
      itemMap = categorias
          .map((e) => InkWell(
                onTap: () {
                  provider.isSelectCategoria = e.id;
                  provider.isCategoria = e.categoria;
                  Navigator.pushNamed(context, 'ProductosCategoria');
                },
                child: Stack(
                  children: [
                    Container(
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(e.url),
                        colorBlendMode: BlendMode.color,
                      ),
                    ),
                    Container(
                        height: size.height * 0.05,
                        margin: EdgeInsets.only(top: 50),
                        alignment: Alignment.center,
                        color: Colors.black54,
                        child: Text(
                          e.categoria,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ))
                  ],
                ),
              ))
          .toList();
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff082452),
          title: Text('Categorias'),
        ),
        body: SingleChildScrollView(
          child: StaggeredGrid.count(
            axisDirection: AxisDirection.down,
            crossAxisCount: 2,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
            children: [...itemMap],
          ),
        )

        // StaggeredGrid.count(
        //   crossAxisCount: 3,
        //   mainAxisSpacing: 4,
        //   crossAxisSpacing: 4,
        //   children: [...itemMap],
        // )

        );
  }
}
