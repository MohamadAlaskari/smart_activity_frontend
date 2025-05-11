import 'package:flutter/material.dart';
import 'package:vibe_day/assets/colors.gen.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.labelText,
    required this.initialValue,
    required this.onChanged,
    this.errorText,
    super.key,
    this.obscureText = false,
    this.autofillHints,
    this.keyboardType,
    this.suffixIcon,
  });

  final String labelText;
  final String? initialValue;
  final Function(String) onChanged;
  final bool obscureText;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey.shade800),
        errorText: errorText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: ColorName.colorAccent,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: ColorName.colorAccent,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey, width: 1.0),
        ),
        suffixIcon: suffixIcon,
      ),
      obscureText: obscureText,
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
