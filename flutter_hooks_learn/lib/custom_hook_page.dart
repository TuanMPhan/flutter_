import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_learn/custom_hook.dart';

const url = 'https://bit.ly/3qYOtDm';

class CustomHookPage extends HookWidget {
  const CustomHookPage({super.key});

  @override
  Widget build(BuildContext context) {
    final number = useInfiniteTimer(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Hook Page'),
      ),
      body: Center(
        child: Text(number.toString()),
      ),
    );
  }
}
