import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastMessage(String message, bool Success) {
    Fluttertoast.showToast(
        webPosition: "right",
        webBgColor: Success
            ? "linear-gradient(to right, #2af709, #2af709)"
            : "linear-gradient(to right, #dc1c13, #dc1c13)",
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: Success
            ? const Color.fromARGB(255, 12, 226, 19)
            : const Color.fromARGB(255, 247, 25, 9),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
