
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const url = 'https://bit.ly/3qYOtDm';

enum Action {
  rotateLeft,
  rotateRight,
  moreVisable,
  lessVisable,
}

@immutable
class State {
  final double rotationDeg;
  final double alpha;

  const State({required this.rotationDeg, required this.alpha});

  const State.zero()
      : rotationDeg = 0.0,
        alpha = 1.0;

  State rotateRight() => State(
        rotationDeg: rotationDeg + 10,
        alpha: alpha,
      );
  State rotateLeft() => State(
        rotationDeg: rotationDeg - 10,
        alpha: alpha,
      );
  State increaseAlpha() =>
      State(rotationDeg: rotationDeg, alpha: min(alpha + 0.1, 1.0));
  State decreaseAlpha() =>
      State(rotationDeg: rotationDeg, alpha: min(alpha - 0.1, 1.0));
}

State reducer(State oldState, Action? action) => switch (action) {
      Action.rotateLeft => oldState.rotateLeft(),
      Action.rotateRight => oldState.rotateRight(),
      Action.moreVisable => oldState.increaseAlpha(),
      Action.lessVisable => oldState.decreaseAlpha(),
      null => oldState,
    };

class FlipImage2Page extends HookWidget {
  const FlipImage2Page({super.key});

  @override
  Widget build(BuildContext context) {
// create a store object that holds onto the actual state and we can dispatch values/actions to make a new state

    final store = useReducer<State, Action?>(
      reducer,
      initialState: const State.zero(),
      initialAction: null,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flip Image Page'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  store.dispatch(Action.rotateLeft);
                },
                child: const Text('Rotate Left'),
              ),
              TextButton(
                onPressed: () {
                  store.dispatch(Action.rotateRight);
                },
                child: const Text('Rotate Right'),
              ),
              TextButton(
                onPressed: () {
                  store.dispatch(Action.lessVisable);
                },
                child: const Text('- Alpha'),
              ),
              TextButton(
                onPressed: () {
                  store.dispatch(Action.moreVisable);
                },
                child: const Text('+ Alpha'),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Opacity(
            opacity: store.state.alpha,
            child: RotationTransition(
              turns: AlwaysStoppedAnimation(store.state.rotationDeg / 360.0),
              child: Image.network(url),
            ),
          ),
        ],
      ),
    );
  }
}
