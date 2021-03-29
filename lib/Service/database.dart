import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Service/post.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference user =
      FirebaseFirestore.instance.collection('user');
  final CollectionReference post =
      FirebaseFirestore.instance.collection('post');

  Future updateUserData(
      String userName, String email, String number, String description) async {
    return await user.doc().set({
      'userName': userName,
      'email': email,
      'number': number,
      'description': description,
    });
  }

  Future updatePost(String name, String description, String location,
      String number, String date, String time) async {
    return await post.doc().set({
      'name': name,
      'description': description,
      'location': location,
      'number': number,
      'date': date,
      'time': time
    });
  }

  //FIXME: need to find a way to output result 
  void getPost() {
    FirebaseFirestore.instance.collection("post").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }
}
