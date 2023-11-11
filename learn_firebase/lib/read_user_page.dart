
import 'package:flutter/material.dart';

import 'package:learn_firebase/user.dart';

class ReadUserPage extends StatefulWidget {
  const ReadUserPage({super.key});

  @override
  State<ReadUserPage> createState() => _ReadUserPageState();
}


class _ReadUserPageState extends State<ReadUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All users'),
      ),
      body: StreamBuilder<List<User>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;

            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
