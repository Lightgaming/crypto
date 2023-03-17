import 'package:crypto/calculator_screen.dart';
import 'package:crypto/formulas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  ThemeMode themeMode = ThemeMode.dark;

  void toggleThemeMode() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(useMaterial3: true),
        theme: ThemeData(useMaterial3: true),
        routes: {
          '/': (context) => CalculatorScreen(
                themeMode: themeMode,
                toggleThemeMode: toggleThemeMode,
              ),
          '/formulas': (context) => Formulas(
                themeMode: themeMode,
                toggleThemeMode: toggleThemeMode,
              ),
        });
  }
}
