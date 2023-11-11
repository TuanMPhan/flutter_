import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };

  static User fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] ?? 'none',
        name: json['name'] ?? 'none',
        age: json['age'] ?? 'none',
        birthday: (json['birthday'] as Timestamp).toDate());
  }
}

Future createUser(User user) async {
  var db = FirebaseFirestore.instance;
  final docUser = db.collection('users').doc();
  user.id = docUser.id;

  final json = user.toJson();

  /// create document and write data to Firebase
  await docUser.set(json);
}

Stream<List<User>> readUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

Widget buildUser(User user) => ListTile(
      leading: CircleAvatar(child: Text('${user.age}')),
      title: Text(user.name),
      subtitle: Text(user.birthday.toIso8601String()),
    );

Future<User?> readSingleUser() async {
  final docUser = FirebaseFirestore.instance.collection('users').doc('my_id');

  final snapshot = await docUser.get();
  if (snapshot.exists) {
    return User.fromJson(snapshot.data()!);
  }
  return null;
}
