import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hitText,
    this.vlaidationText,
    this.obsText,
    this.keyBoradType,
  });

  final controller;
  final hitText;
  final vlaidationText;
  final obsText;
  final keyBoradType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hitText,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
      obscureText: obsText,
      keyboardType: keyBoradType,
      validator: vlaidationText,
    );
  }
}
