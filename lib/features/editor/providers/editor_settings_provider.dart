import 'package:mobile_ide/core/constants/app_constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'editor_settings_provider.g.dart';

@riverpod
class EditorFontSize extends _$EditorFontSize {
  @override
  double build() => AppConstants.defaultFontSize;

  void zoomIn() {
    if (state < AppConstants.maxFontSize) state += 1;
  }

  void zoomOut() {
    if (state > AppConstants.minFontSize) state -= 1;
  }
  
  void setSize(double size) {
    if (size >= AppConstants.minFontSize && size <= AppConstants.maxFontSize) {
      state = size;
    }
  }
}
