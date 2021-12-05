import 'package:flutter/material.dart';

class NumberKey extends StatelessWidget {
  const NumberKey({
    Key? key,
    required this.text,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);
  final String text;
  final ValueSetter<String>? onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Material(
          color: Colors.grey.shade300,
          child: InkWell(
            onTap: () {
              onTextInput?.call(text);
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}
