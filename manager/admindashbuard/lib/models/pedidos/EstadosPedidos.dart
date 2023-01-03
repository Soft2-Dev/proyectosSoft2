class Estados {
  List<Estado> dato = [];
  Estados();

  Estados.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Estado.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

// $result["rp"]           ='ok';
// $result["id"]           =$registro['id'];
// $result["parametro"]        =$registro['parametro'];
// $result["tipoParametro"]        =$registro['tipoParametro'];
// $result["confi"]        =$registro['confi'];

class Estado {
  String? rp;
  String? id;
  String? parametro;
  String? tipoParametro;
  int? confi;

  Estado({
    this.rp,
    this.id,
    this.parametro,
    this.tipoParametro,
    this.confi,
  });

  Estado.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    parametro = datos['parametro'];
    tipoParametro = datos['tipoParametro'];
    String color = '0xff' + datos['confi'];
    print('******   ' + color);
    confi = int.parse(color);
  }
}
