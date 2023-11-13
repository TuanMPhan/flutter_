import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/new_features_pages/todo_async.dart';


class TodoAsyncListPage extends ConsumerWidget {
  const TodoAsyncListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    final asyncTodos = ref.watch(asyncTodosProvider);

    // Let's render the todos in a scrollable list view
    return Scaffold(
      appBar: AppBar(
        title: const Text('Async Notifer Page'),
      ),
      body: switch (asyncTodos) {
        AsyncData(:final value) => ListView(
            children: [
              for (final todo in value)
                CheckboxListTile(
                  value: todo.completed,
                  // When tapping on the todo, change its completed status
                  onChanged: (value) {
                    ref.read(asyncTodosProvider.notifier).toggle(todo.id);
                  },
                  title: Text(todo.todo),
                ),
            ],
          ),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}
