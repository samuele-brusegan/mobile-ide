// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'editor_settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditorFontSize)
const editorFontSizeProvider = EditorFontSizeProvider._();

final class EditorFontSizeProvider
    extends $NotifierProvider<EditorFontSize, double> {
  const EditorFontSizeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editorFontSizeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editorFontSizeHash();

  @$internal
  @override
  EditorFontSize create() => EditorFontSize();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$editorFontSizeHash() => r'c54c0497313dbfa1b5de719f601126186ddc5356';

abstract class _$EditorFontSize extends $Notifier<double> {
  double build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<double, double>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<double, double>,
              double,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
