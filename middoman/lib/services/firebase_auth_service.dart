import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class FirebaseAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future login(String email, String password) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future signup(String email, String password) async {
    await auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future logininwithgoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Save the user in the database
    var client = http.Client();
    var uri = Uri.parse('https://my-first-app-249520.uk.r.appspot.com/users');
    var res = await client.post(uri, body: {
      'user_name': googleUser?.displayName,
      'user_email': googleUser?.email,
    });

    AuthCredential myCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(myCredential);

    debugPrint(user.user?.displayName);
  }
}
