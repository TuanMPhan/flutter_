// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/main.dart';

class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Page'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(name),
          )
        ],
      ),
    );
  }
}
