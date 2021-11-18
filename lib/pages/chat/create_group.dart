// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

//import 'package:appdalada/components/app_bar_create_group.dart';
import 'package:appdalada/components/app_bar_chat_page.dart';
import 'package:appdalada/components/app_bar_group.dart';
import 'package:appdalada/core/app/app_colors.dart';
import 'package:appdalada/core/service/auth/auth_firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:appdalada/core/app/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nome = TextEditingController();
  final TextEditingController classificacao = TextEditingController();

  _onSubmit() async {
    AuthFirebaseService firebase =
        Provider.of<AuthFirebaseService>(context, listen: false);
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      firebase.firestore.collection('grupos').add({
        //'id': numero aleatorio
        'uid': [
          {
            'uid': firebase.usuario!.uid,
            'nome': firebase.usuario!.displayName,
          }
        ],
        'nome': nome.text,
        'classificacao': classificacao.text,
      });

      /* Navigator.push(
        context,
        MaterialPageRoute(
          builder: () => UserRegisterNascimentoPage(),
        ),
      );*/
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('erro baitola'),
        backgroundColor: Colors.red[400],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGroup(),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignor: prefer_const_constructors
            Center(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.blueGrey,
              ),
            ),
            TextButton(
              onPressed: null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: duplicate_ignore, prefer_const_literals_to_create_immutables
                children: [
                  Icon(
                    Icons.image,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(width: 10),
                  Text('Adiconar Imagem'),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      elevation: 5,
                      child: TextFormField(
                        controller: nome,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nome do Grupo',
                          hintStyle: TextStyle(
                            color: AppColors.principal,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              Icons.group_sharp,
                              color: AppColors.principal,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.name,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return '';
                          }

                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Nome de exibição do grupo.',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.all(24),
              child: GestureDetector(
                onTap: () {
                  _onSubmit();
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
      ),
    );
  }
}
