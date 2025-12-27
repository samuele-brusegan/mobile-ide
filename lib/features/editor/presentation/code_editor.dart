import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/all.dart' as all_languages;
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import 'package:mobile_ide/core/theme/app_theme.dart';
import 'package:mobile_ide/features/editor/providers/editor_settings_provider.dart';
import 'package:mobile_ide/features/file_explorer/providers/file_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeEditor extends ConsumerStatefulWidget {
  const CodeEditor({super.key});

  @override
  ConsumerState<CodeEditor> createState() => _CodeEditorState();
}

class _CodeEditorState extends ConsumerState<CodeEditor> {
  CodeController? _codeController;
  String? _currentFilePath;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _codeController?.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _initializeController(String content, String filePath) {
    if (_codeController != null) {
      _codeController!.dispose();
    }
    
    final extension = filePath.split('.').last;
    var language = all_languages.builtinLanguages[extension] ?? all_languages.builtinLanguages['txt'];
    if (extension == 'py') language = python;
    if (extension == 'js') language = javascript;

    _codeController = CodeController(
      text: content,
      language: language,
    );
    _currentFilePath = filePath;
  }

  @override
  Widget build(BuildContext context) {
    final activeFile = ref.watch(activeFileProvider);
    final fontSize = ref.watch(editorFontSizeProvider);
    final activeFileContentAsync = ref.watch(activeFileContentProvider);

    if (activeFile == null) {
      return const Center(child: Text("Select a file to start editing", style: TextStyle(color: AppColors.textSecondary)));
    }

    return activeFileContentAsync.when(
      data: (content) {
        if (content == null) return const SizedBox.shrink();

        // Initialize controller only if file changed
        if (_currentFilePath != activeFile.path) {
          _initializeController(content, activeFile.path);
        }

        if (_codeController == null) return const CircularProgressIndicator();

        return Column(
          children: [
            Expanded(
              child: GestureDetector(
                onScaleUpdate: (details) {
                  if (details.scale > 1.0) {
                     ref.read(editorFontSizeProvider.notifier).zoomIn();
                  } else if (details.scale < 1.0) {
                     ref.read(editorFontSizeProvider.notifier).zoomOut();
                  }
                },
                child: CodeTheme(
                  data: CodeThemeData(styles: atomOneDarkTheme),
                  child: SingleChildScrollView(
                    child: CodeField(
                      controller: _codeController!,
                      focusNode: _focusNode,
                      textStyle: GoogleFonts.jetBrainsMono(
                        fontSize: fontSize,
                        height: 1.5,
                      ),
                      lineNumberStyle: const LineNumberStyle(
                        width: 48,
                        margin: 4,
                        textStyle: TextStyle(color: AppColors.editorGutterText),
                        textAlign: TextAlign.right,
                        background: AppColors.editorGutter, 
                      ),
                      background: AppColors.editorBackground,
                      onChanged: (val) {
                        // Save debounce logic could go here, for now direct save
                         ref.read(fileServiceProvider).saveFile(activeFile.path, val);
                      },
                    ),
                  ),
                ),
              ),
            ),
            _buildAccessoryBar(),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, s) => Center(child: Text('Error: $e')),
    );
  }

  Widget _buildAccessoryBar() {
    // Only show if focused on mobile/tablet? Or always?
    // Requirement: "a row above the keyboard"
    // If keyboard is not visible, it can sit at the bottom or be hidden.
    // For simplicity, we keep it visible at bottom.
    
    final symbols = [';', '{', '}', '(', ')', '[', ']', '<', '>', '=', '_', '"'];

    return Container(
      height: 48,
      color: AppColors.surface,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: symbols.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (_codeController != null) {
                // Insert symbol at cursor
                final text = _codeController!.text;
                final selection = _codeController!.selection;
                final newText = text.replaceRange(selection.start, selection.end, symbols[index]);
                _codeController!.value = TextEditingValue(
                  text: newText,
                  selection: TextSelection.collapsed(offset: selection.start + 1),
                );
                // Trigger save
                if (_currentFilePath != null) {
                   ref.read(fileServiceProvider).saveFile(_currentFilePath!, newText);
                }
              }
            },
            child: Container(
              width: 40,
              alignment: Alignment.center,
              child: Text(
                symbols[index],
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
