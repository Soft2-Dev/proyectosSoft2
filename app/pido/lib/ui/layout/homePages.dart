import 'package:flutter/material.dart';
import 'package:pido/ui/construcion_page.dart';
import 'package:pido/ui/layout/menu/menu.dart';
import 'categorias/categoriasPages.dart';
import 'clientes/perfil.dart';
import 'productos/productos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaSeleccionada = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _cargarPagina(paginaSeleccionada),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  _crearBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Color(0xff082452),
      unselectedItemColor: Color(0xff082452),
      elevation: 10,
      showUnselectedLabels: true,
      currentIndex: paginaSeleccionada,
      onTap: (index) {
        setState(() {
          paginaSeleccionada = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
            size: 20,
          ),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.grid_view,
            size: 20,
          ),
          label: 'Categorias',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            size: 20,
          ),
          label: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.format_list_bulleted,
            size: 20,
          ),
          label: 'Mas',
        ),
      ],
      backgroundColor: Colors.blue[50],
    );
  }

  _cargarPagina(int paginaActaul) {
    switch (paginaActaul) {
      case 0:
        return ProductosPages(); //PrincipalPage

      case 1:
        return CategoriasPages(); //CategoriaPage

      case 2:
        return PerfilPages();

      case 3:
        return MenuPages();
     

      default:
        return Construccion(); //CarteraPage
    }
  }
}
