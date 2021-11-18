import 'package:flutter/material.dart';

class UserProfileWidget extends StatefulWidget {
  final apelido;
  final dataNascimento;
  final sobre;
  const UserProfileWidget(
      {Key? key, this.apelido, this.dataNascimento, this.sobre})
      : super(key: key);

  @override
  _UserProfileWidgetState createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${widget.apelido}'),
            Text('${widget.dataNascimento}'),
            Text('${widget.sobre}'),
          ],
        ),
      ),
    );
  }
}
