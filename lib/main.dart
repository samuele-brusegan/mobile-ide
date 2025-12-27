import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_ide/core/theme/app_theme.dart';
import 'package:mobile_ide/features/editor/presentation/main_scaffold.dart';

void main() {
  runApp(const ProviderScope(child: MobileIdeApp()));
}

class MobileIdeApp extends StatelessWidget {
  const MobileIdeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile IDE',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const MainScaffold(),
    );
  }
}
