import 'package:flutter/material.dart';

Future<void> showAccountDeleteDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap a button
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Delete Account',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        content: const Text(
          'Are you sure you want to delete your account? '
              'This action cannot be undone.',
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
              // Call your delete function here
              // deleteAccount();
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}
