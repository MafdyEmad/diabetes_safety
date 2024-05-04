import 'package:flutter/material.dart';

void showSnackBar(context, Widget content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: content,
  ));
}
