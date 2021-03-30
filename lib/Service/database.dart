import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  
  //collection reference
  final CollectionReference user = FirebaseFirestore.instance.collection('user');
  final CollectionReference post = FirebaseFirestore.instance.collection('post');


  Future updateUserData(String userName, String email, String number, String description) async{
    return await user.doc().set({
      'userName': userName,
      'email': email,
      'number': number,
      'description': description,
    });  
  }

  Future updatePost(String name, String description, String location, String number, String date, String time, String address) async{
    return await post.doc().set({
      'name':name,
      'description': description,
      'location': location,
      'number': number,
      'date': date,
      'time': time,
      'address': address,
    });
  }
}