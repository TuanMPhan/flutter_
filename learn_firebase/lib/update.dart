import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdataPage extends StatefulWidget {
  const UpdataPage({super.key});

  @override
  State<UpdataPage> createState() => _UpdataPageState();
}

class _UpdataPageState extends State<UpdataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                final docUser =
                    FirebaseFirestore.instance.collection('users').doc('my_id');

                docUser.update({'name': 'Emma'});
              },
              child: const Text('Update'))
        ],
      ),
    );
  }
}
