import 'dart:io';

import 'package:flutter/material.dart';
import 'package:new_mathpuzzle/levelpage.dart';
import 'package:new_mathpuzzle/main.dart';
import 'package:new_mathpuzzle/secondpage.dart';

class WinnerPage extends StatefulWidget {
  int level;

  WinnerPage(this.level);

  @override
  State<WinnerPage> createState() => _WinnerPageState();
}

class _WinnerPageState extends State<WinnerPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onback,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("kk/background.jpg"), fit: BoxFit.fill),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
// color: Colors.redAccent.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      "Puzzle ${widget.level} Completed",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.blue[900]),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
// color: Colors.blue.withOpacity(0.5),
                    image: DecorationImage(
                      image: AssetImage("kk/trophy.png"),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return SecondPage(widget.level);
                      },
                    ));
                  });
                },
                child: Container(
                  width: 180,
                  height: 47,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    gradient: const LinearGradient(
                      colors: [Colors.grey, Colors.blue],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ));
                  },
                  child: Container(
                    width: 180,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      gradient: const LinearGradient(
                        colors: [Colors.grey, Colors.blue],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "MAIN MENU",
                        style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 180,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  gradient: const LinearGradient(
                    colors: [Colors.grey, Colors.blue],
                  ),
                ),
                child: const Center(
                  child: Text(
                    "BUY PRO",
                    style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              Container(
                // color: Colors.blue.withOpacity(0.5),
                child: Center(
                  child: Text(
                    "SHARE THIS PUZZLE",
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  // color: Colors.purple.withOpacity(0.5),
                  child: IconButton(
                    alignment: Alignment.topCenter,
                    onPressed: () {},
                    icon: const Icon(Icons.share, size: 35),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onback() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you want to exit"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                exit(0);
              },
              child: Text("yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("no"),
            ),
          ],
        );
      },
    );

    return Future.value();
  }
}
