import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Vuelos extends StatefulWidget {
  const Vuelos({super.key});

  @override
  State<Vuelos> createState() => _VuelosState();
}

class _VuelosState extends State<Vuelos> {
  // text fields' controllers
  final TextEditingController _codavion = TextEditingController();
  final TextEditingController _disponibilidad = TextEditingController();
  final TextEditingController _iddestino = TextEditingController();
  final TextEditingController _idvuelo = TextEditingController();
  final TextEditingController _tipovuelo = TextEditingController();

  final CollectionReference _vuelos =
      FirebaseFirestore.instance.collection('vuelos');
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
                  controller: _codavion,
                  decoration: const InputDecoration(labelText: 'Cedula'),
                ),
                TextField(
                  controller: _disponibilidad,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: _iddestino,
                  decoration: const InputDecoration(labelText: 'Apellido'),
                ),
                TextField(
                  controller: _idvuelo,
                  decoration:
                      const InputDecoration(labelText: 'Fecha de nacimiento'),
                ),
                TextField(
                  controller: _tipovuelo,
                  decoration: const InputDecoration(labelText: 'Sexo'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Crear'),
                  onPressed: () async {
                    final String avion = _codavion.text;
                    final String disponibilidad = _disponibilidad.text;
                    final String destino = _iddestino.text;
                    final String idvuelo = _idvuelo.text;
                    final String tipovuelo = _tipovuelo.text;
                    if (avion != null &&
                        disponibilidad != null &&
                        destino != null &&
                        idvuelo != null &&
                        tipovuelo != null) {
                      await _vuelos.add({
                        "cod_avion": avion,
                        "disponibilidad": disponibilidad,
                        "id_destino": destino,
                        "id_vuelo": idvuelo,
                        "tipo_vuelo": tipovuelo,
                      });

                      _codavion.text = '';
                      _disponibilidad.text = '';
                      _iddestino.text = '';
                      _idvuelo.text = '';
                      _tipovuelo.text = '';
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
      _codavion.text = documentSnapshot['cedula'].toString();
      _disponibilidad.text = documentSnapshot['nombre'].toString();
      _iddestino.text = documentSnapshot['apellido'].toString();
      _idvuelo.text = documentSnapshot['fecha_nacimiento'].toString();
      _tipovuelo.text = documentSnapshot['sexo'].toString();
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
                  controller: _codavion,
                  decoration: const InputDecoration(labelText: 'Codigo avion'),
                ),
                TextField(
                  controller: _disponibilidad,
                  decoration:
                      const InputDecoration(labelText: 'Disponibilidad'),
                ),
                TextField(
                  controller: _iddestino,
                  decoration: const InputDecoration(labelText: 'Id Destino'),
                ),
                TextField(
                  controller: _idvuelo,
                  decoration: const InputDecoration(labelText: 'id Vuelo'),
                ),
                TextField(
                  controller: _tipovuelo,
                  decoration: const InputDecoration(labelText: 'Tipo Vuelo'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String avion = _codavion.text;
                    final String disponibilidad = _disponibilidad.text;
                    final String destino = _iddestino.text;
                    final String idvuelo = _idvuelo.text;
                    final String tipovuelo = _tipovuelo.text;
                    if (avion != null &&
                        disponibilidad != null &&
                        destino != null &&
                        idvuelo != null &&
                        tipovuelo != null) {
                      await _vuelos.add({
                        "cod_avion": avion,
                        "disponibilidad": disponibilidad,
                        "id_destino": destino,
                        "id_vuelo": idvuelo,
                        "tipo_vuelo": tipovuelo,
                      });

                      _codavion.text = '';
                      _disponibilidad.text = '';
                      _iddestino.text = '';
                      _idvuelo.text = '';
                      _tipovuelo.text = '';
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
          title: const Center(child: Text('Vuelos')),
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
                      title: Text(
                          "Vuelo: " + documentSnapshot['id_vuelo'].toString()),
                      subtitle: Text("Destino: " +
                          documentSnapshot['id_destino'].toString() +
                          " - " +
                          "Disponibilidad: " +
                          documentSnapshot['disponibilidad'].toString() +
                          " - " +
                          "Tipo de vuelo: " +
                          documentSnapshot['tipo_vuelo'].toString()),
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
