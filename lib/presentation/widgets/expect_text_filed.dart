import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpectTextFiled extends StatelessWidget {
  final bool isDecimal;
  final String hintText;
  final TextEditingController controller;
  const ExpectTextFiled({super.key, this.isDecimal = true, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: isDecimal
          ? <TextInputFormatter>[
              _PositiveIntegerInputFormatter(),
            ]
          : <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              _PositiveIntegerInputFormatter(),
            ],
      textAlign: TextAlign.center,
      maxLength: isDecimal ? 5 : 3,
      style: Theme.of(context).textTheme.displayMedium,
      decoration: InputDecoration(
        counterText: '',
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
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
    );
  }
}

class _PositiveIntegerInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Disallow input if it starts with zero or is negative
    if (newValue.text.startsWith('0') || newValue.text.startsWith('-')) {
      return oldValue;
    }
    return newValue;
  }
}
