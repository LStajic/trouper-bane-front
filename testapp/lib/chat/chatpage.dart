// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/chat/direct.dart';

class ChatStartPage extends StatefulWidget {
  const ChatStartPage({Key? key}) : super(key: key);

  @override
  _ChatStartPageState createState() => _ChatStartPageState();
}

class _ChatStartPageState extends State<ChatStartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(children: [
        Container(),
        ListView.builder(
            itemCount: null,
            itemBuilder: ((context, index) {
              return chatTile();
            }))
      ]),
    );
  }
}

Widget chatTile() {
  return InkWell(
    onTap: () => Get.to(ChatDirect()),
    child: ListTile(
      contentPadding: EdgeInsets.only(top: 24,bottom: 24,right: 16,left: 8),


      //slika i prepoznavanje tipa razgovora

      leading: IconButton(onPressed: null, icon: Icon(Icons.ac_unit),iconSize: 40,),


      //osnovne informacije o poslednjoj poruci

      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Brat Moi",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
          Text("Kozarska brigada krece preko Save",style: TextStyle(fontSize: 20)),
        ],
      ),
      trailing: Text("18:15"),
    ),
  );
}
