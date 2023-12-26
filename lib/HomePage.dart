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
            )
          ],
        ),
      ),
    );
  }
}

