import 'dart:collection';
import 'package:flutter/material.dart';

import '../Wordsdao.dart';
import '../screens/Words.dart';

class FoodSubjectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FoodSubjectScreenBody();
  }
}

class FoodSubjectScreenBody extends State {
  /* final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: "GMY_CnrPYIg",
      flags: const YoutubePlayerFlags(autoPlay: true, mute: true)); */

  var questions = <Words>[];
  var wrongChoices = <Words>[];

  late Words rightChoice;

  var allChoices = HashSet<Words>();

  int questionCounter = 0;
  int trueCounter = 0;
  int falseCounter = 0;

  String wordImageName = "placeholder_image.png";

  String button1Text = "";
  String button1Image = "placeholder_image.png";

  String button2Text = "";
  String button2Image = "placeholder_image.png";

  String button3Text = "";
  String button3Image = "placeholder_image.png";

  String mainVideo = "";
  String rightWord = "";
  String explanation = "kiki";

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  Future<void> getQuestions() async {
    String category = "Food";
    questions = await Wordsdao().get3RandomWord(category);
    loadQuestions();
  }

  // O anda hangi soru doğruysa onu alıyoruz.
  Future<void> loadQuestions() async {
    String category = "Food";
    rightChoice = questions[questionCounter];
    wordImageName = rightChoice.word_image;
    String videoID = rightChoice.word_url;
    wrongChoices =
        await Wordsdao().get2FalseAnswer(rightChoice.word_id, category);

    allChoices.clear();
    allChoices.add(rightChoice);
    allChoices.add(wrongChoices[0]);
    allChoices.add(wrongChoices[1]);

    // allChoices.add(wrongChoices[2]);

    button1Text = allChoices.elementAt(0).word_name;
    button1Image = allChoices.elementAt(0).word_image;

    button2Text = allChoices.elementAt(1).word_name;
    button2Image = allChoices.elementAt(1).word_image;

    button3Text = allChoices.elementAt(2).word_name;
    button3Image = allChoices.elementAt(2).word_image;
    rightWord = rightChoice.word_name;
    explanation = rightChoice.word_description;
    mainVideo = rightChoice.word_url;
    setState(() {});
  }

  void questionCounterControl() {
    questionCounter = questionCounter + 1;

    if (questionCounter != 3) {
      loadQuestions();
    } else {
      Navigator.pop(context);
    }
  }

  void checkTrue(String buttonText) {
    if (rightChoice.word_name == buttonText) {
      trueCounter = trueCounter + 1;
    } else {
      falseCounter = falseCounter + 1;
    }
  }

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
            centerTitle: true,
            title: Text(
              "FOOD",
              style: TextStyle(fontFamily: "Righteous"),
            ),
            //centerTitle: true,
            toolbarHeight: MediaQuery.of(context).size.height * 0.07,
            backgroundColor: Color.fromRGBO(94, 97, 244, 1).withOpacity(0.05),
          ),
          body: Column(
            children: [
              const SizedBox(height: 30.0),
              Text("$rightWord",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: "Righteous")),
              const SizedBox(height: 10.0),
              SizedBox(
                child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset("images/$mainVideo"))),
                height: 300.0,
                width: 300.0,
              ),
              const SizedBox(height: 20.0),
              SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(100, 22, 44, 33).withOpacity(0.2),
                ),
                child: Center(
                    child: Text(
                  "$explanation",
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: "Ubuntu",
                      color: Colors.white),
                )),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                height: 100,
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: 110,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlueAccent,
                    ),
                    onPressed: () {
                      questionCounterControl();
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
              )
            ],
          ),
          backgroundColor: Colors.transparent,
        ));
  }
}
