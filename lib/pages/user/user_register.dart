// ignore_for_file: prefer_const_constructors

import 'package:appdalada/core/app/app_colors.dart';
import 'package:appdalada/pages/user/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:appdalada/core/models/usuario.dart';
import 'package:appdalada/core/service/auth/auth_firebase_service.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({
    Key? key,
  }) : super(key: key);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final TextEditingController apelido = TextEditingController();
  final format = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    AuthFirebaseService firebase = Provider.of<AuthFirebaseService>(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 40),
          Center(
            child: Text(
              'Olá ${firebase.usuario!.displayName} =)',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color(0xFFA1C69C),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                'Como você',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: AppColors.principal,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              Text(
                'gostaria de',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: AppColors.principal,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              Text(
                'ser chamado?',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  color: AppColors.principal,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Column(
            children: [
              Text(
                'Nome ou apelido que será exibido para os outros',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xFFA1C69C),
                ),
              ),
              Text(
                'usuários do aplicativo.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Color(0xFFA1C69C),
                ),
              ),
            ],
          ),
          SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: apelido,
                  style: TextStyle(
                    fontSize: 22,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.all(24),
            child: GestureDetector(
              onTap: () {
                firebase.firestore
                    .collection('users')
                    .doc(firebase.usuario?.uid)
                    .set({
                  'apelido': apelido.text,
                });

                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => UserProfilePage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.principal,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Continuar',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
