import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Reserva extends StatefulWidget {
  const Reserva({super.key});

  @override
  State<Reserva> createState() => _ReservaState();
}

class _ReservaState extends State<Reserva> {
  // text fields' controllers
  final TextEditingController _idreserva = TextEditingController();
  final TextEditingController _idvuelo = TextEditingController();
  final TextEditingController _estado = TextEditingController();

  final CollectionReference _vuelos =
      FirebaseFirestore.instance.collection('reserva');
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
                  controller: _idreserva,
                  decoration: const InputDecoration(labelText: 'id Reserva'),
                ),
                TextField(
                  controller: _idvuelo,
                  decoration: const InputDecoration(labelText: 'id Vuelo'),
                ),
                TextField(
                  controller: _estado,
                  decoration: const InputDecoration(labelText: 'Estado'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () async {
                    final String reserva = _idreserva.text;
                    final String vuelo = _idvuelo.text;
                    final String estado = _estado.text;
                    if (reserva != null && vuelo != null && estado != null) {
                      await _vuelos.add({
                        "id_reserva": reserva,
                        "id_vuelo": vuelo,
                        "estado": estado,
                      });

                      _idreserva.text = '';
                      _idvuelo.text = '';
                      _estado.text = '';
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
      _idreserva.text = documentSnapshot['cedula'].toString();
      _idvuelo.text = documentSnapshot['nombre'].toString();
      _estado.text = documentSnapshot['apellido'].toString();
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
                  controller: _idreserva,
                  decoration: const InputDecoration(labelText: 'Codigo avion'),
                ),
                TextField(
                  controller: _idvuelo,
                  decoration:
                      const InputDecoration(labelText: 'Disponibilidad'),
                ),
                TextField(
                  controller: _estado,
                  decoration: const InputDecoration(labelText: 'Id Destino'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () async {
                    final String reserva = _idreserva.text;
                    final String vuelo = _idvuelo.text;
                    final String estado = _estado.text;
                    if (reserva != null && vuelo != null && estado != null) {
                      await _vuelos.add({
                        "id_reserva": reserva,
                        "id_vuelo": vuelo,
                        "estado": estado,
                      });

                      _idreserva.text = '';
                      _idvuelo.text = '';
                      _estado.text = '';
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
  Future<void> _delete(String vuelosId) async {
    await _vuelos.doc(vuelosId).delete();

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('El cliente fue eliminado correctamente')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Center(child: Text('Reservas')),
        ),
        body: StreamBuilder(
          stream: _vuelos.snapshots(),
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
                      title: Text("Reserva: " +
                          documentSnapshot['id_reserva'].toString()),
                      subtitle: Text("vuelo: " +
                          documentSnapshot['id_vuelo'].toString() +
                          " - " +
                          "estado: " +
                          documentSnapshot['estado'].toString()),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
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
