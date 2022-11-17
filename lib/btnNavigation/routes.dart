import 'package:flutter/material.dart';
import 'package:parcial4_2514342018/pantallas/principal.dart';
import 'package:parcial4_2514342018/pantallas/reservas.dart';
import 'package:parcial4_2514342018/pantallas/vuelos.dart';

class Routes extends StatelessWidget {
  final int index;
  const Routes({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> myList = [
      const Principal(),
      const Vuelos(),
      const Reserva(),
    ];
    return myList[index];
  }
}
