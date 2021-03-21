import 'package:flutter/material.dart';
import 'package:pun_app_master0001/views/homequiz.dart';
import 'package:pun_app_master0001/views/signin.dart';
import 'package:pun_app_master0001/helper/functions.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  bool _isLoggedin = false;
  
  @override
  void initState() {
    checkUserLoggedInStatus();
    super.initState();
  }

  checkUserLoggedInStatus()async{
    await HelperFunctions.getUserLoggedInDetails().then((value){
      setState(() {
        _isLoggedin = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: (_isLoggedin ?? false) ? QuizMaker() : SignIn(),
    );
  }
}
