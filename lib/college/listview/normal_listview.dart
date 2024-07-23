import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Normal_listview extends StatelessWidget {
  const Normal_listview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(100, (index) {
        return Container(
          height: 150,
          width: 200,
          color: Colors.amber,
          margin: EdgeInsets.all(20),
        );
      }),
    );
  }
}
