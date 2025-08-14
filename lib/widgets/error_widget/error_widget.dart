import 'package:flutter/material.dart';

class ErrorViewWidget extends StatelessWidget {
  final String message;
  const ErrorViewWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(color: Colors.red, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }
}
