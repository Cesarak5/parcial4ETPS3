import 'package:flutter/material.dart';

class Bnavigation extends StatefulWidget {
  final Function currentIndex;
  Bnavigation({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<Bnavigation> createState() => _BnavigationState();
}

class _BnavigationState extends State<Bnavigation> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.purple,
      currentIndex: index,
      onTap: (int i) {
        setState(() {
          index = i;
          widget.currentIndex(i);
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Clientes'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Vuelos'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Reservas'),
      ],
    );
  }
}
