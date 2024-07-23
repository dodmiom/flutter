import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listview_seperated extends StatelessWidget {
  const Listview_seperated({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 10,
        );
      },
      itemCount: 20,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 200,
          color: Colors.teal,
          margin: EdgeInsets.all(20),
          child: Text("$index"),
        );
      },
    );
  }
}
