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
  int? score = 10, ant = 0, pont;
  int? selectedButton;
  bool jogada1 = true;
  int frameAt = 0, cal = 0;
  List<Frames> frames = List.generate(9, (index) => Frames(key: UniqueKey()));
  List<String?> score1Values = List.generate(9, (index) => null);
  List<String?> score2Values = List.generate(9, (index) => null);
  List<String?> total = List.generate(9, (index) => null);
  late List<Widget> pontosButtons;

  void setPonto(bool isJogada1, int valor) {
    setState(() {
      if (isJogada1) {
        ant = valor;
        score1Values[frameAt] = valor.toString();
        jogada1 = false;
      } else {
        int cal;
        cal = (ant! + valor);

        ant = 0;
        score2Values[frameAt] = valor.toString();
        total[frameAt] = cal.toString();
        frameAt++;
        jogada1 = true;
        score = 10;
        pontos();
      }
    });
  }

  void setStrike() {
    print("Strike");
  }

  void setSpare() {
    print("Spare");
    score2Values[frameAt] = "/";
    score = 10;
    pontos();
    cal = (selectedButton! + 10);
    total[frameAt] = cal.toString();
    jogada1 = true;
    frameAt++;
  }

  List<Widget> criarBotoes() {
    List<Widget> botoes = [];

    for (int i = 0; i <= score!; i++) {
      botoes.add(
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedButton = i;
              print("Valor de selectedButton: $selectedButton");
              pontos();
            });
          },
          style: ButtonStyle(
            backgroundColor: selectedButton == i
                ? MaterialStateProperty.all(Colors.green)
                : null,
          ),
          child: Text(i.toString()),
        ),
      );
    }

    return botoes;
  }

  void pontos() {
    setState(() {
      pontosButtons = criarBotoes();
    });
  }

  @override
  void initState() {
    super.initState();
    pontosButtons = criarBotoes();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Row(
              children: frames.map((frame) {
                int index = frames.indexOf(frame);
                return Expanded(
                  child: Frames(
                    key: UniqueKey(),
                    score1Value: score1Values[index],
                    score2Value: score2Values[index],
                    total: total[index],
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pontosButtons,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (ant! < 10) {
                    print("$ant");
                    if (cal == 10) {
                      setSpare();
                    } else {
                      score = score! - selectedButton!;
                      pontos();
                      setPonto(jogada1, selectedButton!);
                    }
                  } else {
                    setStrike();
                  }
                });
              },
              child: Text("Jogar"),
            ),
          ],
        ),
      ],
    );
  }
}
