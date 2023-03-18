import 'package:crypto/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class Formulas extends StatelessWidget {
  const Formulas({
    super.key,
    required this.themeMode,
    required this.toggleThemeMode,
  });

  final ThemeMode themeMode;
  final VoidCallback toggleThemeMode;

  Widget buildFormula(String title, String tex) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        SelectableMath.tex(
          tex,
          textStyle: TextStyle(
            fontSize: 32,
            color: themeMode == ThemeMode.dark ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        themeMode: themeMode,
        toggleThemeMode: toggleThemeMode,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Formulas',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                buildFormula(
                  'ECIES',
                  r''' 
                  \begin{aligned} 
                  Y&= b * G \\ 
                  R&= a * G \\ 
                  S&= M + a * Y \\
                  Z&= -b * R \\
                  M&= Z + S \\
                  \end{aligned}
                  ''',
                ),
                buildFormula(
                  'ECDSA',
                  r''' 
                  \begin{aligned} 
                  Y&= b * G \\ 
                  R&= a * G \\ 
                  r&= x_3  \mod{p} \\
                  s&= \frac{hash(m) + b * r}{a} \mod{p} \\
                  u&= \frac{hash(m)}{s} \mod{p} \\
                  z&= \frac{r}{s} \mod{p} \\
                  (x_3, y_3)&= V = u * G + z * Y \\
                  v&= x_3 \pmod{p} \\
                  v&= r \\
                  \end{aligned}
                  ''',
                ),
                buildFormula(
                  'ECDH',
                  r''' 
                  \begin{aligned} 
                  A: \alpha&= a * G \mod{p} \\
                  B: \beta&= b * G \mod{p} \\
                  S_A&= a* \beta \mod{p} \\
                  S_B&= b * \alpha \mod{p} \\
                  \end{aligned}
                  ''',
                ),
              ],
            ),
          ),
        ));
  }
}
