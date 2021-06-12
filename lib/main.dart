import 'package:flutter/material.dart';
import 'package:kali/screens/register.dart';
import 'package:kali/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Register.id,
      routes: {
        Register.id: (context) => Register(),
        Login.id: (context) => Login(),
      },

    );
  }
}