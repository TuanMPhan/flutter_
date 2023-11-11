import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo.dart';

class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  void addATodos(WidgetRef ref) {
    // .notifer allow we to change the value
    ref.read(todosProvider.notifier).addTodo(
        const Todo(id: '1', description: 'the first to do', completed: false));
    ref.read(todosProvider.notifier).addTodo(
        const Todo(id: '2', description: 'the second to do', completed: false));
    ref.read(todosProvider.notifier).addTodo(
        const Todo(id: '3', description: 'the third to do', completed: false));
  }

  void removeTodo(WidgetRef ref) {
    ref.read(todosProvider.notifier).removeTodo('1');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // rebuild the widget when the todo list changes
    List<Todo> todos = ref.watch(todosProvider);

    // Let's render the todos in a scrollable list view
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos Page'),
        actions: [
          IconButton(
            onPressed: () {
              addATodos(ref);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              removeTodo(ref);
            },
            icon: const Icon(Icons.do_not_touch),
          )
        ],
      ),
      body: ListView(
        children: [
          for (final todo in todos)
            CheckboxListTile(
              value: todo.completed,
              // When tapping on the todo, change its completed status
              onChanged: (value) =>
                  ref.read(todosProvider.notifier).toggle(todo.id),
              title: Text(todo.description),
            ),
        ],
      ),
    );
  }
}
