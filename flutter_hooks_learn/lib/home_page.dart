import 'package:flutter/material.dart';
import 'package:flutter_hooks_learn/countdown_page.dart';
import 'package:flutter_hooks_learn/existing_hooks_page.dart';
import 'package:flutter_hooks_learn/future_memoized_page.dart';
import 'package:flutter_hooks_learn/scroll_image_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Go to Existing Hooks Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const ExistingHooksPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Future_Memoized Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const FutureMemoizedPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Counter Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const CountDownPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Scroll Image Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const ScrollImagePage()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
