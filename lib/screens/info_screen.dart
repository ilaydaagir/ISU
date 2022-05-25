import 'package:flutter/material.dart';

import '../utities/colors.dart';

class InfoPage extends StatefulWidget {
  String language;
  InfoPage(this.language, {Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState(language == 'EN' ? 0 : 1);
}

class _InfoPageState extends State<InfoPage> {
  int language;

  var info = [
    'ISU is a mobile application that aims to increase the use of sign language so that hearing impaired individuals can socialize more easily. Thanks to the modules in the application, the user will find the sign language equivalents of frequently used words on various subjects.',
    'ISU işitme engelli bireylerin daha kolay sosyalleşebilmesi için işaret dilinin kullanımını artırmayı amaçlayan bir mobil uygulamadır.Uygulamanın içerisindeki modüller sayesinde kullanıcı çeşitli konulardaki sık kullanılan kelimelerin işaret dilindeki karşılıklarına ulaşacaklardır.'
  ];

  _InfoPageState(this.language);

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
        body: Column(
          children: [
            SizedBox(height: 35),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        color: Color.fromRGBO(242, 109, 123, 1), width: 10),
                    borderRadius: BorderRadius.circular(40)),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
                    child: Text(
                      info[language],
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
