import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/Service/database.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in anon
  Future signInAnon()async{
    try{
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInEmailPassword(String email, String password) async{
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //register with email and password
  Future registerEmailAndPassword(String userName, String email, String password, String number, String description) async{
    try{
      await DatabaseService().updateUserData(userName, email, number, description);
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    }catch(e){
      print(e.toString());
      return null;
    }
    
  }
  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}