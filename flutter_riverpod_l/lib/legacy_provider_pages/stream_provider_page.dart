// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/main.dart';

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Provider Page'),
      ),
      body: ref.watch(streamProvider).when(
        data: (data) {
          return Text(data.toString());
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
