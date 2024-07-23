import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Builder_listview extends StatelessWidget {
  const Builder_listview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
