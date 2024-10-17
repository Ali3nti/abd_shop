import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            // عملکرد دکمه شارژ کیف پول
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal,
          ),
          child: const Text("شارژ کیف پول"),
        ),
        ElevatedButton(
          onPressed: () {
            // عملکرد دکمه برداشت از کیف پول
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
          ),
          child: const Text("برداشت از کیف پول"),
        ),
      ],
    );
  }
}
