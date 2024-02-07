import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
MySnackBar({
  required BuildContext context,
  required String message,
  String label = "بستن",
  void Function()? onPress,
  Duration duration = const Duration(seconds: 3),
  bool isWarning = false,
}) {
  final snackBar = SnackBar(
    action: SnackBarAction(label: label, onPressed: onPress ?? () {}),
    duration: duration,
    content: Text(
      message,
      style: const TextStyle(fontFamily: 'Yekan'),
    ),
    backgroundColor: isWarning ? Colors.red : Colors.grey.shade700,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
