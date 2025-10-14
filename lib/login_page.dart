import 'package:flutter/material.dart';
import 'package:flutter_biblioteca/auth_service.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                label: Text('Senha:'),
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
                final usuario = auth.login(
                  _txtLogin.text,
                  _txtPass.text,
                );
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
}
