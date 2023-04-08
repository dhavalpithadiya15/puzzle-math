import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_mathpuzzle/levelpage.dart';
import 'package:new_mathpuzzle/secondpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
  static SharedPreferences? prefs;
  static String isclear = "clear";
  static String isskip = "skip";
  static String ispending = "pending";
  static List statuslist = [];
  static List<String> answerist = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10"
  ];
}

class _HomePageState extends State<HomePage> {
  int? level;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forprefrence();
  }

  forprefrence() async {
    HomePage.prefs = await SharedPreferences.getInstance();
    level = HomePage.prefs!.getInt("cnt") ?? 0;
    HomePage.statuslist.clear();
    for (int i = 0; i <= 75; i++) {
      String level_status =
          HomePage.prefs!.getString("status$i") ?? HomePage.ispending;
      HomePage.statuslist.add(level_status);
      print(HomePage.statuslist);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("kk/background.jpg"), fit: BoxFit.fill),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Math Puzzle",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("kk/blackboard_main_menu.png"),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return SecondPage(level!);
                        },
                      ));
                    },
                    child: Container(
                      child: const Text(
                        "Continue",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return LevelPage();
                        },
                      ));
                    },
                    child: Container(
                      child: const Text(
                        "Puzzle",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
