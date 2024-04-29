import 'package:flutter/material.dart';

void showMessage(context, {Widget? title, Widget? content, List<Widget>? actions}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: title,
      content: content,
      actions: actions,
    ),
  );
}
