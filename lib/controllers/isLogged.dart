import 'package:flutter/material.dart';
import 'package:test2/pages/auth/loginPage.dart';
import 'package:test2/pages/homePage.dart';

class IsLogged extends StatefulWidget {
  IsLogged({Key? key}) : super(key: key);

  @override
  State<IsLogged> createState() => _IsLoggedState();
}

class _IsLoggedState extends State<IsLogged> {
  bool logged = true;
  @override
  Widget build(BuildContext context) {
    if (logged) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
