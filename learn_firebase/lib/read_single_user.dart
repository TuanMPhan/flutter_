import 'package:flutter/material.dart';
import 'package:learn_firebase/user.dart';

class SingleUserPage extends StatefulWidget {
  const SingleUserPage({super.key});

  @override
  State<SingleUserPage> createState() => _SingleUserPageState();
}

class _SingleUserPageState extends State<SingleUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Single user'),
      ),
      body: FutureBuilder<User?>(
        future: readSingleUser(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data;

            return user == null
                ? const Center(
                    child: Text('No user'),
                  )
                : buildUser(user);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
