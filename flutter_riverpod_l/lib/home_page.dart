import 'package:flutter/material.dart';
import 'package:flutter_riverpod_l/legacy_provider_pages/change_notifier_page.dart';
import 'package:flutter_riverpod_l/legacy_provider_pages/future_provider_page.dart';
import 'package:flutter_riverpod_l/legacy_provider_pages/provider_page.dart';
import 'package:flutter_riverpod_l/legacy_provider_pages/state_notifier_page.dart';
import 'package:flutter_riverpod_l/legacy_provider_pages/state_provider_page.dart';
import 'package:flutter_riverpod_l/legacy_provider_pages/stream_provider_page.dart';
import 'package:flutter_riverpod_l/new_features_pages/todo_async_page.dart';
import 'package:flutter_riverpod_l/new_features_pages/todo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: const Text('Go to Provider Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const ProviderPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to State Provider Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const StateProviderPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to State Notifier Provider Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const StateNotifierProviderPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Change Notifier Provider Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const ChangeNotifierProviderPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Future Provider Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const FutureProviderPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Stream Provider Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const StreamProviderPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to Todo Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const TodoListPage()),
                  ),
                );
              },
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Go to TodoAsync Page'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => const TodoAsyncListPage()),
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
