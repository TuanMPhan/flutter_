// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/main.dart';

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('State Provider Page'),
        ),
        body: Center(
          child: ElevatedButton(
            // 4. use the value
            child: Text('Value: $counter'),
            // 5. change the state inside a button callback
            onPressed: () => ref.read(counterProvider.notifier).state++,
          ),
        ));
  }
}
