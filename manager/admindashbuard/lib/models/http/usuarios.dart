class Usuarios {
  List<Usuario> dato = [];
  Usuarios();

  Usuarios.fromlist(List<dynamic> datos) {
    if (datos == null) return;

    for (var item in datos) {
      final detalle = new Usuario.fromJsonMap(item);
      dato.add(detalle);
    }
  }
}

// $result["rp"]           ='ok';
// $result["id"]           =$registro['id'];
// $result["documento"]    =$registro['documento'];
// $result["nombre"]       =$registro['nombre'];
// $result["direccion"]    =$registro['direccion'];
// $result["ciudad"]    =$registro['ciudad'];
// $result["correo"]       =$registro['correo'];
// $result["telefono"]     =$registro['telefono'];
// $result["contrasena"]   =$registro['contrasena'];
// $result["rol"]          =$registro['rol'];
// $result["estado"]       =$registro['estado'];

class Usuario {
  String? rp;
  String? id;
  String? documento;
  String? nombre;
  String? telefono;
  String? correo;
  String? direccion;
  String? ciudad;
  String? contrasena;
  String? rol;
  String? estado;
  String? porcentaje;

  Usuario({
    this.rp,
    this.id,
    this.documento,
    this.nombre,
    this.telefono,
    this.correo,
    this.direccion,
    this.ciudad,
    this.contrasena,
    this.rol,
    this.estado,
    this.porcentaje,
  });

  Usuario.fromJsonMap(Map<String, dynamic> datos) {
    rp = datos['rp'];
    id = datos['id'];
    documento = datos['documento'];
    nombre = datos['nombre'];
    telefono = datos['telefono'];
    correo = datos['correo'];
    direccion = datos['direccion'];
    ciudad = datos['ciudad'];
    contrasena = datos['contrasena'];
    rol = datos['rol'];
    estado = datos['estado'];
    porcentaje = datos['porcentaje'];
  }
}
