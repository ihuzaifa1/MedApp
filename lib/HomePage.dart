import 'package:flutter/material.dart';
import 'package:medicare_dart/LoginPage.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [

            SizedBox(height: 15,),
            Align(alignment: Alignment.centerRight,
            child: TextButton(
            onPressed: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context) =>
              // ));
            },
                child: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 20,),),
            ),
            ),


            SizedBox(height: 0,),
            Padding(padding: EdgeInsets.all(0),
              child: Image.asset("assets/images/home.png"),
            ),


            SizedBox(height: 18,),
            Text("MedApp",
            textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.indigo,
              fontSize: 32,
              fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
            ),),


            SizedBox(height: 12,),
            Text("Embark on your journey to wellness with MedApp, where compassionate care meets seamless accessibility. Get started or log in to experience healthcare at your fingertips.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),),



            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),
                      ));
                    },
                    child: Padding(padding: EdgeInsets.symmetric(vertical: 12,horizontal: 35),
                    child: Text(
                      "Doctor",
                      style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),
                      ));
                    },
                    child: Padding(padding: EdgeInsets.symmetric(vertical: 12,horizontal: 35),
                      child: Text(
                        "Patient",
                        style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}

