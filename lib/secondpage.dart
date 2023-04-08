import 'package:flutter/material.dart';
import 'package:new_mathpuzzle/main.dart';
import 'package:new_mathpuzzle/winner_page.dart';

class SecondPage extends StatefulWidget {
  int level;

  SecondPage(int this.level);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onback,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("kk/gameplaybackground.jpg"),
                  fit: BoxFit.fill),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    // color: Colors.blue.withOpacity(0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              HomePage.statuslist[widget.level] =
                                  HomePage.isskip; //to add skip in statuslist
                              HomePage.prefs!.setString("status${widget.level}",
                                  HomePage.isskip); //to store skip level
                              print(HomePage.statuslist);
                              setState(() {
                                widget.level++; // to change images
                              });
                              HomePage.prefs!.setInt(
                                  "cnt", widget.level); // to store level
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return SecondPage(widget.level);
                                },
                              ));
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("kk/skip.png"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("kk/level_board.png"),
                                fit: BoxFit.fill),
                          ),
                          child: Center(
                            child: Text(
                              "Puzzle ${widget.level + 1}",
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 35,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("kk/hint.png"),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                      // color: Colors.green.withOpacity(0.5),
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("kk/p${widget.level + 1}.png"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 9, right: 5, left: 5, bottom: 5),
                    color: Colors.black,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            // color: Colors.orange.withOpacity(0.5),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    alignment: Alignment.centerLeft,
                                    // margin: EdgeInsets.only(top: ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "${value}",
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    // color: Colors.red.withOpacity(0.5),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          value = value.substring(
                                              0, value.length - 1);
                                        });
                                      },
                                      icon: const Center(
                                        child: Icon(
                                          Icons.backspace,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (value ==
                                            HomePage.answerist[widget.level]) {
                                          String level_status =
                                              HomePage.statuslist[widget.level];
                                          if (level_status ==
                                              HomePage.isclear) {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return WinnerPage(widget.level);
                                              },
                                            ));
                                            setState(() {
                                              widget.level++;
                                            });
                                          } else if (level_status ==
                                              HomePage.isskip) {
                                            HomePage.statuslist[widget.level] =
                                                HomePage.isclear;
                                            HomePage.prefs!.setString(
                                                "status${widget.level}",
                                                HomePage.isclear);
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return WinnerPage(widget.level);
                                              },
                                            ));
                                            HomePage.prefs!
                                                .setInt("cnt", widget.level);
                                            setState(() {
                                              widget.level++;
                                            });
                                          } else {
                                            HomePage.statuslist[widget.level] =
                                                HomePage.isskip;
                                            HomePage.prefs!.setString(
                                                "status${widget.level}",
                                                HomePage.isclear);
                                            setState(() {
                                              widget.level++;
                                            });
                                            HomePage.prefs!
                                                .setInt("cnt", widget.level);
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return WinnerPage(widget.level);
                                              },
                                            ));
                                          }
                                        }
                                      });
                                    },
                                    child: Container(
                                      // color: Colors.purple.withOpacity(0.5),
                                      child: const Center(
                                        child: Text(
                                          "SUBMIT",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 3),
                            // color: Colors.yellow.withOpacity(0.5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("1");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "1",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("2");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "2",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("3");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "3",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("4");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "4",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("5");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "5",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("6");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "6",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("7");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "7",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("8");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "8",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("9");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "9",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        getvalue("0");
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[800],
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "0",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                  setState(() {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ));
                  });
                },
                child: Text("yes")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("no"))
          ],
        );
      },
    );
    return Future.value();
  }

  void getvalue(String s) {
    value = value + s;
    print(value);
  }
}
