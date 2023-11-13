import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

@immutable
class TodoAsync {
  const TodoAsync({
    required this.id,
    required this.todo,
    required this.completed,
  });

  factory TodoAsync.fromJson(Map<String, dynamic> map) {
    return TodoAsync(
      id: map['id'].toString(),
      todo: map['todo'] as String,
      completed: map['completed'] as bool,
    );
  }

  final String id;
  final String todo;
  final bool completed;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'todo': todo,
        'completed': completed,
      };
}

class AsyncTodosNotifier extends AsyncNotifier<List<TodoAsync>> {
  Future<List<TodoAsync>> _fetchTodo() async {
    final json =
        await http.get(Uri.parse('https://dummyjson.com/todos/?limit=10'));
    final todos =
        (jsonDecode(json.body)['todos'] as List).cast<Map<String, dynamic>>();
    return todos.map(TodoAsync.fromJson).toList();
  }

  @override
  Future<List<TodoAsync>> build() async {
    // Load initial todo list from the remote repository
    return _fetchTodo();
  }

  Future<void> addTodo(TodoAsync todo) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await http.post(Uri.parse('https://dummyjson.com/todos/add'),
          body: todo.toJson());
      return _fetchTodo();
    });
  }

  // Let's allow removing todos
  Future<void> removeTodo(String todoId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await http.delete(Uri.parse('https://dummyjson.com/todos/$todoId'));
      return _fetchTodo();
    });
  }

  // Let's mark a todo as completed
  Future<void> toggle(String todoId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await http.patch(
        Uri.parse('https://dummyjson.com/todos/$todoId'),
        body: <String, dynamic>{'completed': 'true'},
      );
      return _fetchTodo();
    });
  }
}

// Finally, we are using NotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final asyncTodosProvider =
    AsyncNotifierProvider<AsyncTodosNotifier, List<TodoAsync>>(() {
  return AsyncTodosNotifier();
});
