import 'dart:collection';
import 'package:flutter/material.dart';
import '../Wordsdao.dart';
import '../screens/SonucScreen.dart';
import '../screens/Words.dart';

class AileQuizScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizScreenBody();
  }
}

class QuizScreenBody extends State {
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

  String explanation = "kiki";

  @override
  void initState() {
    super.initState();
    getQuestions();
  }

  Future<void> getQuestions() async {
    String category = "Aile";
    questions = await Wordsdao().get3RandomWord(category);
    loadQuestions();
  }

  // O anda hangi soru doğruysa onu alıyoruz.
  Future<void> loadQuestions() async {
    String category = "Aile";
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

    explanation = rightChoice.word_description;
    mainVideo = rightChoice.word_url;
    setState(() {});
  }

  void questionCounterControl() {
    questionCounter = questionCounter + 1;

    if (questionCounter != 3) {
      loadQuestions();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SonucScreen(trueCounter: trueCounter)));
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
            toolbarHeight: MediaQuery.of(context).size.height * 0.07,
            backgroundColor: Color.fromRGBO(94, 97, 244, 1).withOpacity(0.05),
            title: Text(
              "AILE TEST",
              style: TextStyle(fontFamily: "Righteous"),
            ),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 40.0),
                  Text(
                    "DOĞRU :  $trueCounter",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "YANLIŞ :  $falseCounter",
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Center(child: const SizedBox(height: 30.0)),
              const Text("Hangi kelime?",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 20.0),
              SizedBox(
                  child: SizedBox(
                height: 250.0,
                width: 300.0,
                child: Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset("images/$mainVideo")),
                ),
              )),
              const SizedBox(height: 20.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          ),
                          onPressed: () {
                            checkTrue(button1Text);
                            questionCounterControl();
                          },
                          child: Column(
                            children: [
                              Image.asset("images/$button1Image",
                                  width: 80.0, height: 80.0),
                              Text(button1Text,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0))
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          ),
                          onPressed: () {
                            checkTrue(button2Text);
                            questionCounterControl();
                          },
                          child: Column(
                            children: [
                              Image.asset("images/$button2Image",
                                  width: 80.0, height: 80.0),
                              Text(
                                button2Text,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15.0),
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 100.0,
                      width: 100.0,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                          ),
                          onPressed: () {
                            checkTrue(button3Text);
                            questionCounterControl();
                          },
                          child: Column(
                            children: [
                              Image.asset("images/$button3Image",
                                  width: 80.0, height: 80.0),
                              Text(button3Text,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0))
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              SizedBox(height: 20.0),
            ],
          ),
          backgroundColor: Colors.transparent,
        ));
  }
}
