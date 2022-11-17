import 'package:flutter/material.dart';
import 'package:parcial4_2514342018/providers/productoProvider.dart';
import 'package:provider/provider.dart';

class EditarProducto extends StatefulWidget {
  EditarProducto({Key? key}) : super(key: key);

  @override
  State<EditarProducto> createState() => _EditarProductoState();
}

class _EditarProductoState extends State<EditarProducto> {
  @override
  Widget build(BuildContext context) {
    final producProvider = Provider.of<ProductosProvider>(context);
    var value;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Editar Producto",
      )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Nombre del producto'),
            onChanged: (value) {
              producProvider.cambioNombre(value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Apellido'),
            onChanged: (value) {
              producProvider.cambioApellido(value);
            },
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text("Guardar"),
              onPressed: () {
                producProvider.guardarProducto();
                Navigator.of(context).pop();
              }),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text("Borrar"),
              onPressed: () {}),
        ]),
      ),
    );
  }
}
