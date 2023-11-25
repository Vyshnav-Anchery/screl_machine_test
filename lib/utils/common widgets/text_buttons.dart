import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Function() function;
  final String text;
  const CustomTextButton(
      {super.key, required this.function, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(text),
    );
  }
}
