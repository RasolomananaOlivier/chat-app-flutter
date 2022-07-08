import 'package:flutter/material.dart';
import 'package:test2/controllers/isLogged.dart';
import 'package:get/get.dart';
import 'package:test2/pages/homePage.dart';
import 'package:test2/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chat App',
      theme: LightThemeData(context),
      darkTheme: DarkThemeData(context),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => IsLogged(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
