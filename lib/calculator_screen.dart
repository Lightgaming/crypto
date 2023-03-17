import 'package:crypto/calculator_view.dart';
import 'package:crypto/custom_scaffold.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({
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
      child: CalculatorView(
        themeMode: themeMode,
      ),
    );
  }
}
