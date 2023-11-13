// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/main.dart';

class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  void onSubmit(WidgetRef ref, String value) {
    // .notifer allow we to change the value
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmitAge(WidgetRef ref, String a) {
    // .notifer allow we to change the value
    ref.read(userProvider.notifier).updateAge(int.parse(a));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    // select allows us to only listen to the properties that we care about
    // final userSelect = ref.watch(userProvider.select((value) => value.name));

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Provider Page'),
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
