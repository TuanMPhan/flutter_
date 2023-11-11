// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/main.dart';

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<String> message = ref.watch(messageProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream provider page'),
      ),
      body: Center(
        child: message.when(
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
          data: (message) {
            return Text(message);
          },
        ),
      ),
    );
  }
}
