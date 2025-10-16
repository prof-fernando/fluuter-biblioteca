import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get usuarioLogado => _auth.currentUser;

  Future<User?> login(String email, String senha) async {
    UserCredential resultado = await _auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    );
    return resultado.user;
  }

  Future<void> logout() {
    return _auth.signOut();
  }

  Future<User?> registro(String nome, String email, String senha) async {
    UserCredential resultado = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
    if (resultado.user != null) {
      resultado.user!.updateDisplayName(nome);
    }

    return resultado.user;
  }
}
