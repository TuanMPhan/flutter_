// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/main.dart';

class FutureProviderPage extends ConsumerStatefulWidget {
  const FutureProviderPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _FutureProviderPageState();
  }
}

class _FutureProviderPageState extends ConsumerState<FutureProviderPage> {
  String userNo = '1';
  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchUserFutureProvider(userNo)).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Future Provider Page'),
          ),
          body: Column(
            children: [
              TextField(
                onSubmitted: (value) => setState(() {
                  userNo = value;
                }),
              ),
              Center(
                child: Text(data.name),
              )
            ],
          ),
        );
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
    );
  }
}
