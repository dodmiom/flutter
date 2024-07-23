import 'package:day1/project/fire1/fire/loginscreen.dart';
import 'package:day1/project/fire1/fire/util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  String name = "";
  bool changeButton = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signup() {
    setState(() {
      changeButton = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage("Account Created", true);
      setState(() {
        changeButton = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString(), false);
      setState(() {
        changeButton = false;
      });
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
          "Sign Up",
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
              "Create An Account",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
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
                          if (_formfield.currentState!.validate()) {}
                          signup();
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
                                    "Sign Up",
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
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color:
                                            Color.fromARGB(255, 5, 111, 233)))))),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account"),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (ctx) => LoginScreen()));
                                },
                                child: Text("Login"))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
