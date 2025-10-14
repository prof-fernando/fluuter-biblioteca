import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> login(String email, String senha) async {
    UserCredential resultado = await _auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    );
    return resultado.user;
  }

  Future<User?> registro(String nome, String email, String senha) async {
    try {
      UserCredential resultado = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      if (resultado.user != null) {
        resultado.user!.updateDisplayName(nome);
      }

      return resultado.user;
    } catch (e) {
      throw e;
    }
  }
}
