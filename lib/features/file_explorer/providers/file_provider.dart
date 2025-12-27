import 'dart:io';
import 'package:mobile_ide/features/file_explorer/data/file_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_provider.g.dart';

@riverpod
FileService fileService(Ref ref) {
  return FileService();
}

@riverpod
Future<List<FileSystemEntity>> fileList(Ref ref) async {
  final service = ref.watch(fileServiceProvider);
  return service.getFiles();
}

@riverpod
class ActiveFile extends _$ActiveFile {
  @override
  File? build() => null;

  void open(File file) {
    state = file;
  }

  void close() {
    state = null;
  }
}

// Separate provider for the content of the active file designed to be read once or refreshed
@riverpod
Future<String?> activeFileContent(Ref ref) async {
  final file = ref.watch(activeFileProvider);
  if (file == null) return null;
  
  final service = ref.watch(fileServiceProvider);
  return service.readFile(file);
}
