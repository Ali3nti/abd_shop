import 'package:flutter/material.dart';

class StorPage extends StatefulWidget {
  const StorPage({super.key});

  @override
  State<StorPage> createState() => _StorPageState();
}

class _StorPageState extends State<StorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("stor page"),
      ),
    );
  }
}
