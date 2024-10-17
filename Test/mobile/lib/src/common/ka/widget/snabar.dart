import 'package:flutter/material.dart';

showSnackBar(
    {required BuildContext context,
      required Color color,
      required String msg}) {
  final snackBar = SnackBar(
    content: Text(msg),
    backgroundColor: color,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}