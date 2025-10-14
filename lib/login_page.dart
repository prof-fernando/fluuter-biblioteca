import 'package:flutter/material.dart';
import 'package:flutter_biblioteca/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(),
            TextField(),
            ElevatedButton(
              onPressed: () {
                final usuario = auth.login(
                  'fernando.oliveira@iffarroupilha.edu.br',
                  '123456',
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
