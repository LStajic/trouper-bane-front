// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/chat/chatpage.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final Future<String> _calculation = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  List<bool> hver = [false, false, false];
  double op = 0;
  Alignment al = Alignment.topCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // AnimatedPositioned(
        //   top: MediaQuery.of(context).size.height * 0.9,
        //   left: MediaQuery.of(context).size.width * 0.025,
        //   right: MediaQuery.of(context).size.width * (1 - 0.025 - 0.3),
        //   bottom: 0,
        //   child: Container(
        //   decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
        // ), duration: Duration(seconds: 1)),
        Positioned.fill(
          top: MediaQuery.of(context).size.height * 0.75,
          child: Row(
            children: [
              Spacer(),
              MouseRegion(
                onEnter: (PointerEvent details) => setState(() {
                  hver[0] = true;
                }),
                onExit: (PointerEvent details) => setState(() {
                  hver[0] = false;
                }),
                child: GestureDetector(
                  onTap: () => Get.to(ChatStartPage()),
                  child: AnimatedContainer(
                    width: (hver[0])
                        ? MediaQuery.of(context).size.width * 0.32
                        : MediaQuery.of(context).size.width * 0.3,
                    height: (hver[0])
                        ? MediaQuery.of(context).size.height * 0.22
                        : MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(border: Border.all(
                      width: (hver[0]) ? 4 : 1
                    )),
                    duration: Duration(milliseconds: 200),
                    child: Center(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.chat,size: 80,),
                      Text(
                        "Chat",
                        style: TextStyle(fontSize: 30),
                      )
                    ],)),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              MouseRegion(
                onEnter: (PointerEvent details) => setState(() {
                  hver[1] = true;
                }),
                onExit: (PointerEvent details) => setState(() {
                  hver[1] = false;
                }),
                child: GestureDetector(
                  onTap: () => null,
                  child: AnimatedContainer(
                    width: (hver[1])
                        ? MediaQuery.of(context).size.width * 0.32
                        : MediaQuery.of(context).size.width * 0.3,
                    height: (hver[1])
                        ? MediaQuery.of(context).size.height * 0.22
                        : MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(border: Border.all(
                      width: (hver[1]) ? 4 : 1
                    )),
                    duration: Duration(milliseconds: 200),
                    child: Center(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.mail,size: 80,),
                      Text(
                        "Memo",
                        style: TextStyle(fontSize: 30),
                      )
                    ],)),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              MouseRegion(
                onEnter: (PointerEvent details) => setState(() {
                  hver[2] = true;
                }),
                onExit: (PointerEvent details) => setState(() {
                  hver[2] = false;
                }),
                child: GestureDetector(
                  onTap: () => null,
                  child: AnimatedContainer(
                    width: (hver[2])
                        ? MediaQuery.of(context).size.width * 0.32
                        : MediaQuery.of(context).size.width * 0.3,
                    height: (hver[2])
                        ? MediaQuery.of(context).size.height * 0.22
                        : MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(border: Border.all(
                      width: (hver[2]) ? 4 : 1
                    ),),
                    duration: Duration(milliseconds: 200),
                    child: Center(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.photo,size: 80,),
                      Text(
                        "Images",
                        style: TextStyle(fontSize: 30),
                      )
                    ],)),
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        ),
        FutureBuilder<String>(
          future: _calculation,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return AnimatedOpacity(
                opacity: (snapshot.hasData) ? 1 : 0,
                duration: Duration(seconds: 3),
                curve: Curves.decelerate,
                child: AnimatedAlign(
                  alignment: (snapshot.hasData)
                      ? Alignment.center
                      : Alignment.topCenter,
                  duration: const Duration(seconds: 2),
                  curve: Curves.decelerate,
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(fontSize: 50),
                  ),
                ));
          },
        ),
      ],
    ));
  }
}
