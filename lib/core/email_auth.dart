import 'package:firebase_auth/firebase_auth.dart';
import 'package:quac/core/firebase.dart';

// ignore: missing_return
Future<UserCredential> signup(String email,String pass) async {
  try {
    await initialization;
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email, password: pass);
    return userCredential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.'); 
    }
  } catch (e) {
    print(e.toString());
  }
}
