import 'package:flutter/material.dart';

void snackBarMessage(BuildContext context,{required String text,required Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    ),
  );
}
