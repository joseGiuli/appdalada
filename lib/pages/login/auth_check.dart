// ignore_for_file: prefer_const_constructors

import 'package:appdalada/core/service/auth/auth_firebase_service.dart';
import 'package:appdalada/pages/chat/chat_page.dart';
import 'package:appdalada/pages/home/home_page.dart';
import 'package:appdalada/pages/login/login_page.dart';
import 'package:appdalada/pages/user/user_register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  _AuthCheckState createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthFirebaseService auth = Provider.of<AuthFirebaseService>(context);

    if (auth.isLoading) {
      return Loading();
    } else if (auth.usuario == null) {
      return LoginPage();
    } else {
      return UserRegister();
    }
  }
}

Loading() {
  return Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}