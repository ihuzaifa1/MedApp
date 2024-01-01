import 'package:flutter/material.dart';
import 'package:medicare_dart/MainPage.dart';
import 'package:medicare_dart/SignUpPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [

              SizedBox(height: 10,),
              Padding(padding: EdgeInsets.all(20),
              child: Image.asset("assets/images/spl.png"),
              ),

              SizedBox(height: 15,),
              Padding(padding: EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Enter your Email"),
                  prefixIcon: Icon(Icons.email,color: Colors.indigo,),
                ),
              ),
              ),
              Padding(padding: EdgeInsets.all(15),
                child: TextField(
                  obscureText: passToggle ? true : false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Enter your Password"),
                    prefixIcon: Icon(Icons.lock,color: Colors.indigo,),
                    suffixIcon: InkWell(
                      onTap: (){
                        if(passToggle == true){
                          passToggle = false;
                        }
                        else{
                          passToggle = true;
                        }
                        setState(() {

                        });
                      },
                      child: passToggle ? Icon(Icons.remove_red_eye,color: Colors.indigo,)
                          : Icon(Icons.remove_red_eye_outlined,color: Colors.indigo,),
                    )
                  ),
                ),
              ),
              SizedBox(height: 23,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: double.infinity,
                  child: Material(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
                            ));
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

              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't Have Any Account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,

                  ),),
                  TextButton(onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ));
                  }, child: Text("Create Account",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),))
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}
