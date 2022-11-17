import 'package:firebase_core/firebase_core.dart';
import 'package:parcial4_2514342018/btnNavigation/bottom_Nav.dart';
import 'package:parcial4_2514342018/btnNavigation/routes.dart';
import 'package:parcial4_2514342018/pantallas/principal.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(parcial4());
}

class parcial4 extends StatelessWidget {
  const parcial4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Firestore',
      home: HomePage(), //Principal(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  Bnavigation? myBNB;

  @override
  void initState() {
    myBNB = Bnavigation(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myBNB,
      body: Routes(index: index),
    );
  }
}
