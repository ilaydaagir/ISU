import 'package:flutter/material.dart';
import 'package:isu/subject_Pages/AileSubjectScreen.dart';
import 'package:isu/subject_Pages/ColorSubjectScreen.dart';
import 'package:isu/subject_Pages/FamilySubjectScreen.dart';
import 'package:isu/subject_Pages/FoodSubjectScreen.dart';
import 'package:isu/subject_Pages/HavaSubjectScreen.dart';
import 'package:isu/subject_Pages/NumberSubjectScreen.dart';
import 'package:isu/subject_Pages/SayiSubjectScreen.dart';
import 'package:isu/subject_Pages/TasitSubjectScreen.dart';
import 'package:isu/subject_Pages/VehicleSubjectScreen.dart';
import 'package:isu/subject_Pages/WeatherSubjectScreen.dart';
import 'package:isu/subject_Pages/YemekSubjectScreen.dart';


import '../subject_Pages/RenkSubjectScreen.dart';

class ContentPage extends StatefulWidget {
  String language;
  ContentPage(this.language, {Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() =>
      _ContentPageState(language == 'EN' ? 0 : 1);
}

class _ContentPageState extends State<ContentPage> {
  int language;

  var food = ['FOOD', 'YEMEK'];
  var color = ['COLOR', 'RENK'];
  var number = ['NUMBER', 'SAYI'];
  var weather = ['WEATHER', 'HAVA'];
  var family = ['FAMILY', 'AİLE'];
  var vehicle = ['VEHICLE', 'TAŞIT'];
  var content = ['CONTENTS', 'İÇERİK'];

  _ContentPageState(this.language);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(94, 97, 244, 1),
            Color.fromRGBO(203, 81, 94, 1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'lib/icon_png/logo.png',
            scale: MediaQuery.of(context).size.height * 0.01,
          ),
          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          backgroundColor: Color.fromRGBO(94, 97, 244, 1),
        ),
        backgroundColor: Colors.transparent,
        body: Column(children: [
          // Vertical structure start

          SizedBox(
              height: MediaQuery.of(context).size.height * 0.05), // first void

          // CONTENTS

          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  border: Border.all(color: Colors.indigo.shade300, width: 5),
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  content[language],
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo.shade900,
                    //fontStyle: FontStyle.
                  ),
                ),
              ),
            ),
          ),

          SizedBox(
              height: MediaQuery.of(context).size.height * 0.03), // second void

          // Grid structure

          SizedBox(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 2.5)),
              children: [
                MyButton(food[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FoodSubjectScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YemekSubjectScreen()),
                    );
                  }
                }, 'food.png'),
                MyButton(color[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ColorSubjectScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RenkSubjectScreen()),
                    );
                  }
                }, 'color.png'),
                MyButton(number[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NumberSubjectScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SayiSubjectScreen()),
                    );
                  }
                }, 'number.png'),
                MyButton(weather[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WeatherSubjectScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HavaSubjectScreen()),
                    );
                  }
                }, 'weather.png'),
                MyButton(family[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FamilySubjectScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AileSubjectScreen()),
                    );
                  }
                }, 'family.png'),
                MyButton(vehicle[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VehicleSubjectScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasitSubjectScreen()),
                    );
                  }
                }, 'car.png'),
              ],
            ),
            //height: 500,
            height: MediaQuery.of(context).size.height * 0.6,
          ),
        ]),
      ),
    );
  }
}

//--------------------------------------------------------------------
//------------ MyButton Class ----------------------------------------

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final String png;
  const MyButton(this.text, this.onPressed, this.png);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: ElevatedButton.icon(
        icon: Image.asset(
          'lib/icon_png/' + png,
          scale: 7,
        ),
        label: Text(
          text,
          style: TextStyle(
            color: Colors.indigo.shade800,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.indigo.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }}