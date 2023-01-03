class Perfiles {
  List<Perfil> dato = [];
  Perfiles();

  Perfiles.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Perfil.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

class Perfil {
  String rp;
  String id;
  String documento;
  String nombre;
  String direccion;
  String telefono;
  String celular;
  String ciudad;
  String departamento;
  String correo;
  String codVendedor;
  String estado;


  Perfil({
    this.rp,
    this.id,
    this.documento,
    this.nombre,
    this.direccion,
    this.telefono,
    this.celular,
    this.ciudad,
    this.departamento,
    this.correo,
    this.codVendedor,
    this.estado,
   
  });

  Perfil.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    documento = datos['documento'];
    nombre = datos['nombre'];
    direccion = datos['direccion'];
    telefono = datos['telefono'];
    celular = datos['celular'];
    ciudad = datos['ciudad'];
    departamento = datos['departamento'];
    correo = datos['correo'];
    codVendedor = datos['codVendedor'];
    estado = datos['estado'];
 
  }
}
