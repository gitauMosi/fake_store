import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateNotifier for managing selected page index
class SelectedPageIndexNotifier extends StateNotifier<int> {
  SelectedPageIndexNotifier() : super(0);

  void updateIndex(int index) {
    state = index;
  }
}

// Riverpod provider for SelectedPageIndexNotifier
final selectedPageIndexProvider =
    StateNotifierProvider<SelectedPageIndexNotifier, int>(
        (ref) => SelectedPageIndexNotifier());
