// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

//import 'package:appdalada/components/app_bar_create_group.dart';
import 'package:appdalada/components/app_bar_chat_page.dart';
import 'package:appdalada/components/app_bar_group.dart';
import 'package:appdalada/core/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:appdalada/core/app/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
            Container(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Material(
                  borderRadius: BorderRadius.circular(15),
                  //color: Colors.blueGrey[50],
                  elevation: 5,
                  //shadowColor: Colors.black,
                  child: TextFormField(
                    // controller: email,
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
                  ),
                ),
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
            Center(
              child: Container(
                padding:
                    EdgeInsets.only(top: 8, left: 100, right: 100, bottom: 10),
                child: TextButton(
                  onPressed: null,
                  child: Container(
                    child: Text(
                      'Criar',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.principal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
