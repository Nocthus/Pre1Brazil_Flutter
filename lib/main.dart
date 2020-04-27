import 'package:flutter/material.dart';
import 'package:pre1brazil/ui/home.dart';
import 'package:pre1brazil/ui/login.dart';
import 'package:pre1brazil/ui/pages/login/login_page.dart';
import 'package:pre1brazil/ui/pages/register/register_page.dart';
import 'package:pre1brazil/ui/register.dart';
import 'package:pre1brazil/ui/splash.dart';
import 'package:pre1brazil/ui/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        home: SplashPage(),
        routes: <String, WidgetBuilder>{
          '/task': (BuildContext context) => TaskPage(title: 'Task'),
          '/home': (BuildContext context) => HomePage(title: 'Home'),
          '/login': (BuildContext context) => LoginPage(),
          '/login_new': (BuildContext context) => LoginUPage(),
          '/register_teste': (BuildContext context) => RegisterAPage(),
          '/register_user': (BuildContext context) => RegisterPage(),
        
        });
  }
}
