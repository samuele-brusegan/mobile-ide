// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fileService)
const fileServiceProvider = FileServiceProvider._();

final class FileServiceProvider
    extends $FunctionalProvider<FileService, FileService, FileService>
    with $Provider<FileService> {
  const FileServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fileServiceHash();

  @$internal
  @override
  $ProviderElement<FileService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FileService create(Ref ref) {
    return fileService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FileService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FileService>(value),
    );
  }
}

String _$fileServiceHash() => r'60dd49ad3a0baccaf934d3be85807ed0ce176c54';

@ProviderFor(fileList)
const fileListProvider = FileListProvider._();

final class FileListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<FileSystemEntity>>,
          List<FileSystemEntity>,
          FutureOr<List<FileSystemEntity>>
        >
    with
        $FutureModifier<List<FileSystemEntity>>,
        $FutureProvider<List<FileSystemEntity>> {
  const FileListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fileListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fileListHash();

  @$internal
  @override
  $FutureProviderElement<List<FileSystemEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<FileSystemEntity>> create(Ref ref) {
    return fileList(ref);
  }
}

String _$fileListHash() => r'36eae7ab2f4741133f1da5324d454decb8dc87a1';

@ProviderFor(ActiveFile)
const activeFileProvider = ActiveFileProvider._();

final class ActiveFileProvider extends $NotifierProvider<ActiveFile, File?> {
  const ActiveFileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeFileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeFileHash();

  @$internal
  @override
  ActiveFile create() => ActiveFile();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(File? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<File?>(value),
    );
  }
}

String _$activeFileHash() => r'e228c1b1ec86b05bfa8fe28d3e4984e7e6743ed8';

abstract class _$ActiveFile extends $Notifier<File?> {
  File? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<File?, File?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<File?, File?>,
              File?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(activeFileContent)
const activeFileContentProvider = ActiveFileContentProvider._();

final class ActiveFileContentProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, FutureOr<String?>>
    with $FutureModifier<String?>, $FutureProvider<String?> {
  const ActiveFileContentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeFileContentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeFileContentHash();

  @$internal
  @override
  $FutureProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String?> create(Ref ref) {
    return activeFileContent(ref);
  }
}

String _$activeFileContentHash() => r'dbf3192c2e5e5de57f9f7214d773748bbf01abfb';
