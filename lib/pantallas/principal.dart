import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  // text fields' controllers
  final TextEditingController _cedulaController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoController = TextEditingController();
  final TextEditingController _fechanacController = TextEditingController();
  final TextEditingController _sexoController = TextEditingController();
  final TextEditingController _tipoController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _reservaidController = TextEditingController();

  final CollectionReference _clientes =
      FirebaseFirestore.instance.collection('clientes');
//insertar producto
  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _cedulaController,
                  decoration: const InputDecoration(labelText: 'Cedula'),
                ),
                TextField(
                  controller: _nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: _apellidoController,
                  decoration: const InputDecoration(labelText: 'Apellido'),
                ),
                TextField(
                  controller: _fechanacController,
                  decoration:
                      const InputDecoration(labelText: 'Fecha de nacimiento'),
                ),
                TextField(
                  controller: _sexoController,
                  decoration: const InputDecoration(labelText: 'Sexo'),
                ),
                TextField(
                  controller: _tipoController,
                  decoration: const InputDecoration(labelText: 'Tipo Cliente'),
                ),
                TextField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                ),
                TextField(
                  controller: _reservaidController,
                  decoration: const InputDecoration(
                    labelText: 'Id Reserva',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () async {
                    final String cedula = _cedulaController.text;
                    final String nombre = _nombreController.text;
                    final String apellido = _apellidoController.text;
                    final String fechanacimiento = _fechanacController.text;
                    final String sexo = _sexoController.text;
                    final String tipo = _tipoController.text;
                    final String usuario = _usuarioController.text;
                    final String idreserva = _reservaidController.text;
                    if (cedula != null &&
                        nombre != null &&
                        apellido != null &&
                        fechanacimiento != null &&
                        sexo != null &&
                        tipo != null &&
                        usuario != null &&
                        idreserva != null) {
                      await _clientes.add({
                        "cedula": cedula,
                        "nombre": nombre,
                        "apellido": apellido,
                        "fecha_nacimiento": fechanacimiento,
                        "sexo": sexo,
                        "tipo": tipo,
                        "usuario": usuario,
                        "id_reserva": idreserva
                      });

                      _cedulaController.text = '';
                      _nombreController.text = '';
                      _apellidoController.text = '';
                      _fechanacController.text = '';
                      _sexoController.text = '';
                      _tipoController.text = '';
                      _usuarioController.text = '';
                      _reservaidController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }
//actualizar poducto

  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _cedulaController.text = documentSnapshot['cedula'].toString();
      _nombreController.text = documentSnapshot['nombre'].toString();
      _apellidoController.text = documentSnapshot['apellido'].toString();
      _fechanacController.text =
          documentSnapshot['fecha_nacimiento'].toString();
      _sexoController.text = documentSnapshot['sexo'].toString();
      _tipoController.text = documentSnapshot['tipo'].toString();
      _usuarioController.text = documentSnapshot['usuario'].toString();
      _reservaidController.text = documentSnapshot['id_reserva'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _cedulaController,
                  decoration: const InputDecoration(labelText: 'Cedula'),
                ),
                TextField(
                  controller: _nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: _apellidoController,
                  decoration: const InputDecoration(labelText: 'Apellido'),
                ),
                TextField(
                  controller: _fechanacController,
                  decoration:
                      const InputDecoration(labelText: 'Fecha de nacimiento'),
                ),
                TextField(
                  controller: _sexoController,
                  decoration: const InputDecoration(labelText: 'Sexo'),
                ),
                TextField(
                  controller: _tipoController,
                  decoration: const InputDecoration(labelText: 'Tipo Cliente'),
                ),
                TextField(
                  controller: _usuarioController,
                  decoration: const InputDecoration(labelText: 'Usuario'),
                ),
                TextField(
                  controller: _reservaidController,
                  decoration: const InputDecoration(
                    labelText: 'Id Reserva',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String cedula = _cedulaController.text;
                    final String nombre = _nombreController.text;
                    final String apellido = _apellidoController.text;
                    final String fechanacimiento = _fechanacController.text;
                    final String sexo = _sexoController.text;
                    final String tipo = _tipoController.text;
                    final String usuario = _usuarioController.text;
                    final String idreserva = _reservaidController.text;
                    if (cedula != null &&
                        nombre != null &&
                        apellido != null &&
                        fechanacimiento != null &&
                        sexo != null &&
                        tipo != null &&
                        usuario != null &&
                        idreserva != null) {
                      await _clientes.add({
                        "cedula": cedula,
                        "nombre": nombre,
                        "apellido": apellido,
                        "fecha_nacimiento": fechanacimiento,
                        "sexo": sexo,
                        "tipo": tipo,
                        "usuario": usuario,
                        "id_reserva": idreserva
                      });

                      _cedulaController.text = '';
                      _nombreController.text = '';
                      _apellidoController.text = '';
                      _fechanacController.text = '';
                      _sexoController.text = '';
                      _tipoController.text = '';
                      _usuarioController.text = '';
                      _reservaidController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

//borrar productos
  Future<void> _delete(String clientesId) async {
    await _clientes.doc(clientesId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('El cliente fue eliminado correctamente')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Center(child: Text('Clientes')),
        ),
        body: StreamBuilder(
          stream: _clientes.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text("Cliente: " +
                          documentSnapshot['nombre'].toString() +
                          " " +
                          documentSnapshot['apellido'].toString()),
                      subtitle: Text("Sexo: " +
                          documentSnapshot['sexo'].toString() +
                          " - " +
                          "tipo cliente: " +
                          documentSnapshot['tipo'].toString() +
                          " - " +
                          "reserva:" +
                          documentSnapshot['id_reserva'].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () => _update(documentSnapshot)),
                            IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => _delete(documentSnapshot.id)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
// agregar productos
        floatingActionButton: FloatingActionButton(
          onPressed: () => _create(),
          child: const Icon(Icons.add),
          backgroundColor: Colors.purple,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
