import 'package:parcial4_2514342018/providers/productoProvider.dart';
import 'package:flutter/material.dart';
import 'package:parcial4_2514342018/pantallas/editar.dart';
import 'package:provider/provider.dart';
import 'package:parcial4_2514342018/models/producto.dart';

class Productos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final clientes = Provider.of<List<ProductosProvider>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Clientes",
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditarProducto()));
              },
            )
          ],
        ),
        body: clientes != null
            ? ListView.builder(
                itemCount: clientes.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(clientes[index].nombre),
                    trailing: Text(clientes[index].id),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditarProducto()));
                    },
                  );
                }))
            : Center(child: CircularProgressIndicator()));
  }
}
