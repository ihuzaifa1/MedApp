import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medicare_dart/LoginPage.dart';

class profile extends StatefulWidget{
  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context){
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 37.0 ,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Profile",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(height: 28,),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Icon(Icons.person,color: Colors.indigo,),
              ),
              title: Text("Huzaifa",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500
              ),
              ),
              subtitle: Text("Profile"),
            ),
            Divider(height: 50,),
            ListTile(
              onTap: (){},
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  shape: BoxShape.circle
                ),
                child: Icon(Icons.info_outline_rounded,
                color: Colors.orange,
                size: 35,),
              ),
              title: Text("About us",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20
              ),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 30,),
            ListTile(
              onTap: (){},
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                    shape: BoxShape.circle
                ),
                child: Icon(Icons.notifications,
                  color: Colors.purple,
                  size: 35,),
              ),
              title: Text("Notification",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                ),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 30,),
            ListTile(
              onTap: (){},
              leading: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    shape: BoxShape.circle
                ),
                child: Icon(Icons.settings,
                  color: Colors.green,
                  size: 35,),
              ),
              title: Text("Settings",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20
                ),),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            SizedBox(height: 30,),
            Material(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: (){
                  auth.signOut().then((value){
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => LoginPage()));
                  });
                },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5,),
                child: Center(
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ),

            )

          ],
        ),
      ),
    );
  }
}