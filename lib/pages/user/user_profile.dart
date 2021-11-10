import 'package:appdalada/core/models/user_profile_model.dart';
import 'package:appdalada/core/service/auth/auth_firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthFirebaseService firebase = Provider.of<AuthFirebaseService>(context);
    return Column(
      children: [],
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  final UserProfileModel model;

  UserProfileWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(model.apelido.toString())],
    );
  }
}
