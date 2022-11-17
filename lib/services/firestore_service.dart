import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/producto.dart';

class FirestoreServices {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> guardarProducto(Producto producto) async {
    return _db.collection('clientes').doc(producto.id).set(producto.toMap());
  }

  Stream<List<Producto>> getProductos() {
    return _db.collection('productos').snapshots().map((snapshot) => snapshot
        .docs
        .map((documento) => Producto.fromFirestore(documento.data()))
        .toList());
  }
}
