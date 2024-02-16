import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class chatbot extends StatefulWidget{

  @override
  State<chatbot> createState() => _chatbotState();
}

class _chatbotState extends State<chatbot> {
  ChatUser myself = ChatUser( id: '1',firstName: 'Huzaifa');

  ChatUser bot = ChatUser( id: '2',firstName: 'Medbot');

  List<ChatMessage> allMessages = [];

  final oururl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key= AIzaSyAYsXoXzWPHKQIN-BxADHAfye0pJeNFUtw';
  final header = {
    'Content-Type': 'application/json'
  };


  getdata(ChatMessage m) async{
    allMessages.insert(0, m);
    setState((){}
    );
    var data = {{"contents":[{"parts":[{"text":m.text}]}]}};
    await http.post(Uri.parse(oururl),headers: header,body: jsonEncode(data))
    .then((value){
      if(value.statusCode==200){
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage m1 = ChatMessage(
            user: bot,
            createdAt: DateTime.now());
        allMessages.insert(0, m1);
        setState(() {

        });
      }else{
        print("error occured");
      }
    }).catchError((e){});
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: DashChat(
          currentUser: myself,
          onSend: (ChatMessage m){
            getdata(m);
          },
          messages: allMessages),
    );
  }

}
