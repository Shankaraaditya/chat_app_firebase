import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? fullname;
  String? email;
  String? profilepic;

  UserModel(
      {this.uid, this.fullname, this.email, this.profilepic}); // constructor

  // map se user model ko construct kar ske islie ek constructor aur banana hoga key value type ka
  // kyuki firebase me values bhi key value pair me insert hoti hai
  UserModel.fromMap(Map<String, dynamic> map) {
    // ye map se object banane ke kaam aayega
    uid = map["uid"];
    fullname = map["fullname"];
    email = map["email"];
    profilepic = map["profilepic"];
  }

  // ek object se map banae ke liye bhi banana padega ...to map type return hoga jiska

  Map<String, dynamic> tomap() {
    return {
      "uid": uid,
      "fullname": fullname,
      "email": email,
      "profilepic": profilepic
    };
  }
}
