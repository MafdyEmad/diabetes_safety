import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  const AuthTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: TextFormField(
        cursorColor: AppPalette.primaryButtonColorLight,
        validator: validator,
        controller: controller,
        style: Theme.of(context).textTheme.displayMedium,
        decoration: InputDecoration(
          prefixIconColor: Colors.grey,
          prefixIcon: prefixIcon,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
