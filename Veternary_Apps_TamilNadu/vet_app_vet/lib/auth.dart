import 'package:firebase_auth/firebase_auth.dart';
import 'package:vetappvet/docbase.dart';
import 'package:vetappvet/docclass.dart';

//make function to check if email in sign up already has account
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance; //instance of firebase user
  Doctor _userFromFirebaseUser(FirebaseUser user) {
    //function to convert data in db into a user object
    return user != null ? Doctor(docid: user.uid) : null;
  }

  PhoneUser _phuserFromFirebaseUser(FirebaseUser user) {
    //function to convert data in db into a user object
    return user != null ? PhoneUser(phno: user.phoneNumber) : null;
  }

  Stream<Doctor> get user {
    //defining stream from database to app
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //with email
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password); //predefined fn
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //anonymous
  //reg with email
  Future registerWithEmailAndPassword(String email, String password,
      String name, String locality, String speciality, String mobile, String aadhaar) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DocbaseService(docid: user.uid).updateUserData(
          name,
          mobile,
          locality,
          speciality,
          aadhaar,
          email); //DBservice is a class which is used to extract user data from DB uisng userid
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  signInph(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  Future signInWithOTP(smsCode, verId) {
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signInph(authCreds);
  }

  Future registerWithOTP(
      smsCode, verId, String name, String aadhaar, String phoneno,  String locality, String speciality) async {
    try {
      String email = null;
      AuthCredential authCreds = PhoneAuthProvider.getCredential(
          verificationId: verId, smsCode: smsCode);
      AuthResult result = await _auth.signInWithCredential(authCreds);
      FirebaseUser user = result.user;
      await DocbaseService(docid: user.uid).updateUserData(
          name,
          phoneno,
          locality,
          speciality,
          aadhaar,
          email); //DBservice is a class which is used to extract user data from DB uisng userid
      return _userFromFirebaseUser(user);
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

  Future signInAnonymous(String phno) async {
    try {
      return Doctor(docid: '1');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
