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
}
