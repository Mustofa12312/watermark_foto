import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Menyimpan index tab bottom navigation
final navigationControllerProvider =
    StateNotifierProvider<NavigationController, int>(
      (ref) => NavigationController(),
    );

class NavigationController extends StateNotifier<int> {
  NavigationController() : super(0);

  void changeTab(int index) {
    state = index;
  }
}
