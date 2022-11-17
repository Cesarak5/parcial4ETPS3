import 'package:parcial4_2514342018/models/producto.dart';
import 'package:parcial4_2514342018/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ProductosProvider with ChangeNotifier {
  final firestoreservices = FirestoreServices();
  late String _id;
  late String _cedula;
  late String _nombre;
  late String _apellido;
  late String _fechanac;
  late String _sexo;
  late String _tipo;
  late String _usuario;
  late String _reservaid;
  var uuid = Uuid();

  //get
  String get id => _id;
  String get cedula => _cedula;
  String get nombre => _nombre;
  String get apellido => _apellido;
  String get fechanac => _fechanac;
  String get sexo => _sexo;
  String get tipo => _tipo;
  String get usuario => _usuario;
  String get reservaid => _reservaid;

  //set
  cambioNombre(String valorNombre) {
    _nombre = valorNombre;
    notifyListeners();
  }

  cambioApellido(String valorApellido) {
    _apellido = valorApellido;
    notifyListeners();
  }

  guardarProducto() {
    //print("$nombre, $precio");
    var nuevoProducto = Producto(
        id: uuid.v4(),
        cedula: cedula,
        nombre: nombre,
        apellido: apellido,
        fechanac: fechanac,
        sexo: sexo,
        tipo: tipo,
        usuario: usuario,
        reservaid: reservaid);
    firestoreservices.guardarProducto(nuevoProducto);
  }
}
