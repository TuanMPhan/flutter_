// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/main.dart';

class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({super.key});

  void onSubmit(WidgetRef ref, String value) {
    // .notifer allow we to change the value
    ref.read(userChangeNotifierProvider).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String a) {
    // .notifer allow we to change the value
    ref.read(userChangeNotifierProvider).updateAge(int.parse(a));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userChangeNotifierProvider).user;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Provider Page'),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          TextField(
            onSubmitted: (value) => onSubmitAge(ref, value),
          ),
          Center(
            child: Text(user.name),
          ),
          Center(
            child: Text(user.age.toString()),
          )
        ],
      ),
    );
  }
}
