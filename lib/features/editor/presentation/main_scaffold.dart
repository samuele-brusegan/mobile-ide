import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_ide/features/editor/presentation/code_editor.dart';
import 'package:mobile_ide/features/file_explorer/presentation/file_explorer.dart';
import 'package:mobile_ide/features/file_explorer/providers/file_provider.dart';
import 'package:mobile_ide/core/theme/app_theme.dart';

class MainScaffold extends ConsumerWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFile = ref.watch(activeFileProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 600;

        if (isDesktop) {
          // Tablet / Desktop Layout
          return Scaffold(
            body: Row(
              children: [
                SizedBox(
                  width: 250,
                  child: FileExplorer(),
                ),
                const VerticalDivider(width: 1, color: AppColors.divider),
                Expanded(
                  child: CodeEditor(),
                ),
              ],
            ),
          );
        } else {
          // Mobile Layout
          return Scaffold(
            appBar: AppBar(
              title: Text(activeFile != null 
                ? activeFile.path.split('/').last 
                : 'Mobile IDE'),
            ),
            drawer: const Drawer(
              width: 280,
              child: FileExplorer(),
            ),
            body: const CodeEditor(),
          );
        }
      },
    );
  }
}
