// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/main.dart';

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  void onSubmit(WidgetRef ref, String value) {
    // .notifer allow we to change the value
    ref.read(nameStateProvider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameState = ref.watch(nameStateProvider) ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider Page'),
      ),
      body: Column(
        children: [
          TextField(
            onSubmitted: (value) => onSubmit(ref, value),
          ),
          Center(
            child: Text(nameState),
          )
        ],
      ),
    );
  }
}
