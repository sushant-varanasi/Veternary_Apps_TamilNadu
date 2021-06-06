import 'package:firebase_auth/firebase_auth.dart';

import 'adminsclass.dart';
import 'database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; //instance of firebase user
  Admin _adminFromFirebaseAdmin(FirebaseUser admin) {
    //function to convert data in db into a user object
    return admin != null ? Admin(aid: admin.uid) : null;
  }

  Stream<Admin> get admin {
    //defining stream from database to app
    return _auth.onAuthStateChanged.map(_adminFromFirebaseAdmin);
  }

  //with email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password); //predefined fn
      FirebaseUser admin = result.user;
      return _adminFromFirebaseAdmin(admin);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //anonymous
  //reg with email
  Future registerWithEmailAndPassword(String email, String password,
      String name, String mobile, String aadhaar) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser admin = result.user;
      await DatabaseService(aid: admin.uid).updateAdminData(
          name,
          mobile,
          aadhaar,
          email); //DBservice is a class which is used to extract user data from DB uisng userid
      return _adminFromFirebaseAdmin(admin);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  /*

  {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signInph(authCreds);
    String email = null;
    FirebaseUser user = result.user;
    await DatabaseService(uid: user.uid).updateUserData(
        name,
        mobile,
        location,
        aadhaar,
        email); //DBservice is a class which is used to extract user data from DB uisng userid
    return _userFromFirebaseUser(user);

  }
*/

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut(); //not same as outside sign out
    } catch (e) {
      print(e.toString());
    }
  }
}
