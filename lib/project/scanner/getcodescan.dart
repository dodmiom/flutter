import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class Getscancode extends StatefulWidget {
  const Getscancode({super.key});

  @override
  State<Getscancode> createState() => _GetscancodeState();
}

class _GetscancodeState extends State<Getscancode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Qr Code"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/scanner/generate");
              },
              icon: Icon(Icons.qr_code))
        ],
      ),
      body: SizedBox(
        width: 100,
        height: 200,
        child: MobileScanner(
          controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates),
          onDetect: (capture) {
            final List<Barcode> barcodes = capture.barcodes;
            final Uint8List? image = capture.image;
            for (final barcode in barcodes) {
              print("found: ${barcode.rawValue}");
            }
            if (image != null) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        barcodes.first.rawValue ?? "",
                      ),
                      content: Image(
                        image: MemoryImage(image),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
