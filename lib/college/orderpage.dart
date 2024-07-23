import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final ScrollController _scrollController = ScrollController();

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text("other page"),
      ),
      body: RawScrollbar(
        controller: _scrollController,
        thumbColor: Colors.red,
        trackColor: Colors.grey,
        thumbVisibility: true,
        trackVisibility: true,
        radius: Radius.circular(10),
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.black),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 200,
                  height: 250,
                  color: Colors.blue,
                  child: Column(
                    children: [
                      Text("hfhfhf"),
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  height: 250,
                  color: Colors.red,
                  child: Column(
                    children: [
                      Text("hfhfhf"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Text("hfhfhf"),
      //       IconButton(
      //         icon: Icon(
      //           Icons.backspace,
      //           color: Colors.black,
      //           size: 25,
      //         ),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
