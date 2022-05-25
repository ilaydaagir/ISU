import 'package:flutter/material.dart';

class ColorQuizPage extends StatefulWidget {
  const ColorQuizPage({Key? key}) : super(key: key);

  @override
  State<ColorQuizPage> createState() => _ColorQuizPageState();
}

class _ColorQuizPageState extends State<ColorQuizPage> {
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
          title: Text(
            'COLOR QUIZ',
            style: TextStyle(fontSize: 30),
          ),
          centerTitle: true,
          toolbarHeight: MediaQuery.of(context).size.height * 0.07,
          backgroundColor: Color.fromRGBO(94, 97, 244, 1),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
