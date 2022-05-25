import 'package:flutter/material.dart';
import 'package:isu/screens/hometabbar.dart';
import 'package:isu/screens/info_screen.dart';
import 'package:isu/screens/content_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:isu/screens/quiz_screen.dart';
import 'package:isu/screens/signin_screen.dart';

class LanguagePage extends StatefulWidget {
  var buttonDizi = [];
  LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  late List<bool> isSelected;
  @override
  void initState() {
    isSelected = [false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(45, 112, 153, 1),
        Color.fromRGBO(203, 81, 94, 1),
        Color.fromRGBO(94, 97, 244, 1),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Image.asset(
                'lib/icon_png/logo.png',
              ),
            ),
          ),

          // Vertical structure start

          SizedBox(height: 20), //  void

          // Choose a language to contuniue

          Flexible(
            flex: 2,
            child: Center(
              child: Text(
                'Choose a language to continue!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade200,
                ),
              ),
            ),
          ),

          // Toggle Button structure
          SizedBox(height: 30),
          Flexible(
            flex: 22,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.indigo.shade300,
                        borderRadius: BorderRadius.circular(40)),
                    child: ToggleButtons(
                      color: Colors.white,
                      borderColor: Colors.blue.shade200,
                      fillColor: Colors.transparent,
                      selectedBorderColor: Colors.yellowAccent,
                      borderWidth: 6,
                      selectedColor: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 130),
                          child: Column(
                            children: [
                              Container(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    'lib/icon_png/turkish.png',
                                    scale: 4,
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 130),
                          child: Column(
                            children: [
                              Container(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    'lib/icon_png/english.png',
                                    scale: 4,
                                  )),
                            ],
                          ),
                        ),
                      ],
                      onPressed: (int index) {
                        setState(() {
                          for (int i = 0; i < isSelected.length; i++) {
                            isSelected[i] = i == index;
                          }
                        });
                      },
                      isSelected: isSelected,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /*Flexible(
            flex: 1,
            child: SizedBox(), //  void
          ),*/
          SizedBox(
            height: 10,
          ),

          // Exit and Next Button

          Flexible(
            flex: 4,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(), //  void
                ),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      });
                    },
                    child: Text(
                      'EXIT',
                      style: TextStyle(
                        color: Colors.blue.shade200,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ), // void

                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    onPressed: () {
                      bool selected = false;
                      for (int i = 0; i < isSelected.length; i++) {
                        selected = selected || isSelected[i];
                      }
                      if (selected == false) return;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeTabbar(
                                  screens: [
                                    ContentPage(isSelected[0] ? 'TR' : 'EN'),
                                    QuizPage(isSelected[0] ? 'TR' : 'EN'),
                                    InfoPage(isSelected[0] ? 'TR' : 'EN'),
                                  ],
                                )),
                      );
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(
                        color: Colors.blue.shade200,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(), //void
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
