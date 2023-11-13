## flutter_hooks

1. Using a useTextEditingController() to get user's input. useState('') Create an orginal state and update it with the value obtained from the user's input. Then use useEffect() to show on screen what the user is typing. [First page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_hooks_learn/lib/existing_hooks_page.dart)

2. Using useMemoized to cache a complex object (a picture in this case) obtained from the web then use useFuture() to consume that future. [Second Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_hooks_learn/lib/future_memoized_page.dart)

3. useMemoized to cache to CountDown object and useListenable to call build everytime the countdown changes its value. [Third Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_hooks_learn/lib/countdown_page.dart)

4. Use useAnimationController to change change the opacity and size of an image as we scroll the page up and down. [Fourth Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_hooks_learn/lib/scroll_image_page.dart)

5. Use useStreamController to create a stream and create events for it. Using the stream controller to add value to the stream everytime the user tap on the screen and rotate the image. [Fifth Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_hooks_learn/lib/flip_image_page.dart)

6. Use useReducer to dispatch actions (rotateLeft, rotateRight, brighten, darken) to the old state. [Sixth Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_hooks_learn/lib/flip_image_2_page.dart)

7. Use useAppLifecycleState to rebuild the widget when a lifecycle value changes. In this case, hides the card information when the user unfocus from the app/screen. [Seventh Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_hooks_learn/lib/life_cycle_page.dart)

8. Create a custom hooks to create an infinite timer. [Nineth Page](https://github.com/TuanMPhan/flutter_/blob/main/flutter_hooks_learn/lib/custom_hook_page.dart). [custom_hook.dart](https://github.com/TuanMPhan/flutter_/blob/main/flutter_hooks_learn/lib/custom_hook.dart)