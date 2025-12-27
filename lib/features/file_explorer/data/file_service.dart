import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:mobile_ide/core/constants/app_constants.dart';

class FileService {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<List<FileSystemEntity>> getFiles() async {
    final localPath = await _localPath;
    final dir = Directory(localPath);
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    
    // Simple verification file
    final demoFile = File('$localPath/welcome.txt');
    if (!await demoFile.exists()) {
      await demoFile.writeAsString('Welcome to Mobile IDE!\n\nThis is a simple text editor.');
    }
    
    final List<FileSystemEntity> files = dir.listSync().where((entity) {
       if (entity is File) {
         final ext = path.extension(entity.path).replaceAll('.', '');
         return AppConstants.supportedExtensions.contains(ext);
       }
       return false;
    }).toList();
    
    // Sort by name
    files.sort((a, b) => path.basename(a.path).compareTo(path.basename(b.path)));
    
    return files;
  }

  Future<File> createFile(String fileName, String content) async {
    final localPath = await _localPath;
    final file = File('$localPath/$fileName');
    return file.writeAsString(content);
  }

  Future<String> readFile(File file) async {
    return file.readAsString();
  }

  Future<void> saveFile(String path, String content) async {
    final file = File(path);
    await file.writeAsString(content);
  }
}
