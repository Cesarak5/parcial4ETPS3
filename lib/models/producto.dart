import 'package:flutter/material.dart';

class Producto {
  final String id;
  final String cedula;
  final String nombre;
  final String apellido;
  final String fechanac;
  final String sexo;
  final String tipo;
  final String usuario;
  final String reservaid;

  Producto(
      {required this.id,
      required this.cedula,
      required this.nombre,
      required this.apellido,
      required this.fechanac,
      required this.sexo,
      required this.tipo,
      required this.usuario,
      required this.reservaid});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cedula': cedula,
      'nombre': nombre,
      'apellido': apellido,
      'fecha_nacimiento': fechanac,
      'sexo': sexo,
      'tipo': tipo,
      'usuario': usuario,
      'id_reserva': reservaid,
    };
  }

  Producto.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        cedula = firestore['cedula'],
        nombre = firestore['nombre'],
        apellido = firestore['apellido'],
        fechanac = firestore['fecha_nacimiento'],
        sexo = firestore['sexo'],
        tipo = firestore['tipo'],
        usuario = firestore['usuario'],
        reservaid = firestore['id_reserva'];
}
