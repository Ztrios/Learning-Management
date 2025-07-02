import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  final GoRouterState? state;

  const ErrorPage({super.key, this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page Not Found")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Icon(Icons.error_outline, size: 80, color: Colors.red),
            const SizedBox(height: 16),
            const Text(
              "Oops! Page Not Found",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            if (state != null) ...[
              const SizedBox(height: 8),
              Text(
                  state?.error?.message ?? "",
                  style: TextStyle(color: Colors.grey)
              ),
            ],

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
              child: const Text("Go to Home"),
            ),

          ],
        ),
      ),
    );
  }
}
