// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

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
  final TextEditingController nomeCompleto = TextEditingController();
  final TextEditingController apelido = TextEditingController();
  final TextEditingController idade = TextEditingController();

  addUser(String nome, String apelido, String idade) {
    AuthFirebaseService auth =
        Provider.of<AuthFirebaseService>(context, listen: false);
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');
      return users.add({
        'uid': auth.usuario!.uid,
        'nome_completo': nome,
        'apelido': apelido,
        'idade': idade,
        'sobre': 'Teste',
      }).catchError(
        (error) =>
            AuthException('Falha ao inserir informações do usuario: $error'),
      );
    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.message),
        backgroundColor: Colors.red[400],
      ));
    } finally {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Informações do usuario inseridas com sucesso!'),
        backgroundColor: Colors.green[400],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Olá'),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text('Nome Completo'),
                SizedBox(height: 10),
                TextField(
                  controller: nomeCompleto,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Text('Apelido'),
                SizedBox(height: 10),
                TextField(
                  controller: apelido,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Text('Data de Nascimento'),
                SizedBox(height: 10),
                TextField(
                  controller: idade,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () => {
                        addUser(
                          nomeCompleto.text,
                          apelido.text,
                          idade.text,
                        )
                      },
                      child: Text('Salvar'),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
