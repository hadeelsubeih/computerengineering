// import 'package:computerengineering/Screens/Home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:computerengineering/Models/user.dart';
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   User _userFromFirebaseUser(FirebaseUser user) {
//     return user != null ? User(uid: user.uid) : null;
//   }
// //  Future signWithPhone(int phone){
// //    Future<void> result =  _auth.verifyPhoneNumber(phoneNumber: phone,
// //        timeout: null, verificationCompleted: null,
// //        verificationFailed: null, codeSent: null,
// //        codeAutoRetrievalTimeout: null);
// //    FirebaseUser user = result;
// //    return _userFromFirebaseUser(user);
// //  }
//
//   Future signInWithEmailAndPassword(String email, String password) async {
//     try {
//       AuthResult result = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       FirebaseUser user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   Future signUpWithEmailAndPassword(String email, String password) async {
//     try {
//       AuthResult result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       FirebaseUser user = result.user;
//       return _userFromFirebaseUser(user);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   Future resetPass(String email) async {
//     try {
//       return await _auth.sendPasswordResetEmail(email: email);
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
//
//   Future<FirebaseUser> signInWithGoogle(BuildContext context) async {
//     final GoogleSignIn _googleSignIn = new GoogleSignIn();
//
//     final GoogleSignInAccount googleSignInAccount =
//     await _googleSignIn.signIn();
//     final GoogleSignInAuthentication googleSignInAuthentication =
//     await googleSignInAccount.authentication;
//
//     final AuthCredential credential = GoogleAuthProvider.getCredential(
//         idToken: googleSignInAuthentication.idToken,
//         accessToken: googleSignInAuthentication.accessToken);
//
//     AuthResult result = await _auth.signInWithCredential(credential);
//     FirebaseUser userDetails = result.user;
//
//     if (result == null) {
//     } else {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
//     }
//   }
//
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
