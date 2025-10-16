import 'package:flutter/material.dart';
import 'package:flutter_biblioteca/auth_service.dart';
import 'package:flutter_biblioteca/login_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Biblioteca'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Olá, ${_authService.usuarioLogado?.displayName}'),
            ),
            ListTile(
              trailing: Icon(Icons.logout),
              title: Text('Sair'),
              onTap: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Seja bem vindo ${_authService.usuarioLogado?.displayName}',
        ),
      ),
    );
  }

  _logout(BuildContext ctx) async {
    await _authService.logout();
    Navigator.pushReplacement(
      ctx,
      MaterialPageRoute(builder: (_) => LoginPage()),
    );
  }
}
