import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medicare_dart/LoginPage.dart';
import 'package:medicare_dart/MainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare_dart/navbar.dart';
import 'package:medicare_dart/utilities/utils.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();

  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 130,
                  height: 160,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            label: Text("Full Name"),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.indigo,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Name";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: phonecontroller,
                          decoration: InputDecoration(
                            label: Text("Phone Number"),
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.indigo,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter phone number";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            label: Text("Email "),
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
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                            label: Text("Password"),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.indigo,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          _auth
                              .createUserWithEmailAndPassword(
                                  email: emailcontroller.text.toString(),
                                  password: passwordcontroller.text.toString())
                              .then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => navbar(),
                                ));
                          }).onError((error, stackTrace) {
                            utils().toastmessage(error.toString());
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 35),
                        child: Center(
                            child: Text(
                          "SignUp",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have An Account.",
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
                              builder: (context) => LoginPage(),
                            ));
                      },
                      child: Text(
                        "Login",
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
