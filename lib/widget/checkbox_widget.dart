import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool Value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.indigoAccent,
      shape: const CircleBorder(),
      value: Value,
      onChanged: (val) {
        setState(() {
          Value = val!;
        });
      },
    );
  }
}
