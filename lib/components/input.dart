import 'package:flutter/cupertino.dart';

class Input extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType type;

  const Input(this.label, this.hint, this.controller, this.type);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CupertinoTextField(
        prefix: Padding(
          child: Text(label + ':'),
          padding: const EdgeInsets.all(8),
        ),
        placeholder: hint,
        controller: controller,
        keyboardType: type,
      ),
    );
  }
}
