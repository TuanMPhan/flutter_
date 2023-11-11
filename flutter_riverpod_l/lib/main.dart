import 'package:flutter/material.dart';
import 'package:flutter_riverpod_l/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_l/logger_riverpod.dart';
import 'package:flutter_riverpod_l/user.dart';
import 'package:flutter_riverpod_l/user_future.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
part 'main.g.dart';

// Providers

// Provider: is great for accessing dependencies and objects that don’t change.
final nameProvider = Provider<String>((ref) => 'A String');

// StateProvider: is great for storing simple state objects that can change, such as a counter value
final counterProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

// StateNotifier and StateNoitifierProvider: ideal for managing state that may change in reaction to an event or user interaction.
final userProvider = StateNotifierProvider.autoDispose<UserNotifier, User>(
    (ref) => UserNotifier(const User(name: '', age: 0)));

// ChangeNotifierProvider:  is part of the Flutter SDK. We can use it to store some state and notify listeners when it changes.
/// The ChangeNotifier API makes it easy to break two important rules: immutable state and unidirectional data flow.
/// As a result, ChangeNotifier is discouraged, and we should use StateNotifier instead.
final userChangeNotifierProvider =
    ChangeNotifierProvider((ref) => UserNotifierChange());

/// FutureProvider: use for Future/ Asynchronous calls. Can be use for:
/// perform and cache asynchronous operations (such as network requests)
/// handle the error and loading states of asynchronous operations
/// combine multiple asynchronous values into another value
/// re-fetch and refresh data (useful for pull-to-refresh operations)

@riverpod
Future<UserFuture> fetchUserFuture(FetchUserFutureRef ref, String input) {
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.fetchFuture(input);
}

// final fetchUserProvider =
//     FutureProvider.family.autoDispose((ref, String input) {
//   final userRepository = ref.watch(userRepositoryProvider);
//   return userRepository.fetchFuture(input);
// });

// StreamProvider: Use StreamProvider to watch a Stream of results from a realtime API and reactively rebuild the UI.
/// usually used for:
/// listening to firebase or web-sockets
/// rebuilding another provider every few seconds
/// video streaming, weather broadcasting apis or live chat
// final streamProvider = StreamProvider.autoDispose((ref) async* {
//   List<int> list = [];
//   for (var i = 0; i < 21; i++) {
//     await Future.delayed(const Duration(seconds: 1));
//     list = [...list, i];
//     yield list;
//   }
// });

final messageProvider = StreamProvider.autoDispose<String>((ref) async* {
  // Open the connection
  final channel =
      IOWebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));

  // Close the connection when the stream is destroyed
  ref.onDispose(() => channel.sink.close());

  // Parse the value received and emit a Message instance
  await for (final value in channel.stream) {
    yield value.toString();
  }
});
void main() {
  runApp(
    ProviderScope(
      observers: [
        LoggerRiverpod(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Riverpod Learn',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.dark,
            surface: const Color(0xff003909)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
