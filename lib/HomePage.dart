import 'package:flutter/material.dart';

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
              // ))
            },
                child: Text("Skip",style: TextStyle(color: Colors.black,fontSize: 20,),),
            ),
            ),


            SizedBox(height: 0,),
            Padding(padding: EdgeInsets.all(0),
              child: Image.asset("assets/images/home.png"),
            ),
            SizedBox(height: 50,),
            Text("Embark on your journey to wellness with MedApp, where compassionate care meets seamless accessibility. Get started or log in to experience healthcare at your fingertips.",
            textAlign: TextAlign.justify,
              style: TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
              wordSpacing: 2,
            ),),
          ],
        ),
      ),
    );
  }
}

