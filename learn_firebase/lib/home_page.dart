import 'package:flutter/material.dart';
import 'package:learn_firebase/create_user_page.dart';
import 'package:learn_firebase/read_single_user.dart';
import 'package:learn_firebase/read_user_page.dart';
import 'package:learn_firebase/update.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Go to Create User Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const UserPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Read User Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const ReadUserPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Read Single User Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const SingleUserPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Update Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const UpdataPage()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
