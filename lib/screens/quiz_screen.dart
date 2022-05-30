import 'package:flutter/material.dart';
import 'package:isu/quiz_Pages/ColorQuizScreen.dart';
import 'package:isu/quiz_Pages/FamilyQuizScreen.dart';
import 'package:isu/quiz_Pages/FoodQuizScreen.dart';
import 'package:isu/quiz_Pages/HavaQuizScreen.dart';
import 'package:isu/quiz_Pages/NumberQuizScreen.dart';
import 'package:isu/quiz_Pages/RenkQuizScreen.dart';
import 'package:isu/quiz_Pages/TasitQuizScreen.dart';
import 'package:isu/quiz_Pages/VehiceQuizScreen.dart';
import 'package:isu/quiz_Pages/WeatherQuizScreen.dart';



import '../quiz_Pages/AileQuizScreen.dart';
import '../quiz_Pages/SayiQuizScreen.dart';
import '../quiz_Pages/YemekQuizScreen.dart';

class QuizPage extends StatefulWidget {
  String language;
  QuizPage(this.language, {Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState(language == 'EN' ? 0 : 1);
}

class _QuizPageState extends State<QuizPage> {
  int language;

  var food = ['FOOD', 'YEMEK'];
  var color = ['COLOR', 'RENK'];
  var number = ['NUMBER', 'SAYI'];
  var weather = ['WEATHER', 'HAVA'];
  var family = ['FAMILY', 'AİLE'];
  var vehicle = ['VEHICLE', 'TAŞIT'];
  var content = ['QUIZ', 'TEST'];

  _QuizPageState(this.language);

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
                      MaterialPageRoute(builder: (context) => FoodQuizScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => YemekQuizScreen()),
                    );
                  }
                }, 'food.png'),
                MyButton(color[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ColorQuizScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RenkQuizScreen()),
                    );
                  }
                }, 'color.png'),
                MyButton(number[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NumberQuizScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SayiQuizScreen()),
                    );
                  }
                }, 'number.png'),
                MyButton(weather[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WeatherQuizScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HavaQuizScreen()),
                    );
                  }
                }, 'weather.png'),
                MyButton(family[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FamilyQuizScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AileQuizScreen()),
                    );
                  }
                }, 'family.png'),
                MyButton(vehicle[language], () {
                  if (language == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VehicleQuizScreen()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasitQuizScreen()),
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
  }
}
