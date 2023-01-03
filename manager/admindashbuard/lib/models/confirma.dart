class Confirmas {
  List<Confirma> dato = [];
  Confirmas();

  Confirmas.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Confirma.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

// $isRpta=true;
// $result["rp"]           ='ok';
// $result["id"]           =$registro['id'];
// $result["orden"]        =$registro['orden'];
// $result["fecha"]        =$registro['fecha'];
// $result["nombre"]       =$registro['nombre'];
// $result["totalPedido"]  =$registro['totalPedido'];
// $result["idParametro"] =$registro['idParametro'];
// $result["estado"] =$registro['estado'];
// $json['rpta'][]         =$result;

class Confirma {
  String? rp;

  Confirma({
    this.rp,
  });

  Confirma.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
  }
}
