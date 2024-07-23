import 'package:day1/college/listview/builder_listview.dart';
import 'package:day1/college/listview/listview_seperated.dart';
import 'package:day1/college/listview/normal_listview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MylistView extends StatefulWidget {
  const MylistView({super.key});

  @override
  State<MylistView> createState() => _MylistViewState();
}

class _MylistViewState extends State<MylistView> {
  String title = "Normal listview";
  Widget listwidget = Normal_listview();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              OutlinedButton(
                  onPressed: () {
                    title = "Normal listview";
                    listwidget = Normal_listview();
                    setState(() {});
                  },
                  child: Text("Normal Listview")),
              OutlinedButton(
                  onPressed: () {
                    title = "builder listview";
                    listwidget = Builder_listview();
                    setState(() {});
                  },
                  child: Text("Listview Builder")),
              OutlinedButton(
                  onPressed: () {
                    title = "seperate listview";
                    listwidget = Listview_seperated();
                    setState(() {});
                  },
                  child: Text("Listview seperated")),
              OutlinedButton(onPressed: () {}, child: Text("Listview custom")),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(top: 100, child: Text(title)),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: listwidget,
          )
        ],
      ),
    );
  }
}
