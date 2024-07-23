import 'package:day1/project/fire1/fire/home.dart';
import 'package:day1/project/fire1/fire/phonenumberscren.dart';
import 'package:day1/project/fire1/fire/signupscreen.dart';
import 'package:day1/project/fire1/fire/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String name = "";
  bool changeButton = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  void login() {
    setState(() {
      changeButton = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString(), true);
      Navigator.push(context, CupertinoPageRoute(builder: (ctx) => PostHome()));
      setState(() {
        changeButton = false;
      });
    }).catchError((e) {
      // Handle specific FirebaseAuthException errors
      if (e.code == 'user-not-found') {
        debugPrint(e.toString());
        Utils().toastMessage("No user found for that email.", false);
        setState(() {
          changeButton = false;
        });
      } else if (e.code == 'wrong-password') {
        debugPrint(e.toString());
        Utils().toastMessage("Wrong password provided for that user.", false);
        setState(() {
          changeButton = false;
        });
      } else {
        debugPrint(e.toString());
        Utils().toastMessage("System error: ${e.toString()}", false);
        setState(() {
          changeButton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        SystemNavigator.pop();
      },
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset("assets/image/undraw_Unlock_re_a558.png",
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Form(
                  key: _formfield,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: "Email",
                            labelText: "Email",
                            //  helperText: "enter a email",
                            prefixIcon: Icon(Icons.alternate_email)),
                        onChanged: (value) {
                          name = value;
                          setState(() {
                            changeButton = true;
                          });
                        },
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "email cant be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password",
                            // helperText: "enter a password",
                            prefixIcon: Icon(Icons.remove_red_eye_outlined)),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "password cant be empty";
                          } else if (value!.length < 0) {
                            return "Password is short";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextButton(
                          onPressed: () {
                            if (_formfield.currentState!.validate()) {
                              login();
                            }
                          },
                          child: SizedBox(
                            width: 150,
                            height: 30,
                            child: Center(
                              child: changeButton
                                  ? CircularProgressIndicator(
                                      strokeWidth: 3,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Login",
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
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 5, 111, 233)))))),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Create an account"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (ctx) => SignupScreen()));
                                  },
                                  child: Text("Sign up"))
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (ctx) => PhoneNumberScreen()));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: Text("Login With PhoneNumber"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
