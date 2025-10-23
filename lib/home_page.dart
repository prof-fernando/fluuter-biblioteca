import 'package:flutter/material.dart';
import 'package:flutter_biblioteca/auth_service.dart';
import 'package:flutter_biblioteca/livro.dart';
import 'package:flutter_biblioteca/livro_page.dart';
import 'package:flutter_biblioteca/livro_service.dart';
import 'package:flutter_biblioteca/login_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _authService = AuthService();
  final _livroService = LivroService();

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
      body: StreamBuilder<List<Livro>>(
        stream: _livroService.listar(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final livros = snap.data!;

          return ListView.builder(
            itemCount: livros.length,
            itemBuilder: (contexto, index) {
              final livro = livros[index];

              return ListTile(
                title: Text(livro.titulo),
                subtitle: Text(livro.autor),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).push(
                          MaterialPageRoute(
                            builder: (_) => LivroPage(livro: livro),
                          ),
                        );
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        _livroService.apagar(livro.id);
                      },
                      icon: Icon(Icons.clear),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(
            MaterialPageRoute(
              builder: (_) => LivroPage(),
            ),
          );
        },
        child: Text('+'),
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
