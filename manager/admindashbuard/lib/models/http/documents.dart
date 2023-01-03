class Documentos {
  List<Documento> dato = [];
  Documentos();

  Documentos.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Documento.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Documento {
  String? id;
  String? idUsuarios;
  String? documento;
  String? urldocumento;
  String? cestudios;
  String? urlestudios;
  String? foto;
  String? urlfoto;
  String? cMedico;
  String? urlmedico;
  String? cvacunas;
  String? urlvacunas;
  String? legajador;
  String? urllegajador;
  String? fcondiciones;
  String? urlcondiciones;
  String? fmatricula;
  String? urlmatricula;

  Documento({
    this.id,
    this.idUsuarios,
    this.documento,
    this.urldocumento,
    this.cestudios,
    this.urlestudios,
    this.foto,
    this.urlfoto,
    this.cMedico,
    this.urlmedico,
    this.cvacunas,
    this.urlvacunas,
    this.legajador,
    this.urllegajador,
    this.fcondiciones,
    this.urlcondiciones,
    this.fmatricula,
    this.urlmatricula,
  });

  Documento.fromJsonMap(Map<String, dynamic> datos) {
    id = datos['id'];
    idUsuarios = datos['idUsuarios'];
    documento = datos['documento'];
    urldocumento = datos['urldocumento'];
    cestudios = datos['Cestudios'];
    urlestudios = datos['urlestudios'];
    foto = datos['foto'];
    urlfoto = datos['urlfoto'];
    cMedico = datos['CMedico'];
    urlmedico = datos['urlmedico'];
    cvacunas = datos['Cvacunas'];
    urlvacunas = datos['urlvacunas'];
    legajador = datos['legajador'];
    urllegajador = datos['urllegajador'];
    fcondiciones = datos['Fcondiciones'];
    urlcondiciones = datos['urlcondiciones'];
    fmatricula = datos['Fmatricula'];
    urlmatricula = datos['urlmatricula'];
  }
}
