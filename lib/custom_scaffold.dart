import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.themeMode,
    required this.toggleThemeMode,
    required this.child,
  });

  final ThemeMode themeMode;
  final VoidCallback toggleThemeMode;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EC Point Multiplication / Addition Calculator'),
        actions: [
          // Change theme
          Switch(
            value: themeMode == ThemeMode.dark,
            onChanged: (_) => toggleThemeMode(),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
              title: const Text('Calculator'),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/formulas');
              },
              title: const Text('Formulas'),
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}
