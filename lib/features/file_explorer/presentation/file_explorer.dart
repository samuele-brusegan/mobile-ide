import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_ide/core/theme/app_theme.dart';
import 'package:mobile_ide/features/file_explorer/providers/file_provider.dart';
import 'package:path/path.dart' as path;

class FileExplorer extends ConsumerWidget {
  const FileExplorer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fileListAsync = ref.watch(fileListProvider);
    final activeFile = ref.watch(activeFileProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: const Text('Files'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            // ignore: unused_result
            onPressed: () => ref.refresh(fileListProvider),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: const Icon(Icons.add),
        onPressed: () => _showCreateFileDialog(context, ref),
      ),
      body: fileListAsync.when(
        data: (files) {
          if (files.isEmpty) {
            return const Center(child: Text("No files. Create one!"));
          }
          return ListView.separated(
            itemCount: files.length,
            separatorBuilder: (c, i) => const Divider(height: 1, thickness: 0.5),
            itemBuilder: (context, index) {
              final file = files[index]; // FileSystemEntity
              if (file is! File) return const SizedBox.shrink(); // Skip directories for now
              
              final fileName = path.basename(file.path);
              final isActive = activeFile?.path == file.path;

              return ListTile(
                selected: isActive,
                selectedTileColor: AppColors.primary.withValues(alpha: 0.1),
                leading: Icon(
                  _getFileIcon(fileName),
                  color: isActive ? AppColors.primary : AppColors.textSecondary,
                ),
                title: Text(
                   fileName,
                   style: TextStyle(
                     color: isActive ? AppColors.primary : AppColors.text,
                     fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                   ),
                ),
                onTap: () {
                  ref.read(activeFileProvider.notifier).open(file);
                  // If on mobile (Drawer), close it
                  if (Scaffold.of(context).hasDrawer && Scaffold.of(context).isDrawerOpen) {
                    Navigator.of(context).pop();
                  }
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  IconData _getFileIcon(String filename) {
    if (filename.endsWith('.py')) return Icons.code; // Python icon approx
    if (filename.endsWith('.js')) return Icons.javascript;
    return Icons.description;
  }

  void _showCreateFileDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("New File"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "example.py"),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = controller.text.trim();
              if (name.isNotEmpty) {
                // Default content
                String content = "";
                if (name.endsWith('.py')) content = "print('Hello World')\n";
                if (name.endsWith('.js')) content = "console.log('Hello World');\n";
                
                await ref.read(fileServiceProvider).createFile(name, content);
                // ignore: unused_result
                ref.refresh(fileListProvider);
                if (ctx.mounted) {
                  Navigator.pop(ctx);
                }
              }
            },
            child: const Text("Create"),
          )
        ],
      ),
    );
  }
}
