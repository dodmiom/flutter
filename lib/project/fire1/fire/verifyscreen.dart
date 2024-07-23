import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String verifyId;
  const VerifyOtpScreen({super.key, required this.verifyId});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 5, 111, 233),
        title: Text(
          "Verify Otp",
          style: GoogleFonts.poppins(
            fontSize: 28,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
