## flutter_riverpod_l

There are a total of 8 pages in this project. Including 6 legacy provider pages and 2 new features pages.

# Legacy Providers 

1. Provider page. Using a Provider to provide a simple String. [Provider Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/legacy_provider_pages/provider_page.dart)

2. State provider page. Using a stateProvider to provide an integer value to act as a simple counter. [State Provider Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/legacy_provider_pages/state_provider_page.dart)

3. State notifier provider page. Using a stateNotifierProvider to create and subscribe to a User object. [State Notifier Provider Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/legacy_provider_pages/state_notifier_page.dart). [User class](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/user.dart)

4. Change notifer provider page. This page is similar to the state notifier provider page but using a change notifier provider page. [Change Notifier Provider Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/legacy_provider_pages/change_notifier_page.dart)

5. Future provider page. Getting a user from a user API and showing their name based on the id. [Future Provider Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/legacy_provider_pages/future_provider_page.dart). [UserFuture class file](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/user_future.dart)

6. Stream provider page. Using a stream provider create and subscribe to a stream and monitor the changes. In this case, change the UI everytime a new value is added to the list/stream. [Stream Provider Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/legacy_provider_pages/stream_provider_page.dart)

The declaretion for all providers of pages above can be found in the main.dart file. [Main file](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/main.dart)


# New features

1. Notifier Provider. Using a notifier provider to create a list of todo objects. Has methods to modify the list. [Todo Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/new_features_pages/todo_page.dart). [todo.dart](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/new_features_pages/todo.dart)

2. Async Notifier Provider. Using an async notifier provider to get data from a json api. Has methods to modify datas. [Todo Async Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/new_features_pages/todo_async_page.dart). [todo_async.dart](https://github.com/TuanMPhan/flutter_/blob/main/flutter_riverpod_l/lib/new_features_pages/todo_async.dart)