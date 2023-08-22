import 'package:flutter/material.dart';

class Frames extends StatefulWidget {
  Frames({Key? key}) : super(key: key);

  @override
  _frame createState() => _frame();
}

class _frame extends State<Frames> {
  TextEditingController? score1 = TextEditingController();
  TextEditingController? score2 = TextEditingController();
  TextEditingController? total = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(
                  score1 != null ? score1!.text : '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Text(
                  score2 != null ? score2!.text : '',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Text(
            total != null ? total!.text : '',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
