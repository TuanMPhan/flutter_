import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;

  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(
      const Duration(seconds: 1),
      (v) => from - v,
    ).takeWhile((value) => value >= 0).listen((value) {
      this.value = value;
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}

class CountDownPage extends HookWidget {
  const CountDownPage({super.key});

  @override
  Widget build(BuildContext context) {
    // useMemoized only caches the countdown 
    final countDown = useMemoized(() => CountDown(from: 20));

    // useListenable: 	Subscribes to a Listenable and marks the widget as needing build whenever the listener is called.
    // useListenable call build everytime the countdown changes it's value
    final notifier = useListenable(countDown);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Other Page'),
      ),
      body: Text(notifier.value.toString()),
    );
  }
}
