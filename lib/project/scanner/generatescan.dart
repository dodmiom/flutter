import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class Generatescancode extends StatefulWidget {
  const Generatescancode({super.key});

  @override
  State<Generatescancode> createState() => _GeneratescancodeState();
}

class _GeneratescancodeState extends State<Generatescancode> {
  String? qrData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scan Qr Code"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/generate");
                },
                icon: Icon(Icons.qr_code))
          ],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onSubmitted: (value) {
                setState(() {
                  qrData = value;
                });
              },
            ),
            if (qrData != null)
              SizedBox(
                width: 200,
                height: 200,
                child: PrettyQrView.data(
                  data: qrData!,
                ),
              )
          ],
        )));
  }
}
