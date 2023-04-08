import 'package:flutter/material.dart';
import 'package:new_mathpuzzle/main.dart';
import 'package:new_mathpuzzle/secondpage.dart';

class LevelPage extends StatefulWidget {
  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("kk/background.jpg"), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 40,
              // color: Colors.redAccent.withOpacity(0.5),
              child: Center(
                child: Text(
                  "Select Puzzle",
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 28),
                ),
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.green.withOpacity(0.5),
                child: GridView.builder(
                  itemCount: HomePage.statuslist.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    int level = HomePage.prefs!.getInt("cnt") ?? 0;

                    String levelsttaus = HomePage.statuslist[index];
                    print(levelsttaus);
                    print("index value === ${index} level value===${level}");
                    if (levelsttaus == HomePage.isclear) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            // index++;
                          });
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return SecondPage(index);
                            },

                          ));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("kk/tick.png"),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      );
                    }
                    else if (levelsttaus == HomePage.isskip) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return SecondPage(index);
                            },
                          ));
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "${index + 1}",
                              style: const TextStyle(fontSize: 30),
                            ),
                          ),
                        ),
                      );
                    }
                    else {
                      if (index == level) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                              builder: (context) {
                                return SecondPage(index);
                              },
                            ));
                          },
                          child: Container(
                            child: Center(
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        );
                      }
                      else {
                        return Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("kk/lock.png"),
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
