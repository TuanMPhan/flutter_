import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_future.g.dart';

class UserFuture {
  final String name;
  final String email;

  const UserFuture({required this.name, required this.email});

  UserFuture copyWith({
    String? name,
    String? email,
  }) {
    return UserFuture(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory UserFuture.fromMap(Map<String, dynamic> map) {
    return UserFuture(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory UserFuture.fromJson(String source) =>
      UserFuture.fromMap(json.decode(source));
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(ref);
}

// final userRepositoryProvider = Provider.autoDispose((ref) => UserRepository());

class UserRepository {
  final Ref ref;
  UserRepository(this.ref);
  Future<UserFuture> fetchFuture(String input) {
    var url = 'https://jsonplaceholder.typicode.com/users/$input';
    return http
        .get(Uri.parse(url))
        .then((value) => UserFuture.fromJson(value.body));
  }
}
