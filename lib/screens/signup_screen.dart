import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../reusable_wıdgets/reusable_widgets.dart';
import '../utities/colors.dart';
import 'language.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Kayıt Ol",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            hexStringToColor("2D7099"),
            hexStringToColor("CB515E"),
            hexStringToColor("5E61F4")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Kullanıcı adınız", Icons.person_outline,
                    false, widget._userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Email adresini giriniz",
                    Icons.person_outline, false, widget._emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "En az 6 haneli şifrenizi Giriniz",
                    Icons.person_outline,
                    false,
                    widget._passwordTextController),
                signInSignUpButton(
                  context,
                  false,
                  () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: widget._emailTextController.text,
                            password: widget._passwordTextController.text)
                        .then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LanguagePage(),
                        ),
                      );
                    }).onError((error, stackTrace) {
                      print("Hata oluştu! ${error.toString()}");
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
