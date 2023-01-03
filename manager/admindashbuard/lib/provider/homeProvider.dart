import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool? inicio = true;
  bool? programas;
  bool? nosotros;

  setInicio(bool inicio) {
    print('aaaaaaaaaaaa');
    this.inicio = inicio;
    this.programas = false;
    this.nosotros = false;
    notifyListeners();
  }

  setProgramas(bool programas) {
    this.programas = programas;
    this.inicio = false;
    this.nosotros = false;
    notifyListeners();
  }

  setNosotros(bool inicio) {
    this.nosotros = inicio;
    this.programas = false;
    this.inicio = false;
    notifyListeners();
  }
}
