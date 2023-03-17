import 'package:crypto/calculator.dart';
import 'package:crypto/point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({
    super.key,
    required this.themeMode,
  });

  final ThemeMode themeMode;

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final calculator = Calculator();
  final kController = TextEditingController();
  final modController = TextEditingController();
  final x1Controller = TextEditingController();
  final y1Controller = TextEditingController();
  final x2Controller = TextEditingController();
  final y2Controller = TextEditingController();
  String resultText = '';

  String? valueIsNotEmptyAndNumber(String? string) {
    if (string == null || string.isEmpty) {
      return 'Value is required';
    }
    if (int.tryParse(string) == null) {
      return 'Value must be a number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FocusTraversalGroup(
                        policy: OrderedTraversalPolicy(),
                        child: Form(
                          key: _formKey1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Point + Point'),
                                TextFormField(
                                  controller: modController,
                                  validator: valueIsNotEmptyAndNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'Mod',
                                  ),
                                ),
                                TextFormField(
                                  controller: x1Controller,
                                  validator: valueIsNotEmptyAndNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'x1',
                                  ),
                                ),
                                TextFormField(
                                  controller: y1Controller,
                                  validator: valueIsNotEmptyAndNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'y1',
                                  ),
                                ),
                                TextFormField(
                                  controller: x2Controller,
                                  validator: valueIsNotEmptyAndNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'x2',
                                  ),
                                ),
                                TextFormField(
                                  controller: y2Controller,
                                  validator: valueIsNotEmptyAndNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'y2',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey1.currentState?.validate() ??
                                        false) {
                                      setState(() {
                                        resultText = calculator.addPointToPoint(
                                          Point(
                                            int.parse(x1Controller.text),
                                            int.parse(y1Controller.text),
                                          ),
                                          Point(
                                            int.parse(x2Controller.text),
                                            int.parse(y2Controller.text),
                                          ),
                                          int.parse(modController.text),
                                        );
                                      });
                                    }
                                  },
                                  child: const Text('Add'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FocusTraversalGroup(
                        policy: OrderedTraversalPolicy(),
                        child: Form(
                          key: _formKey2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('2 * Point'),
                                TextFormField(
                                  controller: kController,
                                  validator: valueIsNotEmptyAndNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'K',
                                  ),
                                ),
                                TextFormField(
                                  controller: modController,
                                  validator: valueIsNotEmptyAndNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'Mod',
                                  ),
                                ),
                                TextFormField(
                                  controller: x1Controller,
                                  validator: valueIsNotEmptyAndNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'x',
                                  ),
                                ),
                                TextFormField(
                                  controller: y1Controller,
                                  validator: valueIsNotEmptyAndNumber,
                                  decoration: const InputDecoration(
                                    labelText: 'y',
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey2.currentState?.validate() ??
                                        false) {
                                      setState(() {
                                        resultText =
                                            calculator.multiplyPointBy2(
                                          Point(
                                            int.parse(x1Controller.text),
                                            int.parse(y1Controller.text),
                                          ),
                                          int.parse(kController.text),
                                          int.parse(modController.text),
                                        );
                                      });
                                    }
                                  },
                                  child: const Text('Multiply'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SelectableMath.tex(
                  resultText,
                  textStyle: TextStyle(
                    fontSize: 35,
                    color: widget.themeMode == ThemeMode.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.6),
                    width: 2,
                  ),
                ),
              ),
              height: kToolbarHeight,
              width: double.infinity,
              child: const Center(child: Text('Test')),
            )
          ],
        ),
      ),
    );
  }
}
