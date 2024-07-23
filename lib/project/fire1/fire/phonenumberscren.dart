import 'package:day1/project/fire1/fire/util.dart';
import 'package:day1/project/fire1/fire/verifyscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({super.key});

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  bool changeButton = false;
  final auth = FirebaseAuth.instance;
  final phonenumberController = TextEditingController();
  void sendOtp() {
    auth.verifyPhoneNumber(
        verificationCompleted: (_) {},
        verificationFailed: (e) {
          Utils().toastMessage(e.toString(), false);
        },
        codeSent: (String verifyId, int? token) {
          Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (ctx) => VerifyOtpScreen(verifyId: verifyId)));
        },
        codeAutoRetrievalTimeout: (e) {
          Utils().toastMessage(e.toString(), false);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 5, 111, 233),
        title: Text(
          "Login",
          style: GoogleFonts.poppins(
            fontSize: 28,
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: phonenumberController,
              decoration: InputDecoration(hintText: "+977 123 456 789"),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {},
                child: SizedBox(
                  width: 150,
                  height: 30,
                  child: Center(
                    child: Text(
                      "Send",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 5, 111, 233)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                                color: Color.fromARGB(255, 5, 111, 233)))))),
          ],
        ),
      ),
    );
  }
}
