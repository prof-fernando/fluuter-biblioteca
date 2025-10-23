import 'package:flutter/material.dart';
import 'package:flutter_biblioteca/livro.dart';
import 'package:flutter_biblioteca/livro_service.dart';

class LivroPage extends StatefulWidget {
  final Livro? livro;

  const LivroPage({super.key, this.livro});

  @override
  State<LivroPage> createState() => _LivroPageState();
}

class _LivroPageState extends State<LivroPage> {
  final TextEditingController _txtTitulo = TextEditingController();
  final TextEditingController _txtAutor = TextEditingController();
  final TextEditingController _txtAno = TextEditingController();
  final LivroService _livroService = LivroService();
  String? idLivro;
  @override
  void initState() {
    if (widget.livro != null) {
      _txtTitulo.text = widget.livro!.titulo;
      _txtAutor.text = widget.livro!.autor;
      _txtAno.text = widget.livro!.ano.toString();
      idLivro = widget.livro!.id;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Título',
              ),
              controller: _txtTitulo,
            ),
            SizedBox(
              height: 10,
            ),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Autor',
              ),
              controller: _txtAutor,
            ),
            SizedBox(
              height: 10,
            ),

            TextFormField(
              decoration: InputDecoration(
                labelText: 'Ano',
              ),
              controller: _txtAno,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _gravar(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  _gravar(BuildContext ctx) async {
    final livro = await _livroService.gravar(
      Livro(
        id: idLivro ?? '',
        titulo: _txtTitulo.text,
        autor: _txtAutor.text,
        ano: int.parse(_txtAno.text),
      ),
    );
    idLivro = livro.id;
    final SnackBar snack = SnackBar(content: Text('Salvo com sucesso!!'));
    ScaffoldMessenger.of(ctx).showSnackBar(snack);
  }
}
