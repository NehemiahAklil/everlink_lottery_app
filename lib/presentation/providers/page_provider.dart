import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'page_provider.g.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() {
    return 0;
  }

  void setIndex(index) {
    state = index;
  }

  void decrementIndex() {
    state = state - 1;
  }

  void incrementIndex() {
    state = state + 1;
  }
}
