import 'package:flutter/foundation.dart';

class Livro {
  String id;
  String titulo;
  String autor;
  int ano;

  Livro({
    this.id = '',
    required this.titulo,
    required this.autor,
    required this.ano,
  });

  Map<String, dynamic> toMap() {
    return {'titulo': titulo, 'autor': autor, 'ano': ano};
  }

  factory Livro.fromMap(String id, Map<String, dynamic> dados) {
    return Livro(
      id: id,
      titulo: dados['titulo'],
      autor: dados['autor'],
      ano: dados['ano'],
    );
  }
}
