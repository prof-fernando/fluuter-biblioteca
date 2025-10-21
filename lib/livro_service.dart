import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_biblioteca/livro.dart';

class LivroService {
  final CollectionReference _livroColletion = FirebaseFirestore.instance
      .collection('livros');

  Future<void> gravar(Livro livro) async {
    if (livro.id.isEmpty) {
      await _livroColletion.add(livro.toMap());
    } else {
      _livroColletion.doc(livro.id).update(livro.toMap());
    }
  }

  Future<void> apagar(String id) async {
    await _livroColletion.doc(id).delete();
  }

  Stream<List<Livro>> listar() {
    return _livroColletion.snapshots().map(
      (snap) => snap.docs
          .map(
            (doc) => Livro.fromMap(doc.id, doc.data() as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
