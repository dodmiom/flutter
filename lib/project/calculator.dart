import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';

late final AppLifecycleListener _listener;

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int x = 0;
  int y = 0;
  int z = 0;
  final displayOnecontroller = TextEditingController();
  final displayTwocontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayOnecontroller.text = x.toString();
    displayTwocontroller.text = y.toString();

    _listener = AppLifecycleListener(
      onShow: _onShow,
      onHide: _onHide,
      onResume: _onResume,
      onDetach: _onDetach,
      onInactive: _onInactive,
      onPause: _onPause,
      onRestart: _onRestart,
    );
  }

  void _onShow() => print("onshow");
  void _onHide() => print("_onHide");
  void _onResume() => print("_onResume");
  void _onDetach() => print("_onDetach");
  void _onInactive() => print("_onInactive");
  void _onPause() => print("_onPause");
  void _onRestart() => print("_onRestart");
  void _onStateChange(AppLifecycleListener states) {
    print("_onStateChanged : $states");
  }

  @override
  void dispose() {
    displayOnecontroller.dispose();
    displayTwocontroller.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            autofocus: true,
            controller: displayOnecontroller,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black87,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black87,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Enter a number",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: displayTwocontroller,
            autofocus: true,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black87,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black87,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Enter a number",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            z.toString(),
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = int.tryParse(displayTwocontroller.text)! +
                        int.tryParse(displayOnecontroller.text)!;
                  });
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = int.tryParse(displayOnecontroller.text)! -
                        int.tryParse(displayTwocontroller.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = int.tryParse(displayOnecontroller.text)! *
                        int.tryParse(displayTwocontroller.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = (int.tryParse(displayOnecontroller.text)! /
                            int.tryParse(displayTwocontroller.text)!)
                        .floor();
                  });
                },
                child: const Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  x = 0;
                  y = 0;
                  z = 0;
                  displayOnecontroller.clear();
                  displayTwocontroller.clear();
                });
              },
              label: const Text("Clear"))
        ],
      ),
    );
  }
}
