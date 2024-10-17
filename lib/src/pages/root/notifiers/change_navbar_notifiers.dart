import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNavbarNotifier extends StateNotifier<NavbarIndexState> {
  ChangeNavbarNotifier() : super(NavbarIndexState(0, 0));

  void selectTab(int index, AnimationController animationController) {
    if (state.currentIndex != index) {
      animationController.reverse().then((_) {
        updateIndex(index);
        animationController.forward(from: 0);
      });
    } else {
      animationController.reset();
      animationController.forward();
    }
  }

  void updateIndex(int newIndex) {
    state = NavbarIndexState(newIndex, state.currentIndex);
  }
}

final bottomNavControllerProvider =
    StateNotifierProvider<ChangeNavbarNotifier, NavbarIndexState>(
        (ref) => ChangeNavbarNotifier());

class NavbarIndexState {
  final int currentIndex;
  final int previousIndex;

  NavbarIndexState(this.previousIndex, this.currentIndex);
}
