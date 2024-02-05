import 'package:flutter/material.dart';
import 'package:medicare_dart/MainPage.dart';
import 'package:medicare_dart/SignUpPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare_dart/utilities/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passToggle = true;

  final _formkey = GlobalKey<FormState>();

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset("assets/images/spl.png"),
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Enter your Email"),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.indigo,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: passToggle ? true : false,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Enter your Password"),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.indigo,
                              ),
                              suffixIcon: InkWell(
                                onTap: () {
                                  if (passToggle == true) {
                                    passToggle = false;
                                  } else {
                                    passToggle = true;
                                  }
                                  setState(() {});
                                },
                                child: passToggle
                                    ? Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.indigo,
                                      )
                                    : Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.indigo,
                                      ),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 23,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          _auth
                              .signInWithEmailAndPassword(
                                  email: emailcontroller.text.toString(),
                                  password: passwordcontroller.text.toString())
                              .then((value) {
                            utils().toastmessage(value.user!.email.toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ));
                          }).onError((error, stackTrace) {
                            debugPrint(error.toString());
                            utils().toastmessage(error.toString());
                          });
                        }
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 35),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't Have Any Account?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
