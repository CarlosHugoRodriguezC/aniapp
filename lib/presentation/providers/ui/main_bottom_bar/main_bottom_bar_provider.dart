import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_bottom_bar_provider.g.dart';



@riverpod
class BottomBarIndex extends _$BottomBarIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(int index) {
    state = index;
  }
}