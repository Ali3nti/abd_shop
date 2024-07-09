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
    return Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [Checkbox(
              activeColor: Colors.indigoAccent,
              shape: CircleBorder(),
              value: Value,
              onChanged: (val){
                setState(() {
                  Value = val!;
                });
              }
          ),
      ],  ),
      );

  }
}
