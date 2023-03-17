import 'package:crypto/custom_scaffold.dart';
import 'package:flutter/material.dart';

class Formulas extends StatelessWidget {
  const Formulas({
    super.key,
    required this.themeMode,
    required this.toggleThemeMode,
  });

  final ThemeMode themeMode;
  final VoidCallback toggleThemeMode;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      themeMode: themeMode,
      toggleThemeMode: toggleThemeMode,
      child: const Placeholder(),
    );
  }
}
