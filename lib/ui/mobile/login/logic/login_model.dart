import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../login.dart';

Future userLogin(String email, String password) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);
}

Future Logout() async {
  await FirebaseAuth.instance
      .signOut()
      .whenComplete(() => Get.to(() => Login()));
}
