import 'package:diabetes_safety/core/theme/palette.dart';
import 'package:flutter/material.dart';

void showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black.withAlpha(150),
    context: context,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: PopScope(
          canPop: false,
          child: Center(
            child: CircularProgressIndicator(color: AppPalette.primaryButtonColorLight),
          ),
        ),
      );
    },
  );
}
