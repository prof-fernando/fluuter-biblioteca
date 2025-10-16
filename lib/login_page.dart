import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_biblioteca/auth_service.dart';
import 'package:flutter_biblioteca/home_page.dart';
import 'package:flutter_biblioteca/usuario_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = AuthService();
  final _txtLogin = TextEditingController();
  final _txtPass = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _txtLogin.text = 'prof@iffar.edu.br';
    _txtPass.text = '123456';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text('Email:'),
              ),
              controller: _txtLogin,
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Senha:'),
              ),
              controller: _txtPass,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                autenticar(context);
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => UsuarioPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void autenticar(BuildContext context) async {
    try {
      final usuario = await auth.login(
        _txtLogin.text,
        _txtPass.text,
      );
      if (usuario != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomePage(),
          ),
        );
      }
    } on FirebaseException catch (e) {
      const snack = SnackBar(content: Text('Usuário ou senha inválidos'));
      ScaffoldMessenger.of(context).showSnackBar(snack);
      print(e.code);
    }
  }
}
