import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final bool isInt;
  final String label;
  const CustomFormField(
      {super.key,
      this.isInt = false,
      required this.label,
      required this.textEditingController,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      keyboardType: isInt ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        errorMaxLines: 2,
        label: Text(label),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
