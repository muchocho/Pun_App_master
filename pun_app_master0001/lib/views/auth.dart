import 'package:firebase_auth/firebase_auth.dart';
import 'package:pun_app_master0001/models/models.dart';
class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uID: user.uid) : null;
  }
  Future signInEmailAndPass(String emaill, String pass)async{
    try{
      AuthResult authResult = await _auth.signInWithEmailAndPassword(email: emaill, password: pass);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }


  Future singUpWithEmailAndPass(String emaill, String pass) async{
    try{
      AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: emaill, password: pass);
      FirebaseUser firebaseUser = authResult.user;
      return _userFromFirebaseUser(firebaseUser);
    }catch(e){
      print(e.toString());
    }
  }

  Future signOut()async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }

}