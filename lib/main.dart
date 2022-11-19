import 'package:flutter/material.dart';
import 'package:flutter_application_1/windows/auth.dart';
import 'package:flutter_application_1/windows/landing.dart';
import 'domain/users.dart';
import 'package:flutter_application_1/windows/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Пользовател',
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Color.fromARGB(255, 255, 255, 255)),
            primaryColor: Color.fromARGB(255, 255, 255, 255),
            textTheme: TextTheme(titleLarge: TextStyle(color: Colors.black)),
            primaryTextTheme: TextTheme(
                titleLarge: TextStyle(
                    color: Colors
                        .black // Тут указываем нужный цвет текст по умолчанию
                    ))),
        home: LandingPage());
  }
}
