import 'package:atividade_2/frames/frame.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pontuador boliche",
      home: Scaffold(
        body: Center(
          child: Boliche(),
        ),
      ),
    );
  }
}

class Boliche extends StatefulWidget {
  @override
  _BolichePont createState() => _BolichePont();
}

class _BolichePont extends State<Boliche> {
  late int ant;
  List<Frames> frames = List.generate(9, (index) => Frames(key: UniqueKey()));
  void verifica() {}

  void pontos() {}

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          children: frames.map((frame) => Expanded(child: frame)).toList(),
        ),
      ],
    );
  }
}
