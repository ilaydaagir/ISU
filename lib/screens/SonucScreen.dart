import 'package:flutter/material.dart';

class SonucScreen extends StatefulWidget {

  int trueCounter;

  SonucScreen({required this.trueCounter});

  @override
  State<SonucScreen> createState() => _SonucScreenState();
}

class _SonucScreenState extends State<SonucScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
    gradient: LinearGradient(colors: [
    Color.fromRGBO(94, 97, 244, 1),
    Color.fromRGBO(203, 81, 94, 1),
    ],begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    child:Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TEST SONUCUNUZ"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("${widget.trueCounter} DOĞRU , ${3-widget.trueCounter} YANLIŞ", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
            Text(" % ${((widget.trueCounter*100)/3).toInt()} Başarı ", style: TextStyle(fontSize: 30,color: Colors.white)),
            SizedBox(
              height: 50,
              width: 140,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlueAccent,
                  ),
                  child: Text("TEKRAR DENE"),
                  onPressed: () {
                    Navigator.pop(context);  // Quiz sayfasında (önceki ekran) back stack ile geçiş yaptığımız için anasayfaya dönecek
                  }
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    )
    );
  }
}
