import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_biblioteca/auth_service.dart';

class UsuarioPage extends StatefulWidget {
  const UsuarioPage({super.key});

  @override
  State<UsuarioPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<UsuarioPage> {
  final _auth = AuthService();
  final _txtNome = TextEditingController();
  final _txtEmail = TextEditingController();
  final _txtSenha = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova conta '),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text('Nome:'),
              ),
              controller: _txtNome,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Email:'),
              ),
              controller: _txtEmail,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Senha:'),
              ),
              controller: _txtSenha,
              obscureText: true,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                cadastrar(context);
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }

  cadastrar(BuildContext ctx) {
    try {
      final usuario = _auth.registro(
        _txtNome.text,
        _txtEmail.text,
        _txtSenha.text,
      );
    } on FirebaseException catch (e) {
      var message = 'E-mail invalido';
      if (e.code == 'firebase_auth/weak-password') {
        message = 'A senha precisa ter pelo menos 6 caracteres';
      }
      const snack = SnackBar(content: Text(''));
      ScaffoldMessenger.of(ctx).showSnackBar(snack);
    }
  }
}
